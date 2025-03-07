<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@page import="Servlets.DBConnection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../acc.css">
</head>
<body>
    <div class="acc-con">
        <nav>
            <div class="acc-logo">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
                <span><h3>Admin</h3></span>
            </div>
            <hr>
            <div class="nav-con">
                <ul>
                    <li><a href="../Customer/Customer.jsp"><i class="fa fa-home"></i><span>Home</span></a></li>
                    <li><a href="../Customer/BookCar.jsp"><i class="fa fa-tasks"></i><span>Booking Overview</span></a></li>
                    <li><a href="../Customer/ViewBookings.jsp" class="active"><i class="fa fa-tasks"></i><span>View Bookings</span></a></li>
                </ul>
                <div class="logout-btn">
                    <a href="<%= request.getContextPath() %>/LogoutServlet"><i class="fa fa-sign-out"></i><span>Logout</span></a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Manage Booking Details</h1>
            <div class="p-2"></div>
            <div class="booking-list p-4">
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Start Location</th>
                            <th>End Location</th>
                            <th>Driver Name</th>
                            <th>Vehicle No</th>
                            <th>Driver Contact</th>
                            <th>Total Price</th>
                            <th>Payment Method</th>
                            <th>Status and Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Connection conn = null;
                        conn = DBConnection.getConnection();

                        String query = "SELECT b.id, b.startLocation, b.endLocation, d.first_name, d.last_name, b.vehicle_no, b.driverContact, b.price, b.paymentMethod, b.status " +
                                       "FROM booking b " +
                                       "JOIN drivers d ON b.driver_id = d.id";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                    %>
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><%= rs.getString("startLocation") %></td>
                                <td><%= rs.getString("endLocation") %></td>
                                <td><%= rs.getString("first_name") + " " + rs.getString("last_name") %></td>
                                <td><%= rs.getString("vehicle_no") %></td>
                                <td><%= rs.getString("driverContact") %></td>
                                <td><%= rs.getDouble("price") %> LKR</td>
                                <td><%= rs.getString("paymentMethod") %></td>
                                <td>
                                    <button type="button" class="btn btn-outline-primary"><%= rs.getString("status") %></button>
                                    <%
                                        String status = rs.getString("status");
                                        if ("Pending".equals(status)) {
                                    %>
                                        <form action="<%= request.getContextPath() %>/DeleteBookingServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="bookingID" value="<%= rs.getInt("id") %>">
                                            <button type="submit" class="btn btn-danger">Cancel</button>
                                        </form>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                    <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    %>
                    </tbody>
                </table>
            </div>
            <div class="p-2"></div>
        </main>
    </div>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
