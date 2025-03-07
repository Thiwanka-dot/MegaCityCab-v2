package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerRegisterServlet", urlPatterns = {"/CustomerRegisterServlet"})
public class CustomerRegisterServlet extends HttpServlet {

    Connection conn = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword"); 

        if (!password.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/Form/Register.jsp?error=Passwords do not match.");
            return;
        }

        try {
            conn = DBConnection.getConnection();

            String checkEmailQuery = "SELECT email FROM customers WHERE email = ?";
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

            String hashedPassword = hashPassword(password);

            String query = "INSERT INTO customers (first_name, last_name, email, nic, phone, address, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, nic);
            stmt.setString(5, phone);
            stmt.setString(6, address);
            stmt.setString(7, hashedPassword);

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
