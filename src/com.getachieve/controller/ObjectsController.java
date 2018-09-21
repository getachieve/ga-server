package com.getachieve.controller;

import com.getachieve.Session;
import com.getachieve.lib.MaterialsManager;
import com.getachieve.lib.TilesMaterialManager;
import com.getachieve.model.Coord;
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
        MaterialsManager materialsManager = MaterialsManager.getInstance();
        Coord location = new Coord(args);

        if (!tilesManager.existMaterials(location)) {
            System.out.println("generate materials");
            materialsManager.generate(tilesManager.getTileBounds(location), session.getUserId());
        }
        List<Map<String, Object>> materials = materialsManager.fetch(location, session.getUserId());

        return new JSONObject().put("materials", new JSONArray(materials));
    }
}
