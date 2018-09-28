package com.getachieve.lib;

import com.getachieve.Db;
import com.getachieve.model.Coord;
import com.getachieve.model.GeoBounds;

import static db.Tables.MATERIAL_SYNTHESIS;
import static db.Tables.MATERIALS;
import static db.Tables.GEO_MATERIALS;
import static db.Tables.USER_MATERIALS;
import static org.jooq.impl.DSL.field;
import db.tables.records.GeoMaterialsRecord;
import db.tables.records.MaterialSynthesisRecord;
import db.tables.records.MaterialsRecord;
import db.tables.records.UserMaterialsRecord;
import org.apache.commons.lang3.ArrayUtils;
import org.jooq.Record;
import org.jooq.Result;
import org.jooq.types.UInteger;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class MaterialsManager {
    private static int MATERIALS_PER_KM2 = 4;
    private static double BOUNDS_WIDTH_DEGREE = 0.05;
    private static double COLLECT_DISTANCE_METRES = 200;

    public void generate(GeoBounds tileBounds, int uid)
    {
        double tileAreaMetres = GeoCalc.area(tileBounds);
        int materialsPerTile = (int)Math.round((tileAreaMetres/1000000) * MATERIALS_PER_KM2);

        Result<MaterialsRecord> materials = Db.create.selectFrom(MATERIALS)
                .where(MATERIALS.GENERATION.equal((byte)0))
                .fetch();
        Random rand = new Random();
        for (int i = 0; i < materialsPerTile; i++) {
            MaterialsRecord randomMaterial = materials.get(rand.nextInt(materials.size()));
            Coord randomCoord = tileBounds.getRandomCoord();
            Db.create.insertInto(GEO_MATERIALS)
                    .set(GEO_MATERIALS.MATERIAL_ID, randomMaterial.getId())
                    .set(GEO_MATERIALS.USER_ID, uid)
                    .set(GEO_MATERIALS.COORD, randomCoord.toSql())
            .execute();
        }

        TilesMaterialManager tilesManager = TilesMaterialManager.getInstance();
        tilesManager.create(tileBounds);
    }

    public List<Map<String, Object>> fetchNearest(Coord location, int uid) {
        GeoBounds bounds = getMaterialBounds(location);

        return Db.create.select(GEO_MATERIALS.ID, GEO_MATERIALS.MATERIAL_ID,
                    field("ST_X(coord)").as("lat"), field("ST_Y(coord)").as("lon"),
                    MATERIALS.NAME, MATERIALS.IMAGE, MATERIALS.GENERATION)
                .from(GEO_MATERIALS.join(MATERIALS).on(MATERIALS.ID.eq(GEO_MATERIALS.MATERIAL_ID)))
                .where(GEO_MATERIALS.USER_ID.equal(uid))
                .and("st_contains(" + bounds.toSqlPolygon() + ", coord)")
                .and(GEO_MATERIALS.COLLECTED.eq((byte)0))
                .fetchMaps()
        ;
    }

    public boolean collect(long geoMaterialId, Coord location, int uid) {

        Record rawGeoMaterials = Db.create
                .select(GEO_MATERIALS.ID, GEO_MATERIALS.MATERIAL_ID, GEO_MATERIALS.USER_ID, GEO_MATERIALS.COLLECTED,
                        field("ST_X(coord)").as("lat"), field("ST_Y(coord)").as("lon")
                ).from(GEO_MATERIALS)
            .where(GEO_MATERIALS.ID.eq(geoMaterialId))
            .fetchOne();
        GeoMaterialsRecord geoMaterial = rawGeoMaterials.into(GEO_MATERIALS);
        if (geoMaterial.getUserId() != uid || geoMaterial.getCollected() == 1) {
            return false;
        }

        Coord materialCoord = new Coord(rawGeoMaterials);
        double distanceToMaterialMetres = GeoCalc.distance(location, materialCoord);
        if (distanceToMaterialMetres > COLLECT_DISTANCE_METRES) {
            return false;
        }

        geoMaterial.setCollected((byte)1);
        geoMaterial.store();

        UserMaterialsRecord userMaterialsRecord = (UserMaterialsRecord) Db.create.select().from(USER_MATERIALS)
                .where(USER_MATERIALS.USER_ID.eq(uid))
                .and(USER_MATERIALS.MATERIAL_ID.eq(geoMaterial.getMaterialId()))
                .fetchOne();
        if (userMaterialsRecord == null) {
            userMaterialsRecord = Db.create.newRecord(USER_MATERIALS);
            userMaterialsRecord.setMaterialId(geoMaterial.getMaterialId());
            userMaterialsRecord.setUserId(uid);
            userMaterialsRecord.setCnt(1);
        } else {
            userMaterialsRecord.setCnt(userMaterialsRecord.getCnt()+1);
        }

        return userMaterialsRecord.store() != 0;
    }

    public List<Map<String, Object>> fetchCollected(int uid) {
        return Db.create.select(MATERIALS.ID, MATERIALS.NAME, MATERIALS.IMAGE, USER_MATERIALS.CNT)
                .from(USER_MATERIALS.join(MATERIALS).on(MATERIALS.ID.eq(USER_MATERIALS.MATERIAL_ID)))
                .where(USER_MATERIALS.USER_ID.eq(uid))
                .fetchMaps();
    }

    public MaterialsRecord checkSynthesis(Map<String, Object> materialsMap) {

        int[] materialIds = parseMaterialIds(materialsMap);
        String sql = "select parent_id from material_synthesis where child_id in(" + Db.idsToStr(materialIds) + ")" +
                " group by parent_id having count(*) = "+materialsMap.size();
        List<Record> rows = Db.create.fetch(sql);
        if (rows == null) {
            return null;
        }

        UInteger parentId = null;
        for (Record parentRow : rows) {
            parentId = (UInteger)parentRow.getValue("parent_id");
            Result<MaterialSynthesisRecord> materialsSynthesis = Db.create.fetch(MATERIAL_SYNTHESIS,
                    MATERIAL_SYNTHESIS.PARENT_ID.eq(parentId.intValue()));

            for (MaterialSynthesisRecord materialSynthesis : materialsSynthesis) {
                Object requiredCnt = materialsMap.get(materialSynthesis.getChildId().toString());
                if (requiredCnt == null || Byte.parseByte(requiredCnt.toString()) != materialSynthesis.getCnt()) {
                    parentId = null;
                    break;
                }
            }
            if (parentId != null) {
                break;
            }
        }
        if (parentId == null) {
            return null;
        }

        return Db.create.fetchOne(MATERIALS, MATERIALS.ID.eq(parentId.intValue()));
    }

    public boolean synthesize(Map<String, Object> materialsMap, MaterialsRecord newMaterial, int uid) {

        int[] fromMaterialIds = parseMaterialIds(materialsMap);
        Result<UserMaterialsRecord> userMaterials = Db.create.select().from(USER_MATERIALS)
                .where(USER_MATERIALS.USER_ID.eq(uid))
                .and(USER_MATERIALS.MATERIAL_ID.in(ArrayUtils.toObject(fromMaterialIds)))
                .and(USER_MATERIALS.CNT.ge(0))
                .fetchInto(USER_MATERIALS);

        if (userMaterials.size() < materialsMap.size()) {
            return false;
        }
        for (UserMaterialsRecord userMaterial : userMaterials) {
            int requiredCnt = (int)materialsMap.get(userMaterial.getMaterialId().toString());
            if (requiredCnt > userMaterial.getCnt()) {
                return false;
            }
        }

        for (UserMaterialsRecord userMaterial : userMaterials) {
            int requiredCnt = (int)materialsMap.get(userMaterial.getMaterialId().toString());
            if (userMaterial.getCnt() == requiredCnt) {
                userMaterial.delete();
            } else {
                userMaterial.setCnt(userMaterial.getCnt() - requiredCnt);
                userMaterial.store();
            }
        }

        UserMaterialsRecord userNewMaterial = (UserMaterialsRecord) Db.create.select().from(USER_MATERIALS)
            .where(USER_MATERIALS.USER_ID.eq(uid))
            .and(USER_MATERIALS.MATERIAL_ID.eq(newMaterial.getId()))
            .fetchOne();
        if (userNewMaterial == null) {
            userNewMaterial = Db.create.newRecord(USER_MATERIALS);
            userNewMaterial.setUserId(uid);
            userNewMaterial.setMaterialId(newMaterial.getId());
            userNewMaterial.setCnt(1);
        } else {
            userNewMaterial.setCnt(userNewMaterial.getCnt()+1);
        }

        return userNewMaterial.store() != 0;
    }

    private GeoBounds getMaterialBounds(Coord location) {
        Coord sw = new Coord(location.lat - BOUNDS_WIDTH_DEGREE, location.lon - BOUNDS_WIDTH_DEGREE);
        Coord ne = new Coord(sw.lat + BOUNDS_WIDTH_DEGREE, sw.lon + BOUNDS_WIDTH_DEGREE);

        return new GeoBounds(sw, ne);
    }

    private int[] parseMaterialIds(Map<String, Object> materialsMap) {

        int[] materialIds = new int[materialsMap.size()];
        int i = 0;
        for (Map.Entry<String, Object> entry : materialsMap.entrySet()) {
            materialIds[i] = Integer.parseInt(entry.getKey());
            i++;
        }

        return materialIds;
    }






    // Singleton
    private static volatile MaterialsManager instance;
    private static Object mutex = new Object();
    private MaterialsManager() {
    }
    public static MaterialsManager getInstance() {
        MaterialsManager result = instance;
        if (result == null) {
            synchronized (mutex) {
                result = instance;
                if (result == null)
                    instance = result = new MaterialsManager();
            }
        }
        return result;
    }

}
