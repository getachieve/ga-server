package com.getachieve.lib;

import com.getachieve.model.Coord;
import com.getachieve.model.GeoBounds;

public class GeoCalc {

    /**
     * IN metres
     * @param coord1
     * @param coord2
     * @return
     */
    public static double distance(Coord coord1, Coord coord2) {

        final int R = 6370986; // Average radius of the earth in meters
        double latDistance = Math.toRadians(Math.abs(coord2.lat - coord1.lat));
        double lonDistance = Math.toRadians(Math.abs(coord2.lon - coord1.lon));
        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
                + Math.cos(Math.toRadians(coord1.lat)) * Math.cos(Math.toRadians(coord2.lat))
                * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = R * c;

        return distance;
    }

    /**
     * In metres
     * @param bounds
     * @return
     */
    public static double area(GeoBounds bounds) {

        Coord nw = new Coord(bounds.ne.lat, bounds.sw.lon);

        return distance(bounds.sw, nw) * distance(nw, bounds.ne);
    }
}
