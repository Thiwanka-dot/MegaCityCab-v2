<%@page import="Servlets.DBConnection"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,600;1,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../acc.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <li><a href="../Admin/Admin.jsp"><i class="fa fa-home"></i><span>Home</span></a></li>
                    <li><a href="../Admin/CabBooking.jsp" class="active"><i class="fa fa-tasks"></i><span>Cab Bookings</span></a></li>
                    <li><a href="../Admin/CustomerDet.jsp"><i class="fa fa-tasks"></i><span>Customer Details</span></a></li>
                    <li><a href="../Admin/DriverDet.jsp"><i class="fa fa-tasks"></i><span>Driver Details</span></a></li>
                    <li><a href="../Admin/DistancePrice.jsp"><i class="fa fa-tasks"></i><span>Distance Pricing</span></a></li>
                    <li><a href="../Admin/DistancePrice.jsp"><i class="fa fa-tasks"></i><span>Distance Pricing</span></a></li>
                    <li><a href="../Admin/Discounts.jsp"><i class="fa fa-tasks"></i><span>Discounts</span></a></li>                    
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
                            <th>Start Location</th>
                            <th>End Location</th>
                            <th>Customer</th>
                            <th>Driver</th>
                            <th>Contact</th>
                            <th>Driver Contact</th>
                            <th>Address</th>
                            <th>Total Price</th>
                            <th>Booking Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Connection conn = null;
                        conn = DBConnection.getConnection();

                        String query = "SELECT b.id, b.startLocation, b.endLocation, b.userName, d.first_name, d.last_name, b.contact, b.driverContact, b.address, b.price, b.bookingDate, b.status " +
                                       "FROM booking b " +
                                       "JOIN drivers d ON b.driver_id = d.id";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                    %>
                            <tr>
                                <td><%= rs.getString("startLocation") %></td>
                                <td><%= rs.getString("endLocation") %></td>
                                <td><%= rs.getString("userName") %></td>
                                <td><%= rs.getString("first_name") + " " + rs.getString("last_name") %></td>
                                <td><%= rs.getString("contact") %></td>
                                <td><%= rs.getString("driverContact") %></td>
                                <td><%= rs.getString("address") %></td>
                                <td><%= rs.getDouble("price") %> LKR</td>
                                <td><%= rs.getString("bookingDate") %></td>
                                <td>
                                    <button type="button" class="btn btn-outline-primary"><%= rs.getString("status") %></button>
                                    <%
                                        String status = rs.getString("status");
                                        if ("Pending".equals(status)) {
                                    %>
                                        <form action="<%= request.getContextPath() %>/DeleteBookingServlet2" method="post" style="display:inline;">
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
