package com.getachieve.controller;

import com.getachieve.Session;
import com.getachieve.lib.MaterialManager;
import com.getachieve.lib.TilesMaterialManager;
import com.getachieve.model.Coord;
import com.getachieve.model.GeoBounds;
import org.jooq.tools.json.JSONArray;
import org.json.JSONObject;
import java.util.List;
import java.util.Map;

public class ObjectsController extends Controller {
    public ObjectsController(Session s) {
        super(s);
    }

    public JSONObject get(JSONObject args)  {
        TilesMaterialManager tilesManager = TilesMaterialManager.getInstance();
        MaterialManager materialsManager = MaterialManager.getInstance();
        Coord location = new Coord(args);

        GeoBounds tileBounds = tilesManager.getTileBounds(location);
        if (!tilesManager.existMaterials(tileBounds)) {
            System.out.println("generate materials");
            materialsManager.generate(tileBounds, session.getUserId());
        }
        List<Map<String, Object>> materials = materialsManager.fetchNearest(location, session.getUserId());

        return new JSONObject().put("materials", new JSONArray(materials));
    }
}
