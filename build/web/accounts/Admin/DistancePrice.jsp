<%@page import="Servlets.DBConnection"%>
<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

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
                    <li><a href="../Admin/CabBooking.jsp"><i class="fa fa-tasks"></i><span>Cab Bookings</span></a></li>
                    <li><a href="../Admin/CustomerDet.jsp"><i class="fa fa-tasks"></i><span>Customer Details</span></a></li>
                    <li><a href="../Admin/DriverDet.jsp"><i class="fa fa-tasks"></i><span>Driver Details</span></a></li>
                    <li><a href="../Admin/DistancePrice.jsp" class="active"><i class="fa fa-tasks"></i><span>Distance Pricing</span></a></li>
                    <li><a href="../Admin/Discounts.jsp"><i class="fa fa-tasks"></i><span>Discounts</span></a></li>
                </ul>
                <div class="logout-btn">
                    <a href="<%= request.getContextPath() %>/LogoutServlet"><i class="fa fa-sign-out"></i><span>Logout</span></a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Distance Pricing</h1>
            <div class="p-2"></div>
            <div class="edit-user p-4">
                <h4>Set Distance Price</h4>
                <form action="<%= request.getContextPath() %>/DistancePricingServlet" method="post" class="row g-3">
                    <% 
                        String message = (String) session.getAttribute("message");
                        if (message != null) { 
                    %>
                        <div class="alert alert-info"><%= message %></div>
                    <% 
                        session.removeAttribute("message");
                    }
                    %>
                    <div class="col-md-6">
                        <label for="startLoc" class="form-label">Start Location</label>
                        <select id="startLoc" name="startLoc" class="selectpicker form-control" data-live-search="true" title="Select a Location">
                            <option value="colombo">Colombo</option>
                            <option value="kandy">Kandy</option>
                            <option value="galle">Galle</option>
                            <option value="negombo">Negombo</option>
                            <option value="jaffna">Jaffna</option>
                            <option value="anuradhapura">Anuradhapura</option>
                            <option value="polonnaruwa">Polonnaruwa</option>
                            <option value="kurunegala">Kurunegala</option>
                            <option value="badulla">Badulla</option>
                            <option value="ratnapura">Ratnapura</option>
                            <option value="trincomalee">Trincomalee</option>
                            <option value="batticaloa">Batticaloa</option>
                            <option value="matara">Matara</option>
                            <option value="puttalam">Puttalam</option>
                            <option value="hambantota">Hambantota</option>
                            <option value="ampara">Ampara</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="endLoc" class="form-label">End Location</label>
                        <select id="endLoc" name="endLoc" class="selectpicker form-control" data-live-search="true" title="Select a Location">
                            <option value="colombo">Colombo</option>
                            <option value="kandy">Kandy</option>
                            <option value="galle">Galle</option>
                            <option value="negombo">Negombo</option>
                            <option value="jaffna">Jaffna</option>
                            <option value="anuradhapura">Anuradhapura</option>
                            <option value="polonnaruwa">Polonnaruwa</option>
                            <option value="kurunegala">Kurunegala</option>
                            <option value="badulla">Badulla</option>
                            <option value="ratnapura">Ratnapura</option>
                            <option value="trincomalee">Trincomalee</option>
                            <option value="batticaloa">Batticaloa</option>
                            <option value="matara">Matara</option>
                            <option value="puttalam">Puttalam</option>
                            <option value="hambantota">Hambantota</option>
                            <option value="ampara">Ampara</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="distanceNo" class="form-label">Distance (Km)</label>
                        <input type="number" class="form-control" name="distanceNo" id="distanceNo" placeholder="Enter Distance">
                    </div>
                    <div class="col-md-4">
                        <label for="timeTaken" class="form-label">Time taken (Hrs)</label>
                        <input type="number" class="form-control" name="timeTaken" id="timeTaken" placeholder="Enter Overall Time" step="any">
                    </div>
                    <div class="col-md-4">
                        <label for="disPrice" class="form-label">Distance Price (LKR)</label>
                        <input type="number" class="form-control" name="disPrice" id="disPrice" placeholder="Enter Distance Price">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn w-100">Submit</button>
                    </div>
                </form>
            </div>
            <div class="p-2"></div>
            <div class="booking-list p-4">
                <h2>Distance Pricing</h2>
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Start Location</th>
                            <th>End Location</th>
                            <th>Distance (Km)</th>
                            <th>Time (Hrs)</th>
                            <th>Price (LKR)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Connection conn = null;
                            conn = DBConnection.getConnection();
                            
                            String query = "SELECT id, startLocation, endLocation, distance_amt, time_taken, total_price FROM distance ORDER BY id DESC";
                            PreparedStatement stmt = conn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("startLocation") %></td>
                            <td><%= rs.getString("endLocation") %></td>
                            <td><%= rs.getInt("distance_amt") %></td>
                            <td><%= rs.getDouble("time_taken") %></td>
                            <td><%= rs.getInt("total_price") %></td>
                            <td>
                                <button type="button" class="btn btn-primary edit-btn" data-bs-toggle="modal" data-bs-target="#editModal"
                                    data-id="<%= rs.getInt("id") %>"
                                    data-startloc="<%= rs.getString("startLocation") %>"
                                    data-endloc="<%= rs.getString("endLocation") %>"
                                    data-distance="<%= rs.getInt("distance_amt") %>"
                                    data-time="<%= rs.getDouble("time_taken") %>"
                                    data-price="<%= rs.getInt("total_price") %>">
                                    Edit
                                </button>

                                <form action="<%= request.getContextPath() %>/DeleteDistancePriceServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="priceID" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <% }
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
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Customer Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm" action="<%= request.getContextPath() %>/AdminDistancePriceUpdateServlet" method="post">
                        <input type="hidden" id="priceId" name="priceId">
                        <div class="mb-3">
                            <label for="startLocEdit" class="form-label">Start Location</label>
                            <select id="startLocEdit" name="startLocEdit" class="selectpicker form-control" data-live-search="true" title="Select a Location">
                                <option value="colombo">Colombo</option>
                                <option value="kandy">Kandy</option>
                                <option value="galle">Galle</option>
                                <option value="negombo">Negombo</option>
                                <option value="jaffna">Jaffna</option>
                                <option value="anuradhapura">Anuradhapura</option>
                                <option value="polonnaruwa">Polonnaruwa</option>
                                <option value="kurunegala">Kurunegala</option>
                                <option value="badulla">Badulla</option>
                                <option value="ratnapura">Ratnapura</option>
                                <option value="trincomalee">Trincomalee</option>
                                <option value="batticaloa">Batticaloa</option>
                                <option value="matara">Matara</option>
                                <option value="puttalam">Puttalam</option>
                                <option value="hambantota">Hambantota</option>
                                <option value="ampara">Ampara</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="endLocEdit" class="form-label">End Location</label>
                            <select id="endLocEdit" name="endLocEdit" class="selectpicker form-control" data-live-search="true" title="Select a Location">
                                <option value="colombo">Colombo</option>
                                <option value="kandy">Kandy</option>
                                <option value="galle">Galle</option>
                                <option value="negombo">Negombo</option>
                                <option value="jaffna">Jaffna</option>
                                <option value="anuradhapura">Anuradhapura</option>
                                <option value="polonnaruwa">Polonnaruwa</option>
                                <option value="kurunegala">Kurunegala</option>
                                <option value="badulla">Badulla</option>
                                <option value="ratnapura">Ratnapura</option>
                                <option value="trincomalee">Trincomalee</option>
                                <option value="batticaloa">Batticaloa</option>
                                <option value="matara">Matara</option>
                                <option value="puttalam">Puttalam</option>
                                <option value="hambantota">Hambantota</option>
                                <option value="ampara">Ampara</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="distanceNoEdit" class="form-label">Distance (Km)</label>
                            <input type="number" class="form-control" id="distanceNoEdit" name="distanceNoEdit" required>
                        </div>
                        <div class="mb-3">
                            <label for="timeTakenEdit" class="form-label">Time Taken (Hrs)</label>
                            <input type="number" class="form-control" id="timeTakenEdit" name="timeTakenEdit" step="any" required>
                        </div>
                        <div class="mb-3">
                            <label for="disPriceEdit" class="form-label">Price (LKR)</label>
                            <input type="number" class="form-control" id="disPriceEdit" name="disPriceEdit" required>
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
                    document.getElementById("priceId").value = this.getAttribute("data-id");
                    document.getElementById("startLocEdit").value = this.getAttribute("data-startloc");
                    document.getElementById("endLocEdit").value = this.getAttribute("data-endloc");
                    document.getElementById("distanceNoEdit").value = this.getAttribute("data-distance");
                    document.getElementById("timeTakenEdit").value = this.getAttribute("data-time");
                    document.getElementById("disPriceEdit").value = this.getAttribute("data-price");
                });
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
