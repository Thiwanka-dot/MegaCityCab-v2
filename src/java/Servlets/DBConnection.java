package Servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String USER = "root";
    private static final String PASSWORD = "Thiwanka122/";

    public static Connection getConnection() throws SQLException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver Not Found!");
            e.printStackTrace();
            throw new SQLException("Database Driver Not Found", e);
        }
        return conn;
    }
}
