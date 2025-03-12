<%@page import="Servlets.DBConnection"%>
<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

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
                    <li><a href="../Admin/Admin.jsp"><i class="fa fa-home"></i> <span>Home</span></a></li>
                    <li><a href="../Admin/CabBooking.jsp"><i class="fa fa-tasks"></i> <span>Cab Bookings</span></a></li>
                    <li><a href="../Admin/CustomerDet.jsp"><i class="fa fa-tasks"></i> <span>Customer Details</span></a></li>
                    <li><a href="../Admin/DriverDet.jsp" class="active"><i class="fa fa-tasks"></i> <span>Driver Details</span></a></li>
                    <li><a href="../Admin/DistancePrice.jsp"><i class="fa fa-tasks"></i><span>Distance Pricing</span></a></li>
                    <li><a href="../Admin/Discounts.jsp"><i class="fa fa-tasks"></i><span>Discounts</span></a></li>
                </ul>
                <div class="logout-btn">
                    <a href="<%= request.getContextPath() %>/LogoutServlet"><i class="fa fa-sign-out"></i><span>Logout</span></a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Manage Driver Details</h1>
            <div class="p-2"></div>
            <div class="booking-list p-4">
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>License</th>
                            <th>Car Number Plate</th>
                            <th>Car Model</th>
                            <th>Availability</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Connection conn = null;
                        conn = DBConnection.getConnection();

                        String query = "SELECT id, first_name, last_name, email, phone, license_no, vehicle_no, vehicle_model, availability FROM drivers ORDER BY id DESC";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("first_name") %></td>
                            <td><%= rs.getString("last_name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("license_no") %></td>
                            <td><%= rs.getString("vehicle_no") %></td>
                            <td><%= rs.getString("vehicle_model") %></td>
                            <td><%= rs.getString("availability") %></td>
                            <td class="actionBtn">
                                <button type="button" class="btn btn-primary edit-btn" data-bs-toggle="modal" data-bs-target="#editModal"
                                        data-id="<%= rs.getInt("id") %>"
                                        data-firstname="<%= rs.getString("first_name") %>"
                                        data-lastname="<%= rs.getString("last_name") %>"
                                        data-email="<%= rs.getString("email") %>"
                                        data-phone="<%= rs.getString("phone") %>"
                                        data-license="<%= rs.getString("license_no") %>"
                                        data-vehicleNo="<%= rs.getString("vehicle_no") %>"
                                        data-vehicleModel="<%= rs.getString("vehicle_model") %>">
                                    Edit
                                </button>
                                <form action="<%= request.getContextPath() %>/DeleteDriverServlet" method="post">
                                    <input type="hidden" name="driverID" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="btn btn-danger">Cancel</button>
                                </form>
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
        </main>
    </div>
    <!-- Bootstrap Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Driver Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm" action="<%= request.getContextPath() %>/AdminDriverUpdateServlet" method="post">
                        <input type="hidden" id="driverId" name="driverId">
                        <div class="mb-3">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="number" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="license" class="form-label">License</label>
                            <input type="text" class="form-control" id="license" name="license" required>
                        </div>
                        <div class="mb-3">
                            <label for="vehicleNo" class="form-label">Car Number Plate</label>
                            <input type="text" class="form-control" id="vehicleNo" name="vehicleNo" required>
                        </div>
                        <div class="mb-3">
                            <label for="vehicleModel" class="form-label">Car Model</label>
                            <input type="text" class="form-control" id="vehicleModel" name="vehicleModel" required>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".edit-btn").forEach(button => {
                button.addEventListener("click", function () {
                    let row = this.closest("tr");
                    document.getElementById("driverId").value = row.cells[0].textContent;
                    document.getElementById("firstName").value = row.cells[1].textContent;
                    document.getElementById("lastName").value = row.cells[2].textContent;
                    document.getElementById("email").value = row.cells[3].textContent;
                    document.getElementById("phone").value = row.cells[4].textContent;
                    document.getElementById("license").value = row.cells[5].textContent;
                    document.getElementById("vehicleNo").value = row.cells[6].textContent;
                    document.getElementById("vehicleModel").value = row.cells[7].textContent;
                });
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
