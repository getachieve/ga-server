package com.getachieve;

import org.json.JSONObject;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Map;

public class Session {
	private DataOutputStream out;
	private Map user;

	public void init(Socket link) {
		try {
			OutputStream output = link.getOutputStream();
			out = new DataOutputStream(output);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public boolean send(String path, JSONObject params) {
		try {
			params.put("path", path);
			System.out.println("sending "+params);
			out.write(params.toString().getBytes());
			out.flush();
			reset();
			return true;
		} catch (Exception e){
			e.printStackTrace();
			reset();
			return false;
		}
	}
	public boolean send(String path) {
		return send(path, new JSONObject());
	}
	public void setUser(Map map) {
		this.user = map;
	}
	public Map getUser() {
		return this.user;
	}
	public int getUserId() {
		return this.user!=null ? (int)this.user.get("id") : null;
	}
	public boolean isLogin() {
		return this.user != null;
	}
	private void reset() {
	}
}

