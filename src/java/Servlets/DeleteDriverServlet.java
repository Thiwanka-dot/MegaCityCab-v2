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

@WebServlet(name = "DeleteDriverServlet", urlPatterns = {"/DeleteDriverServlet"})
public class DeleteDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String driverIDParam = request.getParameter("driverID");

        if (driverIDParam == null || driverIDParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/accounts/Admin/DriverDet.jsp?error=MissingDriverID");
            return;
        }

        int driverID = Integer.parseInt(driverIDParam);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab_booking", "root", "Thiwanka122/");
            String query = "DELETE FROM drivers WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, driverID);
            stmt.executeUpdate();

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/accounts/Admin/DriverDet.jsp");
    }
}
