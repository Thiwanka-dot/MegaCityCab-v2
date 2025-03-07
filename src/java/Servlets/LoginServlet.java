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
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    Connection conn = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            conn = DBConnection.getConnection();
            String hashedPassword = hashPassword(password);

            if (isValidUser(conn, email, hashedPassword, "admin")) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("userType", "admin");
                response.sendRedirect(request.getContextPath() + "/accounts/Admin/Admin.jsp");
                return;
            }

            if (isValidUser(conn, email, hashedPassword, "customers")) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("userType", "customer");
                response.sendRedirect(request.getContextPath() + "/accounts/Customer/Customer.jsp");
                return;
            }

            if (isValidUser(conn, email, hashedPassword, "drivers")) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("userType", "driver");
                response.sendRedirect(request.getContextPath() + "/accounts/Driver/Driver.jsp");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/Form/Login.jsp?error=Incorrect login! Try again!");

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Form/Login.jsp?error=Database error");
        }
    }

    private boolean isValidUser(Connection conn, String email, String password, String tableName) {
        String query = "SELECT * FROM " + tableName + " WHERE email=? AND password=?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            boolean userExists = rs.next();
            rs.close();
            return userExists;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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
