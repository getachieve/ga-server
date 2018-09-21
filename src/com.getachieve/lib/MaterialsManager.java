package com.getachieve.lib;

import com.getachieve.Db;
import com.getachieve.model.Coord;
import com.getachieve.model.GeoBounds;
import static db.tables.Materials.MATERIALS;
import static db.tables.GeoMaterials.GEO_MATERIALS;
import static org.jooq.impl.DSL.field;
import db.tables.records.MaterialsRecord;
import org.jooq.Result;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class MaterialsManager {
    private static int MATERIALS_PER_TILE = 8;
    private static double BOUNDS_WIDTH_DEGREE = 0.05;

    public void generate(GeoBounds tileBounds, int uid)
    {
        Result<MaterialsRecord> materials = Db.create.selectFrom(MATERIALS)
                .where(MATERIALS.GENERATION.equal((byte)0))
                .fetch();
        Random rand = new Random();
        for (int i = 0; i < MATERIALS_PER_TILE; i++) {
            MaterialsRecord randomMaterial = materials.get(rand.nextInt(materials.size()));
            Coord randomCoord = getRandomFromBounds(tileBounds);
            Db.create.insertInto(GEO_MATERIALS)
                    .set(GEO_MATERIALS.MATERIAL_ID, randomMaterial.getId())
                    .set(GEO_MATERIALS.USER_ID, uid)
                    .set(GEO_MATERIALS.COORD, randomCoord.toSql())
            .execute();
        }

        TilesMaterialManager tilesManager = TilesMaterialManager.getInstance();
        tilesManager.create(tileBounds);
    }

    public List<Map<String, Object>> fetch(Coord location, int uid) {
        GeoBounds bounds = getMaterialBounds(location);

        return Db.create.select(GEO_MATERIALS.ID, GEO_MATERIALS.MATERIAL_ID,
                    field("x(coord)").as("lat"), field("y(coord)").as("lon"),
                    MATERIALS.NAME, MATERIALS.IMAGE, MATERIALS.GENERATION)
                .from(GEO_MATERIALS.join(MATERIALS).on(MATERIALS.ID.eq(GEO_MATERIALS.MATERIAL_ID)))
                .where(GEO_MATERIALS.USER_ID.equal(uid))
                .and(GEO_MATERIALS.COORD.greaterOrEqual(bounds.sw.toSql()))
                .and(GEO_MATERIALS.COORD.greaterOrEqual(bounds.ne.toSql()))
                .fetchMaps()
        ;
    }

    private GeoBounds getMaterialBounds(Coord location) {
        Coord sw = new Coord(location.lat - BOUNDS_WIDTH_DEGREE, location.lon - BOUNDS_WIDTH_DEGREE);
        Coord ne = new Coord(sw.lat + BOUNDS_WIDTH_DEGREE, sw.lon + BOUNDS_WIDTH_DEGREE);

        return new GeoBounds(sw, ne);
    }

    private Coord getRandomFromBounds(GeoBounds tileBounds)
    {
        return new Coord(
            getRandomDoubleBetweenRange(tileBounds.sw.lat, tileBounds.ne.lat),
            getRandomDoubleBetweenRange(tileBounds.sw.lon, tileBounds.ne.lon)
        );
    }

    private static double getRandomDoubleBetweenRange(double min, double max) {
        double x = (Math.random()*((max-min)+1))+min;
        return x;
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
