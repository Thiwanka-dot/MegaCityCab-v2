package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminCustomerUpdateServlet", urlPatterns = {"/AdminCustomerUpdateServlet"})
public class AdminCustomerUpdateServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        String dbURL = "jdbc:mysql://localhost:3306/cab_booking";
        String dbUser = "root";
        String dbPassword = "Thiwanka122/";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String updateQuery = "UPDATE customers SET first_name=?, last_name=?, nic=?, phone=?, address=? WHERE email=?";
            java.sql.PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, nic);
            pstmt.setString(4, phone);
            pstmt.setString(5, address);
            pstmt.setString(6, email);

            int updatedRows = pstmt.executeUpdate();
            conn.close();

            if (updatedRows > 0) {
                session.setAttribute("message", "Profile updated successfully.");
            } else {
                session.setAttribute("message", "Profile update failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "An error occurred while updating the profile.");
        }

        // Redirect back to dashboard
        response.sendRedirect("accounts/Admin/CustomerDet.jsp");
    }
}
