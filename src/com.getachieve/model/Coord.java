package com.getachieve.model;

import org.jooq.Field;
import org.jooq.Record;
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
        JSONObject location = json.getJSONObject("location");
        this.lat = location.getDouble("lat");
        this.lon = location.getDouble("lon");
    }

    public Coord(Record record) {
        this.lat = (double) record.getValue("lat");
        this.lon = (double) record.getValue("lon");
    }

    public String toString() {
        return String.valueOf(this.lat) + "," + String.valueOf(this.lon);
    }

    public Field<String> toSql() {
        return field("Point(" + this.toString() + ")", String.class);
    }
}