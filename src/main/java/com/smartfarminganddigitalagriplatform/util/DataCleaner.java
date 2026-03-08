package com.smartfarminganddigitalagriplatform.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DataCleaner {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/smart_farming_db?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";
        String password = "1234";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            System.out.println("Disabling foreign key checks...");
            stmt.executeUpdate("SET FOREIGN_KEY_CHECKS = 0");

            System.out.println("Clearing equipment_rentals table...");
            stmt.executeUpdate("TRUNCATE TABLE equipment_rentals");

            System.out.println("Clearing equipments table...");
            stmt.executeUpdate("TRUNCATE TABLE equipments");

            System.out.println("Enabling foreign key checks...");
            stmt.executeUpdate("SET FOREIGN_KEY_CHECKS = 1");

            System.out.println("Equipment and Rental data cleared successfully.");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
