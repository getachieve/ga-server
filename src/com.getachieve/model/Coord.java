package com.getachieve.model;

import org.jooq.Field;
import org.json.JSONObject;

import static org.jooq.impl.DSL.field;

public class Coord {
    public final double lat;
    public final double lon;

    public Coord(double lat, double lon) {
        this.lat = lat;
        this.lon = lon;
    }

    public Coord(JSONObject json) {
        this.lat = json.getDouble("lat");
        this.lon = json.getDouble("lon");
    }

    public String toString() {
        return String.valueOf(this.lat) + "," + String.valueOf(this.lon);
    }

    public Field<String> toSql() {
        return field("Point(" + this.toString() + ")", String.class);
    }
}