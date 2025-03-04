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

@WebServlet(name = "DiscountServlet", urlPatterns = {"/DiscountServlet"})
public class DiscountServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Thiwanka122/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String discountCode = request.getParameter("discountCode");
        String discountAmt = request.getParameter("discountAmt");

        HttpSession session = request.getSession();

        // Validation
        if (discountCode == null || discountCode.trim().isEmpty() || discountAmt == null || discountAmt.trim().isEmpty()) {
            session.setAttribute("message", "Invalid input. Please fill in all fields.");
            response.sendRedirect(request.getContextPath() + "/accounts/Admin/Discounts.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO discounts (discountCode, discountPrice) VALUES (?, ?)")) {
                
                stmt.setString(1, discountCode);
                stmt.setInt(2, Integer.parseInt(discountAmt)); // Ensure valid integer
                
                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    session.setAttribute("message", "Discount added successfully!");
                } else {
                    session.setAttribute("message", "Failed to add discount.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Database error!");
        }
        
        response.sendRedirect(request.getContextPath() + "/accounts/Admin/Discounts.jsp");
    }
}
