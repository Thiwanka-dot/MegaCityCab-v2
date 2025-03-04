package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteDistancePriceServlet", urlPatterns = {"/DeleteDistancePriceServlet"})
public class DeleteDistancePriceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String priceIdParam = request.getParameter("priceID");

        if (priceIdParam == null || priceIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/accounts/Admin/DistancePrice.jsp?error=MissingPriceID");
            return;
        }

        int priceId = Integer.parseInt(priceIdParam);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab_booking", "root", "Thiwanka122/");
            String query = "DELETE FROM distance WHERE id=?";
            java.sql.PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, priceId);
            stmt.executeUpdate();

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/accounts/Admin/DistancePrice.jsp");
    }
}
