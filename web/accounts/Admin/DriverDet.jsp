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
                    <li><a href="../Admin/Admin.html"><i class="fa fa-home"></i> <span>Home</span></a></li>
                    <li><a href="../Admin/CabBooking.html"><i class="fa fa-tasks"></i> <span>Cab Bookings</span></a></li>
                    <li><a href="../Admin/CustomerDet.html"><i class="fa fa-tasks"></i> <span>Customer Details</span></a></li>
                    <li><a href="../Admin/DriverDet.html" class="active"><i class="fa fa-tasks"></i> <span>Driver Details</span></a></li>
                    <li><a href="../Admin/Discounts.html"><i class="fa fa-tasks"></i> <span>Discounts</span></a></li>
                    <li>
                        <a href="../Admin/DistancePrice.html">
                            <i class="fa fa-tasks"></i>
                            <span>Distance Pricing</span>
                        </a>
                    </li>
                </ul>
                <div class="logout-btn">
                    <a href="../../index.html"><i class="fa fa-sign-out"></i> <span>Logout</span></a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Manage Driver Details</h1>
            <div class="p-2"></div>
            <div class="booking-list p-4">
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Customer</th>
                        <th scope="col">Start Loc</th>
                        <th scope="col">End Loc</th>
                        <th scope="col">Distance per hour</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Colombo</td>
                        <td>Kandy</td>
                        <td>50 km</td>
                        <td>5000 LKR</td>
                        <td class="btn">
                            <button type="button" class="btn btn-primary edit-btn" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
                            <button type="button" class="btn btn-danger">Cancel</button>
                        </td>
                      </tr>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Driver Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm">
                        <div class="mb-3">
                            <label for="customerName" class="form-label">Customer Name</label>
                            <input type="text" class="form-control" id="customerName">
                        </div>
                        <div class="mb-3">
                            <label for="startLocation" class="form-label">Start Location</label>
                            <input type="text" class="form-control" id="startLocation">
                        </div>
                        <div class="mb-3">
                            <label for="endLocation" class="form-label">End Location</label>
                            <input type="text" class="form-control" id="endLocation">
                        </div>
                        <div class="mb-3">
                            <label for="distance" class="form-label">Distance per hour</label>
                            <input type="text" class="form-control" id="distance">
                        </div>
                        <div class="mb-3">
                            <label for="payment" class="form-label">Payment</label>
                            <input type="text" class="form-control" id="payment">
                        </div>
                        <button type="submit" class="btn btn-success w-100">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
