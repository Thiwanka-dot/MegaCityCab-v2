package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateAvailabilityServlet", urlPatterns = {"/UpdateAvailabilityServlet"})
public class UpdateAvailabilityServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Thiwanka122/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        String userEmail = (session != null) ? (String) session.getAttribute("email") : null;

        if (userEmail == null) {
            response.sendRedirect("Form/Login.jsp");
            return;
        }

        String availability = request.getParameter("availability"); // "Available" or "Unavailable"

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("UPDATE drivers SET availability = ? WHERE email = ?")) {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            stmt.setString(1, availability);
            stmt.setString(2, userEmail);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("accounts/Driver/Driver.jsp?success=Availability updated!");
            } else {
                response.sendRedirect("accounts/Driver/Driver.jsp?error=Update failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("accounts/Driver/Driver.jsp?error=Database error!");
        }
    }
}
