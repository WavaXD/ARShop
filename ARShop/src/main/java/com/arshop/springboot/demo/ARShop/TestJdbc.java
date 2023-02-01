package com.arshop.springboot.demo.ARShop;

import java.sql.DriverManager;

public class TestJdbc {
    public TestJdbc() {
    }

    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/ARShop_database?useSSL=false&serverTimezone=UTC";
        String user = "hbstudent";
        String pass = "hbstudent";

        try {
            System.out.println("Connecting to database : " + jdbcUrl);
            DriverManager.getConnection(jdbcUrl, user, pass);
            System.out.println("Connection successful!!!");
        } catch (Exception var5) {
            var5.printStackTrace();
        }

    }
}