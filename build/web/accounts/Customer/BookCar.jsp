<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="Servlets.DBConnection"%>

<%
    HttpSession userSession = request.getSession(false);
    String userEmail = (userSession != null) ? (String) userSession.getAttribute("email") : null;

    if (userEmail == null) {
        response.sendRedirect("../../Form/Login.jsp");
        return;
    }

    Connection conn = null;
    
    String customerName = "Unknown";
    String phone = "";
    String address = "";

    try {
        conn = DBConnection.getConnection();

        String query = "SELECT CONCAT(first_name, ' ', last_name) AS customer_name, phone, address FROM customers WHERE email = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, userEmail);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            customerName = rs.getString("customer_name");
            phone = rs.getString("phone");
            address = rs.getString("address");
        }

        rs.close();
        stmt.close();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
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
                <span><h3>Customer</h3></span>
            </div>
            <hr>
            <div class="nav-con">
                <ul>
                    <li><a href="../Customer/Customer.jsp"><i class="fa fa-home"></i><span>Home</span></a></li>
                    <li><a href="../Customer/BookCar.jsp" class="active"><i class="fa fa-tasks"></i><span>Booking Overview</span></a></li>
                    <li><a href="../Customer/ViewBookings.jsp"><i class="fa fa-tasks"></i><span>View Bookings</span></a></li>
                </ul>
                <div class="logout-btn">
                    <a href="<%= request.getContextPath() %>/LogoutServlet"><i class="fa fa-sign-out"></i><span>Logout</span></a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Booking Overview</h1>
            <div class="p-2"></div>
            <div class="edit-user p-4">
                <h4>Cab Booking</h4>
                <form action="<%= request.getContextPath() %>/BookCarServlet" method="post" class="row g-3">
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
                        <label for="customerName" class="form-label">Customer Name</label>
                        <input type="text" class="form-control" name="customerName" id="customerName" value="<%= customerName %>" readonly>
                    </div>
                    <div class="col-md-6">
                        <label for="contact" class="form-label">Phone No</label>
                        <input type="number" class="form-control" name="contact" id="contact" value="<%= phone %>" readonly>
                    </div>
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
                    <div class="col-md-12">
                        <label for="address" class="form-label">Current Address</label>
                        <input type="text" class="form-control" name="address" id="address" value="<%= address %>">
                    </div>
                    <div class="col-md-6">
                        <label for="availableDriver" class="form-label">Select an Available Driver</label>
                        <select class="form-select" id="availableDriver" name="availableDriver">
                            <option value="">Select a Driver</option>
                            <% 
                                try {
                                    String driverQuery = "SELECT id, CONCAT(first_name, ' ', last_name) AS driver_name, phone, vehicle_no FROM drivers WHERE availability = 'Available'";
                                    PreparedStatement driverStmt = conn.prepareStatement(driverQuery);
                                    ResultSet driverRs = driverStmt.executeQuery();
                                    while (driverRs.next()) { 
                            %>
                                    <option value="<%= driverRs.getInt("id") %>" 
                                            data-phone="<%= driverRs.getString("phone") %>" 
                                            data-vehicle="<%= driverRs.getString("vehicle_no") %>">
                                        <%= driverRs.getString("driver_name") %>
                                    </option>
                            <% 
                                    } 
                                    driverRs.close();
                                    driverStmt.close();
                                } catch (Exception e) {
                                    out.println("<div class='alert alert-danger'>Error fetching drivers: " + e.getMessage() + "</div>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="vehicleNo" class="form-label">Vehicle No</label>
                        <input type="text" class="form-control" name="vehicleNo" id="vehicleNo">
                    </div>
                    <div class="col-md-3">
                        <label for="driverCon" class="form-label">Driver Contact</label>
                        <input type="text" class="form-control" name="driverCon" id="driverCon">
                    </div>
                    <div class="col-md-4">
                        <label for="discount" class="form-label">Discount (Optional)</label>
                        <input type="text" class="form-control" name="discount" id="discount">
                    </div>
                    <div class="col-md-4">
                        <label for="price" class="form-label">Travel Price (LKR)</label>
                        <input type="number" class="form-control" name="price" id="price" placeholder="0">
                    </div>
                    <div class="col-md-4">
                        <label for="paymentMethod" class="form-label">Payment Method</label>
                        <select id="paymentMethod" name="paymentMethod" class="form-select">
                            <option value="cash">Cash</option>
                            <option value="card">Credit/Debit Card</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn w-100">Confirm Booking</button>
                    </div>
                </form>
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
                        <li>Ensure your contact information is accurate for better service.</li>
                        <li>Select a start and end location for your cab booking.</li>
                        <li>Choose an available driver from the list provided.</li>
                        <li>Enter your current address for pickup.</li>
                        <li>Review the travel price before confirming your booking.</li>
                        <li>Use the "Confirm Booking" button to finalize your ride.</li>
                        <li>Check your email for booking confirmations and updates.</li>
                        <li>Contact us for any queries or assistance regarding your bookings.</li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#availableDriver").change(function () {
                var selected = $(this).find(":selected");
                $("#vehicleNo").val(selected.data("vehicle"));
                $("#driverCon").val(selected.data("phone"));
            });

            $("#startLoc, #endLoc").change(function () {
                var startLoc = $("#startLoc").val();
                var endLoc = $("#endLoc").val();

                if (startLoc && endLoc) {
                    $.ajax({
                        url: 'getPriceByLocation.jsp',
                        method: 'GET',
                        data: { startLocation: startLoc, endLocation: endLoc },
                        success: function(response) {
                            var price = response.trim();
                            $("#price").val(price);
                            updatePriceWithDiscount();
                        },
                        error: function() {
                            alert("Error fetching price. Please try again.");
                        }
                    });
                }
            });

            $("#discount").on("input", function () {
                updatePriceWithDiscount();
            });

            function updatePriceWithDiscount() {
                var discountCode = $("#discount").val().trim();
                var travelPrice = parseFloat($("#price").val()) || 0;

                if (discountCode !== "") {
                    $.ajax({
                        url: 'getDiscount.jsp',
                        method: 'GET',
                        data: { discountCode: discountCode },
                        success: function(response) {
                            var discountPercent = parseFloat(response.trim()) || 0;
                            var discountedPrice = travelPrice - (travelPrice * discountPercent / 100);
                            $("#price").val(discountedPrice.toFixed(2));
                        },
                        error: function() {
                            alert("Error fetching discount. Please try again.");
                        }
                    });
                }
            }
        });
    </script>
</body>
</html>
