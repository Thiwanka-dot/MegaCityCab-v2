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
                        <a href="../Admin/Admin.html" class="active">
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
                        <a href="../Admin/Discounts.html">
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
            <h1>System Overview</h1>
            <div class="p-2"></div>
            <div class="adminReport p-4">
                <div class="adminItem">
                    <i class="fa fa-car"></i>
                    <div class="book-txt">
                        <span><strong>Total No of Bookings</strong></span>                            
                        <h2>22</h2>                            
                    </div>
                </div>
                <div class="adminItem">
                    <i class="fa fa-money"></i>
                    <div class="pay-txt">
                        <span><strong>Total Payment</strong></span>
                        <h3>100 LKR</h3>                            
                    </div>
                </div>
                <div class="adminItem">
                    <i class="fa fa-users"></i>
                    <div class="pay-txt">
                        <span><strong>Total Customers</strong></span>
                        <h3>100</h3>                            
                    </div>
                </div>
                <div class="adminItem">
                    <i class="fa fa-users"></i>
                    <div class="pay-txt">
                        <span><strong>Total Drivers</strong></span>
                        <h3>100</h3>                            
                    </div>
                </div>
            </div>
            <div class="p-2"></div>
            <div class="manageCon p-4">
                <h4>Admin Tasks</h4>
                <div class="manageList">
                    <button type="button" class="btn btn-primary"><a href="">View Cab Bookings</a></button>
                    <button type="button" class="btn btn-primary"><a href="">Manage Customer Details</a></button>
                    <button type="button" class="btn btn-primary"><a href="">Manage Driver Details</a></button>
                    <button type="button" class="btn btn-primary"><a href="">Manage Discounts</a></button>
                </div>
            </div>
            <div class="p-2"></div>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
