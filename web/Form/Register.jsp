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
            <form id="registerForm" action="../RegisterServlet" method="post" onsubmit="return validateForm()">
                <h1 class="pb-4">Create an Account</h1>
                <div id="emptyError" class="alert alert-warning alert-dismissible fade show d-none" role="alert">
                    <strong>Warning!</strong> Please fill in all the fields.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                 <!-- Error Message Handling from Servlet -->
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
                        <label for="conPassword">Confirm Password</label><br>
                        <input type="password" name="conPassword" id="conPassword" placeholder="Confirm Password" required>
                    </div>
                </div>                
                <button type="submit" class="btn col-md-12 mt-2 mb-2">Register</button>
                <div class="link">
                    <p>Already have an account? <a href="../Form/Login.jsp">Click Here!</a></p>
                </div>
            </form>
        </div>
    </div>
    <script>
        function validateForm() {
            var firstName = document.getElementById("firstName").value.trim();
            var lastName = document.getElementById("lastName").value.trim();
            var email = document.getElementById("email").value.trim();
            var nic = document.getElementById("nic").value.trim();
            var phone = document.getElementById("phone").value.trim();
            var address = document.getElementById("address").value.trim();
            var password = document.getElementById("password").value.trim();
            var conPassword = document.getElementById("conPassword").value.trim();
            var errorMessage = document.getElementById("errorMessage");

            if (!firstName || !lastName || !email || !nic || !phone || !address || !password || !conPassword) {
                errorMessage.textContent = "Please fill in all fields.";
                errorMessage.classList.remove("d-none");
                return false;
            }

            if (password !== conPassword) {
                errorMessage.textContent = "Passwords do not match.";
                errorMessage.classList.remove("d-none");
                return false;
            }

            return true;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>