package com.getachieve.controller;

import com.getachieve.Session;

abstract class Controller {
    protected Session session;

    protected Controller(Session s) {
        session = s;
    }
}
