package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TransferToDriverServlet", urlPatterns = {"/TransferToDriverServlet"})
public class TransferToDriverServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Thiwanka122/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("../../Form/Login.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");
        Connection conn = null;
        PreparedStatement selectStmt = null;
        PreparedStatement insertStmt = null;
        PreparedStatement deleteStmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            conn.setAutoCommit(false); // Start transaction

            // Retrieve customer details
            String selectQuery = "SELECT first_name, last_name, email, nic, password, phone, address FROM customers WHERE email = ?";
            selectStmt = conn.prepareStatement(selectQuery);
            selectStmt.setString(1, email);
            rs = selectStmt.executeQuery();

            if (rs.next()) {
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String licenseNumber = rs.getString("nic"); // Using NIC as license temporarily

                // Check if user is already a driver
                String checkDriverQuery = "SELECT email FROM drivers WHERE email = ?";
                try (PreparedStatement checkStmt = conn.prepareStatement(checkDriverQuery)) {
                    checkStmt.setString(1, email);
                    ResultSet checkRs = checkStmt.executeQuery();
                    if (checkRs.next()) {
                        response.sendRedirect("../../accounts/Customer/DriverTransfer.jsp?error=Already a driver.");
                        return;
                    }
                }

                // Insert into drivers table
                String insertQuery = "INSERT INTO drivers (first_name, last_name, email, password, phone, address, license_number, availability) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, firstName);
                insertStmt.setString(2, lastName);
                insertStmt.setString(3, email);
                insertStmt.setString(4, password);
                insertStmt.setString(5, phone);
                insertStmt.setString(6, address);
                insertStmt.setString(7, licenseNumber);
                insertStmt.setBoolean(8, true);
                insertStmt.executeUpdate();

                // Delete from customers table
                String deleteQuery = "DELETE FROM customers WHERE email = ?";
                deleteStmt = conn.prepareStatement(deleteQuery);
                deleteStmt.setString(1, email);
                deleteStmt.executeUpdate();

                conn.commit(); // Commit transaction

                // Update session and redirect to driver dashboard
                session.setAttribute("userRole", "driver");
                response.sendRedirect("../../accounts/Driver/Driver.jsp");
            } else {
                response.sendRedirect("../../accounts/Customer/DriverTransfer.jsp?error=User not found.");
            }
        } catch (SQLException e) {
            try { if (conn != null) conn.rollback(); } catch (SQLException ignored) {}
            e.printStackTrace();
            response.sendRedirect("../../accounts/Customer/DriverTransfer.jsp?error=Transfer failed. Try again.");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TransferToDriverServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (selectStmt != null) selectStmt.close(); } catch (SQLException ignored) {}
            try { if (insertStmt != null) insertStmt.close(); } catch (SQLException ignored) {}
            try { if (deleteStmt != null) deleteStmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }
}