package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteCustomerServlet2", urlPatterns = {"/DeleteCustomerServlet2"})
public class DeleteCustomerServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerIDParam = request.getParameter("customerID");

        if (customerIDParam == null || customerIDParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/accounts/Customer/Customer.jsp?error=MissingCustomerID");
            return;
        }

        int customerID = Integer.parseInt(customerIDParam);

        try {
            Connection conn = null;
            conn = DBConnection.getConnection();
            String query = "DELETE FROM customers WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, customerID);
            stmt.executeUpdate();

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/index.html");
    }
}
