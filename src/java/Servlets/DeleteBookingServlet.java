package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteBookingServlet", urlPatterns = {"/DeleteBookingServlet"})
public class DeleteBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIDParam = request.getParameter("bookingID");

        if (bookingIDParam == null || bookingIDParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/accounts/Customer/ViewBookings.jsp?error=MissingBookingID");
            return;
        }

        int bookingID = Integer.parseInt(bookingIDParam);

        try {
            Connection conn = null;
            conn = DBConnection.getConnection();
            String query = "DELETE FROM booking WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, bookingID);
            stmt.executeUpdate();

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/accounts/Customer/ViewBookings.jsp");
    }
}
