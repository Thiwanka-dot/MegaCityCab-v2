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

@WebServlet(name = "DeleteDiscountServlet", urlPatterns = {"/DeleteDiscountServlet"})
public class DeleteDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String discountIdParam = request.getParameter("discountID");

        if (discountIdParam == null || discountIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/accounts/Admin/Discounts.jsp?error=MissingDiscountID");
            return;
        }

        int discountID = Integer.parseInt(discountIdParam);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab_booking", "root", "Thiwanka122/");
            String query = "DELETE FROM discounts WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, discountID);
            stmt.executeUpdate();

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/accounts/Admin/Discounts.jsp");
    }
}
