package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DistancePricingServlet", urlPatterns = {"/DistancePricingServlet"})
public class DistancePricingServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Thiwanka122/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String startLoc = request.getParameter("startLoc");
        String endLoc = request.getParameter("endLoc");
        String distanceNo = request.getParameter("distanceNo");
        String timeTaken = request.getParameter("timeTaken");
        String disPrice = request.getParameter("disPrice");

        HttpSession session = request.getSession();

        // Validation
        if (startLoc == null || startLoc.trim().isEmpty() ||
                endLoc == null || endLoc.trim().isEmpty() ||
                distanceNo == null || distanceNo.trim().isEmpty() ||
                timeTaken == null || timeTaken.trim().isEmpty() ||
                disPrice == null || disPrice.trim().isEmpty()) {
            session.setAttribute("message", "Invalid input. Please fill in all fields.");
            response.sendRedirect(request.getContextPath() + "/accounts/Admin/DistancePrice.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO distance (startLocation, endLocation, distance_amt, time_taken, total_price) VALUES (?, ?, ?, ?, ?)") ) {
                
                stmt.setString(1, startLoc);
                stmt.setString(2, endLoc);
                stmt.setInt(3, Integer.parseInt(distanceNo));
                stmt.setDouble(4, Double.parseDouble(timeTaken));
                stmt.setInt(5, Integer.parseInt(disPrice));
                
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    session.setAttribute("message", "Distance price added successfully!");
                } else {
                    session.setAttribute("message", "Failed to add distance price.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Database error!");
        }
        
        response.sendRedirect(request.getContextPath() + "/accounts/Admin/DistancePrice.jsp");
    }
}
