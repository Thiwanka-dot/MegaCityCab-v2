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

@WebServlet(name = "AdminDriverUpdateServlet", urlPatterns = {"/AdminDriverUpdateServlet"})
public class AdminDriverUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String license = request.getParameter("license");
        String vehicleNo = request.getParameter("vehicleNo");
        String vehicleModel = request.getParameter("vehicleModel");

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/cab_booking";
        String dbUser = "root";
        String dbPassword = "Thiwanka122/";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Corrected SQL query with proper column names and parameters
            String updateQuery = "UPDATE drivers SET first_name=?, last_name=?, phone=?, license_no=?, vehicle_no=?, vehicle_model=? WHERE email=?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, phone);
            pstmt.setString(4, license);
            pstmt.setString(5, vehicleNo);
            pstmt.setString(6, vehicleModel);
            pstmt.setString(7, email);

            int updatedRows = pstmt.executeUpdate();

            if (updatedRows > 0) {
                session.setAttribute("message", "Profile updated successfully.");
            } else {
                session.setAttribute("message", "Profile update failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "An error occurred while updating the profile.");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        // Redirect back to dashboard
        response.sendRedirect("accounts/Admin/DriverDet.jsp");
    }
}
