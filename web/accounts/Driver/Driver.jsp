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

    String userId = "", firstName = "", lastName = "", phone = "", license = "", vehicleNo = "", vehicleModel = "", availability = "";

    String query = "SELECT * FROM drivers WHERE email = ?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setString(1, userEmail);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        userId = rs.getString("id");
        firstName = rs.getString("first_name");
        lastName = rs.getString("last_name");
        phone = rs.getString("phone");
        license = rs.getString("license_no");
        vehicleNo = rs.getString("vehicle_no");
        vehicleModel = rs.getString("vehicle_model");
        availability = rs.getString("availability");
    }
    conn.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard</title>
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
                <i class="fa fa-user-circle"></i>
                <span><h3>Driver</h3></span> 
            </div>
            <hr>          
            <div class="nav-con">
                <ul>
                    <li><a href="../Driver/Driver.jsp" class="active"><i class="fa fa-home"></i><span>Home</span></a></li>
                    <li><a href="../Driver/Bookings.jsp"><i class="fa fa-tasks"></i><span>Booking Overview</span></a></li>
                </ul>
                <div class="logout-btn">
                    <a href="<%= request.getContextPath() %>/LogoutServlet"><i class="fa fa-sign-out"></i><span>Logout</span></a>
                </div>
            </div>
        </nav>
        <main>
                <h1>Welcome <%= firstName %> <%= lastName %>!</h1>
            <div class="p-2"></div>
            <div class="p-4 aval">
                <p>Are you available for providing transportation?</p>
                <div class="avalBtn">
                    <button class="btn btn-success w-100 col-md-6" onclick="updateAvailability('Available')">Available</button>
                    <button class="btn btn-danger w-100 col-md-6" onclick="updateAvailability('Unavailable')">Unavailable</button>
                 </div>
            </div>
            <div class="p-2"></div>
            <div class="edit-user p-4">
                <h4>Profile Details</h4>
                <form action="<%= request.getContextPath() %>/UpdateDriverProfileServlet" method="post" class="row g-3">
                    <% 
                        String message = (String) session.getAttribute("message");
                        if (message != null) { 
                    %>
                        <div class="alert alert-info"><%= message %></div>
                    <% 
                        session.removeAttribute("message");
                    } 
                    %>
                    <div class="col-md-12">
                        <label for="userId" class="form-label">Driver ID</label>
                        <input type="text" class="form-control" name="userId" id="userId" value="<%= userId %>" disabled>
                    </div>
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" name="firstName" id="firstName" value="<%= firstName %>">
                    </div>
                    <div class="col-md-6">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" name="lastName" id="lastName" value="<%= lastName %>">
                    </div>
                    <div class="col-md-6">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="number" class="form-control" name="phone" id="phone" value="<%= phone %>">
                    </div>
                    <div class="col-md-6">
                        <label for="license" class="form-label">License No</label>
                        <input type="text" class="form-control" name="license" id="license" value="<%= license %>">
                    </div>
                    <div class="col-md-6">
                        <label for="vehicleNo" class="form-label">Car Number Plate</label>
                        <input type="text" class="form-control" name="vehicleNo" id="vehicleNo" value="<%= vehicleNo %>">
                    </div>
                    <div class="col-md-6">
                        <label for="vehicleModel" class="form-label">Car Model</label>
                        <input type="text" class="form-control" name="vehicleModel" id="vehicleModel" value="<%= vehicleModel %>">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-warning w-100">Update Profile</button>
                    </div>
                </form>
            </div>
            <div class="p-2"></div>
            <div class="delete-acc p-4">
                <h4>Account Deletion</h4>
                <p>Are you sure you want to delete your account? This action cannot be undone.</p>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteAccountModal">
                    Delete
                </button>
            </div>
            <div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white">
                            <h5 class="modal-title" id="deleteAccountModalLabel">Confirm Account Deletion</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete your account? This action is permanent and cannot be undone.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <form action="<%= request.getContextPath() %>/DeleteDriverServlet2" method="post">
                                <input type="hidden" name="driverID" value="<%= userId %>">
                                <button type="submit" class="btn btn-danger">Confirm Deletion</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="p-2"></div>
        </main>
    </div>
    <script>
        function updateAvailability(status) {
            fetch('<%= request.getContextPath() %>/UpdateAvailabilityServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'availability=' + encodeURIComponent(status)
            })
            .then(response => window.location.reload())
            .catch(error => console.error('Error:', error));
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
