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

@WebServlet(name = "UpdateBookingStatusServlet", urlPatterns = {"/UpdateBookingStatusServlet"})
public class UpdateBookingStatusServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Thiwanka122/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("Form/Login.jsp");
            return;
        }

        String status = request.getParameter("status");
        String bookingIdParam = request.getParameter("bookingId");

        if (status == null || bookingIdParam == null) {
            response.sendRedirect("accounts/Driver/Bookings.jsp?error=Invalid request!");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdParam);

            Class.forName("com.mysql.cj.jdbc.Driver"); // Load Driver
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement("UPDATE booking SET status = ? WHERE id = ?")) {

                stmt.setString(1, status);
                stmt.setInt(2, bookingId);

                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    response.sendRedirect("accounts/Driver/Bookings.jsp?success=Booking status updated!");
                } else {
                    response.sendRedirect("accounts/Driver/Bookings.jsp?error=Update failed!");
                }
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("accounts/Driver/Bookings.jsp?error=Invalid booking ID!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("accounts/Driver/Bookings.jsp?error=Database error!");
        }
    }
}
