package com.getachieve.model;

public class GeoBounds {
    public final Coord sw;
    public final Coord ne;

    public GeoBounds(Coord sw, Coord ne) {
        this.sw = sw;
        this.ne = ne;
    }
}
