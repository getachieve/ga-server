package com.getachieve;

import org.jooq.DSLContext;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;

import java.sql.*;

public class Db {
    public static Connection conn;
    public static DSLContext create;
    public Db()
    {
        String userName = "root";
        String password = "sovjelanid";
        String url 		= "jdbc:mariadb://localhost:3306/getachieve";

        // Connection is the only JDBC resource that we need
        // PreparedStatement and ResultSet are handled by jOOQ, internally
        try {
            conn   = DriverManager.getConnection(url, userName, password);
            create = DSL.using(Db.conn, SQLDialect.MARIADB);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
