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

@WebServlet(name = "BookCarServlet", urlPatterns = {"/BookCarServlet"})
public class BookCarServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Thiwanka122/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String contact = request.getParameter("contact");
        String startLoc = request.getParameter("startLoc");
        String endLoc = request.getParameter("endLoc");
        String address = request.getParameter("address");
        String availableDriver = request.getParameter("availableDriver");
        String vehicleNo = request.getParameter("vehicleNo");
        String driverCon = request.getParameter("driverCon");
        String discount = request.getParameter("discount");
        String price = request.getParameter("price");
        String paymentMethod = request.getParameter("paymentMethod");

        HttpSession session = request.getSession();

        if (customerName == null || customerName.trim().isEmpty() ||
            contact == null || contact.trim().isEmpty() ||
            startLoc == null || startLoc.trim().isEmpty() ||
            endLoc == null || endLoc.trim().isEmpty() ||
            address == null || address.trim().isEmpty() ||
            availableDriver == null || availableDriver.trim().isEmpty() ||
            price == null || price.trim().isEmpty() ||
            paymentMethod == null || paymentMethod.trim().isEmpty()) {
            session.setAttribute("message", "Invalid input. Please fill in all fields.");
            response.sendRedirect(request.getContextPath() + "/accounts/Customer/BookCar.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement stmt = conn.prepareStatement(
                         "INSERT INTO booking (userName, contact, startLocation, endLocation, address, driver_id, vehicle_no, driverContact, discountCode, price, paymentMethod) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

                stmt.setString(1, customerName);
                stmt.setString(2, contact);
                stmt.setString(3, startLoc);
                stmt.setString(4, endLoc);
                stmt.setString(5, address);
                stmt.setInt(6, Integer.parseInt(availableDriver));
                stmt.setString(7, vehicleNo);
                stmt.setString(8, driverCon);
                stmt.setString(9, discount != null ? discount : "");
                stmt.setDouble(10, Double.parseDouble(price));
                stmt.setString(11, paymentMethod);

                int rowsInserted = stmt.executeUpdate();
                session.setAttribute("message", rowsInserted > 0 ? "Booking successful!" : "Booking failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Database error: " + e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/accounts/Customer/BookCar.jsp");
    }
}


