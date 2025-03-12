<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="Servlets.DBConnection"%>

<%
    HttpSession userSession = request.getSession(false);
    String userEmail = (userSession != null) ? (String) userSession.getAttribute("email") : null;

    if (userEmail == null) {
        response.sendRedirect("../../Form/Login.jsp");
        return;
    }

    Connection conn = null;
    conn = DBConnection.getConnection();

    String userId = "";

    String query = "SELECT * FROM drivers WHERE email = ?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setString(1, userEmail);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        userId = rs.getString("id");
    }

    String bookingQuery = "SELECT b.id, b.startLocation, b.endLocation, b.userName, b.contact, b.address, b.price, b.paymentMethod, b.status " +
                          "FROM booking b " +
                          "JOIN drivers d ON b.driver_id = d.id " +
                          "WHERE d.id = ?" +
                          "ORDER BY b.id DESC";
    PreparedStatement bookingStmt = conn.prepareStatement(bookingQuery);
    bookingStmt.setString(1, userId);
    ResultSet bookingRs = bookingStmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../acc.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="acc-con">
        <nav>
            <div class="acc-logo">
                <i class="fa fa-user-circle"></i>
                <span><h3>Driver</h3></span> 
            </div>
            <hr>          
            <div class="nav-con">
                <ul>
                    <li><a href="../Driver/Driver.jsp"><i class="fa fa-home"></i><span>Home</span></a></li>
                    <li><a href="../Driver/Bookings.jsp" class="active"><i class="fa fa-tasks"></i><span>Booking Overview</span></a></li>
                </ul>
                <div class="logout-btn">
                    <a href="<%= request.getContextPath() %>/LogoutServlet"><i class="fa fa-sign-out"></i><span>Logout</span></a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Your Assigned Bookings</h1>
            <div class="p-2"></div>
            <div class="booking-list p-4">
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Start Location</th>
                            <th>End Location</th>
                            <th>Customer Name</th>
                            <th>Contact</th>
                            <th>Pickup Address</th>
                            <th>Total Price</th>
                            <th>Payment Method</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    boolean hasBookings = false;
                    while (bookingRs.next()) {
                        hasBookings = true;
                        int bookingId = bookingRs.getInt("id");
                        String currentStatus = bookingRs.getString("status");
%>
                        <tr>
                            <td><%= bookingId %></td>
                            <td><%= bookingRs.getString("startLocation") %></td>
                            <td><%= bookingRs.getString("endLocation") %></td>
                            <td><%= bookingRs.getString("userName") %></td>
                            <td><%= bookingRs.getString("contact") %></td>
                            <td><%= bookingRs.getString("address") %></td>
                            <td><%= bookingRs.getDouble("price") %> LKR</td>
                            <td><%= bookingRs.getString("paymentMethod") %></td>
                            <td>
                                 <% if ("Pending".equalsIgnoreCase(currentStatus)) { %>
                            <button class="btn btn-success" onclick="updateStatus('<%= bookingId %>', 'Confirmed', this)">Confirm</button>
                            <button class="btn btn-danger" onclick="updateStatus('<%= bookingId %>', 'Cancelled', this)">Withdraw</button>
                        <% } else { %>
                            <span class="btn btn btn-outline-primary"><%= currentStatus %></span>
                        <% } %>
                            </td>
                        </tr>
<%
                    }
                    if (!hasBookings) {
                        out.println("<tr><td colspan='9'>No bookings found.</td></tr>");
                    }
                    bookingRs.close();
                    bookingStmt.close();
                    conn.close();
%>
                    </tbody>
                </table>
            </div>
            <div class="p-2"></div>
        </main>
    </div>
    <button type="button" class="help position-fixed bottom-0 end-0 m-3" data-bs-toggle="modal" data-bs-target="#helpModal">
    ?
    </button>
    <div class="modal fade" id="helpModal" tabindex="-1" aria-labelledby="helpModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="helpModalLabel">User Guidelines</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <ul>
                        <li>Use the table to view all your assigned booking details at a glance.</li>
                        <li>Click "Confirm" to accept a booking or "Withdraw" to cancel a pending booking.</li>
                        <li>Ensure that all booking information is accurate before making any changes.</li>
                        <li>Contact us for any queries or assistance regarding your bookings.</li>
                        <li>Always log out securely when you finish your session.</li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function updateStatus(bookingId, status, button) {
            fetch('<%= request.getContextPath() %>/UpdateBookingStatusServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'bookingId=' + encodeURIComponent(bookingId) + '&status=' + encodeURIComponent(status)
            })
            .then(response => {
                if (response.ok) {
                    button.parentElement.innerHTML = `<button type="button" class="btn btn-outline-primary">Status: ${status}</button>`;
                } else {
                    console.error('Error:', response);
                }
            })
            .catch(error => console.error('Error:', error));
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
