package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DriverRegisterServlet", urlPatterns = {"/DriverRegisterServlet"})
public class DriverRegisterServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Thiwanka122/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String license = request.getParameter("license");
        String vehicleNo = request.getParameter("vehicleNo");
        String vehicleModel = request.getParameter("vehicleModel");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/Form/Register.jsp?error=Passwords do not match.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check if the email already exists
            String checkEmailQuery = "SELECT email FROM drivers WHERE email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkEmailQuery);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                rs.close();
                checkStmt.close();
                conn.close();
                response.sendRedirect(request.getContextPath() + "/Form/Register.jsp?error=Email already exists.");
                return;
            }
            rs.close();
            checkStmt.close();

            // Hash password
            String hashedPassword = hashPassword(password);

            // Insert data
            String query = "INSERT INTO drivers (first_name, last_name, email, phone, license_no, vehicle_no, vehicle_model, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, license);
            stmt.setString(6, vehicleNo);
            stmt.setString(7, vehicleModel);
            stmt.setString(8, hashedPassword);

            int rowsInserted = stmt.executeUpdate();
            stmt.close();
            conn.close();

            if (rowsInserted > 0) {
                response.sendRedirect(request.getContextPath() + "/Form/Login.jsp?message=Registration successful.");
            } else {
                response.sendRedirect(request.getContextPath() + "/Form/Register.jsp?error=Registration failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Form/Register.jsp?error=Database error.");
        }
    }

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = md.digest(password.getBytes());
        StringBuilder sb = new StringBuilder();
        for (byte b : hashedBytes) sb.append(String.format("%02x", b));
        return sb.toString();
    }
}
