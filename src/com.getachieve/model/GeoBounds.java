package com.getachieve.model;

import java.util.concurrent.ThreadLocalRandom;

public class GeoBounds {
    public final Coord sw;
    public final Coord ne;

    public GeoBounds(Coord sw, Coord ne) {
        this.sw = sw;
        this.ne = ne;
    }

    public Coord getRandomCoord()
    {
        return new Coord(
                getRandomDoubleBetweenRange(sw.lat, ne.lat),
                getRandomDoubleBetweenRange(sw.lon, ne.lon)
        );
    }

    public String toSqlPolygon()
    {
        return "ST_GeomFromText('POLYGON(("
                +sw.lat+" "+sw.lon+","
                +sw.lat+" "+ne.lon+","
                +ne.lat+" "+ne.lon+","
                +ne.lat+" "+sw.lon+","
                +sw.lat+" "+sw.lon
                +"))')";
    }

    private static double getRandomDoubleBetweenRange(double min, double max) {
        return Math.round(ThreadLocalRandom.current().nextDouble(min, max) * 100000000d)/100000000d;
    }

}
