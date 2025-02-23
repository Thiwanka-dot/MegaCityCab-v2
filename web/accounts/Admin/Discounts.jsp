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
                    <li>
                        <a href="../Admin/Admin.html">
                            <i class="fa fa-home"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Admin/CabBooking.html">
                            <i class="fa fa-tasks"></i>
                            <span>Cab Bookings</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Admin/CustomerDet.html">
                            <i class="fa fa-tasks"></i>
                            <span>Customer Details</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Admin/DriverDet.html">
                            <i class="fa fa-tasks"></i>
                            <span>Driver Details</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Admin/Discounts.html" class="active">
                            <i class="fa fa-tasks"></i>
                            <span>Discounts</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Admin/DistancePrice.html">
                            <i class="fa fa-tasks"></i>
                            <span>Distance Pricing</span>
                        </a>
                    </li>
                </ul>
                <div class="logout-btn">
                    <a href="../../index.html">
                        <i class="fa fa-sign-out"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </nav>
        <main>
            <h1>Discounts Management</h1>
            <div class="p-2"></div>
            <div class="edit-user p-4">
                <h4>Add Discount</h4>
                <form action="" class="row g-3">
                    <div class="col-md-4">
                        <label for="discountCode" class="form-label">Enter Discount Code</label>
                        <input type="text" class="form-control" id="discountCode" placeholder="Ex. CEf106">
                    </div>
                    <div class="col-md-4">
                        <label for="discountAmt" class="form-label">Enter Discount Amount (%)</label>
                        <input type="number" class="form-control" id="discountAmt" placeholder="Discount Amount">
                    </div>
                    <div class="col-md-4">
                        <label for="discountDur" class="form-label">Enter Discount Duration (days)</label>
                        <input type="number" class="form-control" id="discountDur" placeholder="Ex. 90">
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn w-100">Submit</button>
                    </div>
                </form>
            </div>
            <div class="p-2"></div>
            <div class="booking-list p-4">
                <h4>View Discounts</h4>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Discount ID</th>
                            <th scope="col">Discount Code</th>
                            <th scope="col">Discount Amount</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Lorem</td>
                            <td>Otto</td>
                            <td class="btn"><button type="button" class="btn btn-danger">Cancel</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="p-2"></div>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
