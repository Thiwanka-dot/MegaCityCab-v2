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
                    <li>
                        <a href="../Customer/Customer.html">
                            <i class="fa fa-home"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Customer/BookCar.html">
                            <i class="fa fa-tasks"></i>
                            <span>Booking Overview</span>
                        </a>
                    </li>
                    <li>
                        <a href="../Customer/DriverTransfer.html" class="active">
                            <i class="fa fa-tasks"></i>
                            <span>Become a Driver</span>
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
            <h1>Become a Driver</h1>
            <div class="p-2"></div>
            <div class="driverImg">
                <div class="driverTxt">
                    <h2>Want to become a cab driver for Mega City Cab?</h2>
                    <br>
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#BecomeDriver">
                        Click Here!
                    </button>
                    <div class="modal fade" id="BecomeDriver" tabindex="-1" aria-labelledby="BecomeDriverLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-success text-white">
                                    <h5 class="modal-title" id="BecomeDriverLabel">Confirm Account Transfer</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you willing to become a cab driver for our Mega City Cab company?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="button" class="btn btn-success" id="confirmDelete">Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <img src="../../Img/cabDriver.jpg" class="img-fluid" alt="#">
            </div>
            <div class="p-2"></div>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
