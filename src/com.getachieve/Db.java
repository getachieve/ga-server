package com.getachieve;

import org.jooq.DSLContext;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;

import java.math.BigDecimal;
import java.math.MathContext;
import java.sql.*;
import java.util.Arrays;

public class Db {
    public static Connection conn;
    public static DSLContext create;
    public Db(String url, String login, String password)
    {
        // Connection is the only JDBC resource that we need
        // PreparedStatement and ResultSet are handled by jOOQ, internally
        try {
            conn   = DriverManager.getConnection(url, login, password);
            create = DSL.using(Db.conn, SQLDialect.MYSQL_8_0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String idsToStr(int[] intArray)
    {
        return String.join(",", Arrays.stream(intArray).mapToObj(String::valueOf).toArray(String[]::new));
    }

    public static BigDecimal doubleToDecimal(double val)
    {
        return new BigDecimal(val, MathContext.DECIMAL64);
    }
}
