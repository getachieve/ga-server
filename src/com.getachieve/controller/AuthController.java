package com.getachieve.controller;

import com.getachieve.Db;
import com.getachieve.Session;
import org.jooq.Record;
import org.json.JSONObject;

import static db.Tables.USERS;

public class AuthController extends Controller {

	public AuthController(Session s) {
		super(s);
	}
	public void askAuth() {
		session.send("auth/auth");
	}
	public JSONObject auth(JSONObject args)  {
		Record user = Db.create.selectFrom(USERS)
            .where(USERS.LOGIN.equal(args.getString("login")))
				.and(USERS.PASSWORD.equal(args.getString("password"))).fetchOne();
		String status = "error";
		if(user != null) {
			session.setUser(user.intoMap());
			status = "ok";
		}

		return new JSONObject().put("status", status);
	}
}
