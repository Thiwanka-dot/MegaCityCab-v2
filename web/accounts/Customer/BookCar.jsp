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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
</head>
<body>
    <div class="acc-con">
        <nav>
            <div class="acc-logo">
                <i class="fa fa-user-circle"></i>
                <span><h3>Customer</h3></span>
            </div>
            <hr>
            <div class="nav-con">
                <ul>
                    <li>
                        <a href="../Customer/Customer.html">
                            <i class="fa fa-home"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Customer/BookCar.html" class="active">
                            <i class="fa fa-tasks"></i>
                            <span>Booking Overview</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Customer/DriverTransfer.html">
                            <i class="fa fa-tasks"></i>
                            <span>Become a Driver</span>
                        </a>
                    </li>
                </ul>
                <div class="logout-btn">
                    <a href="../../index.html">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Booking Overview</h1>
            <div class="p-2"></div>
            <div class="edit-user p-4">
                <h4>Cab Booking</h4>
                <form action="" class="row g-3">
                    <div class="col-md-12">
                        <label for="customerName" class="form-label">Customer Name</label>
                        <input type="text" class="form-control" id="customerName" placeholder="Enter Name">
                    </div>
                    <div class="col-md-6">
                        <label for="startLoc" class="form-label">Start Location</label>
                        <select id="startLoc" class="selectpicker form-control" data-live-search="true" title="Select a Location">
                            <option value="colombo">Colombo</option>
                            <option value="kandy">Kandy</option>
                            <option value="galle">Galle</option>
                            <option value="negombo">Negombo</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="endLoc" class="form-label">End Location</label>
                        <select id="endLoc" class="selectpicker form-control" data-live-search="true" title="Select a Location">
                            <option value="colombo">Colombo</option>
                            <option value="kandy">Kandy</option>
                            <option value="galle">Galle</option>
                            <option value="negombo">Negombo</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label for="address" class="form-label">Current Address</label>
                        <input type="text" class="form-control" id="address" placeholder="Enter Pickup Address">
                    </div>
                    <div class="col-md-6">
                        <label for="availableDriver" class="form-label">Select an Available Driver</label>
                        <select class="form-select" aria-label="Default select example">
                            <option selected>None</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="vehicleNo" class="form-label">Vehicle No</label>
                        <input type="text" class="form-control" id="vehicleNo" placeholder="SE101" disabled>
                    </div>                    
                    <div class="col-md-6">
                        <label for="discount" class="form-label">Discount Code</label>
                        <input type="text" class="form-control" id="discount" placeholder="Enter Discount Code">
                    </div>
                    <div class="col-md-3">
                        <label for="distanceHour" class="form-label">Distance per hour</label>
                        <input type="text" class="form-control" id="distanceHour" placeholder="10 Km/h" disabled>
                    </div>
                    <div class="col-md-3">
                        <label for="price" class="form-label">Travel Price</label>
                        <input type="number" class="form-control" id="nic" placeholder="100 LKR" disabled>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn w-100">Confirm Booking</button>
                    </div>
                </form>
            </div>
            <div class="p-2"></div>
            <div class="booking-list p-4">
                <h4>View Bookings</h4>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Book ID</th>
                            <th scope="col">Address</th>
                            <th scope="col">Destination</th>
                            <th scope="col">Driver</th>
                            <th scope="col">Vehicle No</th>
                            <th scope="col">Distance</th>
                            <th scope="col">Payment</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td style="max-width: 150px;">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Repellendus incidunt, esse fugiat tenetur porro iure.</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td class="btn"><button type="button" class="btn btn-outline-secondary">Pending</button> <button type="button" class="btn btn-danger">Cancel</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="p-2"></div>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/js/bootstrap-select.min.js"></script>
    <script>
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
    });
    </script>
</body>
</html>
