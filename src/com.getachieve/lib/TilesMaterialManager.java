package com.getachieve.lib;

import com.getachieve.Db;
import com.getachieve.model.Coord;
import com.getachieve.model.GeoBounds;
import org.jooq.Record;

import static db.Tables.TILES_MATERIALS;

public class TilesMaterialManager {
    private static double TILE_WIDTH_DEGREE = 0.02;

    public GeoBounds getTileBounds(Coord location) {
        double latMod = location.lat % TILE_WIDTH_DEGREE;
        double lonMod = location.lon % TILE_WIDTH_DEGREE;
        Coord sw = new Coord(location.lat - latMod, location.lon - lonMod);
        Coord ne = new Coord(sw.lat + TILE_WIDTH_DEGREE, sw.lon + TILE_WIDTH_DEGREE);

        return new GeoBounds(sw, ne);
    }

    public boolean existMaterials(GeoBounds tileBounds) {
        Record tile = Db.create.selectFrom(TILES_MATERIALS)
                .where(TILES_MATERIALS.LAT_SOUTH.eq(Db.doubleToDecimal(tileBounds.sw.lat)))
                .and(TILES_MATERIALS.LON_WEST.eq(Db.doubleToDecimal(tileBounds.sw.lon)))
                .fetchOne();

        return tile != null;
    }

    public void create(GeoBounds bounds)
    {
        Db.create.insertInto(TILES_MATERIALS)
                .set(TILES_MATERIALS.LAT_SOUTH, Db.doubleToDecimal(bounds.sw.lat))
                .set(TILES_MATERIALS.LON_WEST, Db.doubleToDecimal(bounds.sw.lon))
                .execute()
        ;
    }





    // Singleton
    private static volatile TilesMaterialManager instance;
    private static Object mutex = new Object();
    private TilesMaterialManager() {
    }
    public static TilesMaterialManager getInstance() {
        TilesMaterialManager result = instance;
        if (result == null) {
            synchronized (mutex) {
                result = instance;
                if (result == null)
                    instance = result = new TilesMaterialManager();
            }
        }
        return result;
    }

}
