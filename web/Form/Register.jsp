<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MCC - Register Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <div class="form-contain">
        <div class="form-con">
            <div>
                <div class="d-flex justify-content-center resBtn">
                    <button class="formBtn" onclick="showForm('customer')">Customer</button>
                    <button class="formBtn" onclick="showForm('driver')">Driver</button>
                </div>                
                <!-- Customer Form -->
                <form id="registerForm" action="../CustomerRegisterServlet" method="post" onsubmit="return validateForm('customer')">
                    <h2 class="pb-2 pt-2 text-center">Customer Form</h2>               
                    <div id="emptyErrorCustomer" class="alert alert-warning alert-dismissible fade show d-none" role="alert">
                        <strong>Warning!</strong> Please fill in all the fields.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Error!</strong> <%= request.getParameter("error") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>
                    <div class="form-divide">
                        <div class="form-item">
                            <label for="firstName">Enter First Name</label><br>
                            <input type="text" name="firstName" id="firstName" placeholder="Enter First Name" required>
                        </div>
                        <div class="form-item">
                            <label for="lastName">Enter Last Name</label><br>
                            <input type="text" name="lastName" id="lastName" placeholder="Enter Last Name" required>
                        </div>
                    </div>
                    <div class="form-item">
                        <label for="email">Enter Email</label><br>
                        <input type="email" name="email" id="email" placeholder="Enter Email" required>
                    </div>
                    <div class="form-item">
                        <label for="nic">Enter NIC</label><br>
                        <input type="text" name="nic" id="nic" placeholder="Enter NIC" required>
                    </div>
                    <div class="form-item">
                        <label for="phone">Enter Phone No</label><br>
                        <input type="text" name="phone" id="phone" placeholder="Enter Phone No" required>
                    </div>
                    <div class="form-item">
                        <label for="address">Enter Address</label><br>
                        <textarea name="address" id="address" placeholder="Enter Address" required></textarea>
                    </div>
                    <div class="form-divide">
                        <div class="form-item">
                            <label for="password">Enter Password</label><br>
                            <input type="password" name="password" id="password" placeholder="Enter Password" required>
                        </div>
                        <div class="form-item">
                            <label for="confirmPassword">Confirm Password</label><br>
                            <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
                        </div>
                    </div>
                    <!-- Error message div (for JavaScript validation) -->
                    <div id="errorMessageCustomer" class="alert alert-danger d-none" role="alert"></div>    
                    <button type="submit" class="btn col-md-12 mt-2 mb-2">Register</button>
                    <div class="link">
                        <p>Already have an account? <a href="../Form/Login.jsp">Click Here!</a></p>
                    </div>
                </form>
                <!-- Driver Form -->
                <form id="driverForm" action="../DriverRegisterServlet" method="post" class="d-none" onsubmit="return validateForm('driver')">
                    <h2 class="pb-2 pt-2 text-center">Driver Form</h2>
                    <div id="emptyErrorDriver" class="alert alert-warning alert-dismissible fade show d-none" role="alert">
                        <strong>Warning!</strong> Please fill in all the fields.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Error!</strong> <%= request.getParameter("error") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>
                    <div class="form-divide">
                        <div class="form-item">
                            <label for="firstNameDriver">Enter First Name</label><br>
                            <input type="text" name="firstName" id="firstNameDriver" placeholder="Enter First Name" required>
                        </div>
                        <div class="form-item">
                            <label for="lastNameDriver">Enter Last Name</label><br>
                            <input type="text" name="lastName" id="lastNameDriver" placeholder="Enter Last Name" required>
                        </div>
                    </div>
                    <div class="form-item">
                        <label for="emailDriver">Enter Email</label><br>
                        <input type="email" name="email" id="emailDriver" placeholder="Enter Email" required>
                    </div>
                    <div class="form-divide">
                        <div class="form-item">
                            <label for="phoneDriver">Enter Phone No</label><br>
                            <input type="text" name="phone" id="phoneDriver" placeholder="Enter Phone No" required>
                        </div>
                        <div class="form-item">
                            <label for="license">Enter License No</label><br>
                            <input type="text" name="license" id="license" placeholder="Enter License No" required>
                        </div>
                    </div>
                    <div class="form-divide">
                        <div class="form-item">
                            <label for="vehicleNo">Vehicle No</label><br>
                            <input type="text" name="vehicleNo" id="vehicleNo" placeholder="Enter Vehicle No" required>
                        </div>
                        <div class="form-item">
                            <label for="vehicleModel">Vehicle Model</label><br>
                            <input type="text" name="vehicleModel" id="vehicleModel" placeholder="Enter Vehicle Model" required>
                        </div>
                    </div>
                    <div class="form-divide">
                        <div class="form-item">
                            <label for="passwordDriver">Enter Password</label><br>
                            <input type="password" name="password" id="passwordDriver" placeholder="Enter Password" required>
                        </div>
                        <div class="form-item">
                            <label for="confirmPasswordDriver">Confirm Password</label><br>
                            <input type="password" name="confirmPassword" id="confirmPasswordDriver" placeholder="Confirm Password" required>
                        </div>
                    </div>
                    <div id="errorMessageDriver" class="alert alert-danger d-none" role="alert"></div> 
                    <button type="submit" class="btn col-md-12 mt-2 mb-2">Register</button>
                    <div class="link">
                        <p>Already have an account? <a href="../Form/Login.jsp">Click Here!</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function showForm(type) {
            document.getElementById('registerForm').classList.add('d-none');
            document.getElementById('driverForm').classList.add('d-none');
            if (type === 'customer') {
                document.getElementById('registerForm').classList.remove('d-none');
            } else {
                document.getElementById('driverForm').classList.remove('d-none');
            }
        }

        function validateForm(type) {
            let firstName, lastName, email, phone, password, confirmPassword, errorMessage;
            
            if (type === 'customer') {
                firstName = document.getElementById("firstName").value.trim();
                lastName = document.getElementById("lastName").value.trim();
                email = document.getElementById("email").value.trim();
                phone = document.getElementById("phone").value.trim();
                password = document.getElementById("password").value.trim();
                confirmPassword = document.getElementById("confirmPassword").value.trim();
            } else {
                firstName = document.getElementById("firstNameDriver").value.trim();
                lastName = document.getElementById("lastNameDriver").value.trim();
                email = document.getElementById("emailDriver").value.trim();
                phone = document.getElementById("phoneDriver").value.trim();
                password = document.getElementById("passwordDriver").value.trim();
                confirmPassword = document.getElementById("confirmPasswordDriver").value.trim();
            }

            errorMessage = document.getElementById(type === 'customer' ? "errorMessageCustomer" : "errorMessageDriver");
            
            if (!firstName || !lastName || !email || !phone || !password || !confirmPassword) {
                errorMessage.textContent = "Please fill in all fields.";
                errorMessage.classList.remove("d-none");
                return false;
            }

            if (password !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match.";
                errorMessage.classList.remove("d-none");
                return false;
            }
            
            // Clear the error message if validation passes
            errorMessage.classList.add("d-none");

            return true;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
