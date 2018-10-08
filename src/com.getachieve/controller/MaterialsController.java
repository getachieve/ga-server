package com.getachieve.controller;

import com.getachieve.Session;
import com.getachieve.lib.MaterialManager;
import com.getachieve.model.Coord;
import db.tables.records.MaterialsRecord;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public class MaterialsController extends Controller {
    public MaterialsController(Session s) {
        super(s);
    }

    public JSONObject collectMaterial(JSONObject args) {

        int geoMaterialId = args.getInt("geoMaterialId");
        Coord location = new Coord(args);

        MaterialManager materialsManager = MaterialManager.getInstance();
        boolean res = materialsManager.collect(geoMaterialId, location, session.getUserId());

        return new JSONObject().put("status", res);
    }

    public JSONObject getCollectedMaterials(JSONObject args)  {

        MaterialManager materialsManager = MaterialManager.getInstance();
        List<Map<String, Object>> materials = materialsManager.fetchCollected(session.getUserId());

        return new JSONObject().put("materials", new JSONArray(materials));
    }

    public JSONObject checkSynthesis(JSONObject args) {

        Map<String, Object> materialsMap = args.getJSONObject("materials").toMap();
        MaterialManager materialsManager = MaterialManager.getInstance();
        MaterialsRecord newMaterial = materialsManager.checkSynthesis(materialsMap);
        if (newMaterial == null) {
            return new JSONObject().put("status", false);
        }

        return new JSONObject().put("newMaterial", newMaterial.intoMap());
    }

    public JSONObject synthesize(JSONObject args) {

        Map<String, Object> materialsMap = args.getJSONObject("materials").toMap();
        MaterialManager materialsManager = MaterialManager.getInstance();
        MaterialsRecord newMaterial = materialsManager.checkSynthesis(materialsMap);
        if (newMaterial == null) {
            return new JSONObject().put("status", false);
        }

        boolean result = materialsManager.synthesize(materialsMap, newMaterial, session.getUserId());
        if (result == false) {
            return new JSONObject().put("status", false);
        }

        return getCollectedMaterials(new JSONObject());
    }


}
