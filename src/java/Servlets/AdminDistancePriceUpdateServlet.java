package Servlets;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminDistancePriceUpdateServlet", urlPatterns = {"/AdminDistancePriceUpdateServlet"})
public class AdminDistancePriceUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        String startLoc = request.getParameter("startLocEdit");
        String endLoc = request.getParameter("endLocEdit");
        String distanceNo = request.getParameter("distanceNoEdit");
        String timeTaken = request.getParameter("timeTakenEdit");
        String totalPrice = request.getParameter("disPriceEdit");

        Connection conn = null;

        try {
            conn = DBConnection.getConnection();

            String updateQuery = "UPDATE distance SET distance_amt=?, time_taken=?, total_price=? WHERE startLocation=? AND endLocation=?";
            java.sql.PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, distanceNo);
            pstmt.setString(2, timeTaken);
            pstmt.setString(3, totalPrice);
            pstmt.setString(4, startLoc);
            pstmt.setString(5, endLoc);

            int updatedRows = pstmt.executeUpdate();
            conn.close();

            if (updatedRows > 0) {
                session.setAttribute("message", "Distance price updated successfully.");
            } else {
                session.setAttribute("message", "Update failed. No matching records found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "An error occurred while updating the distance price.");
        }

        response.sendRedirect("accounts/Admin/DistancePrice.jsp");
    }
}
