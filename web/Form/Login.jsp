<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MCC - Login Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <div class="form-contain">
        <div class="form-con">
            <form id="loginForm" action="../LoginServlet" method="post" onsubmit="return validateForm()">
                <h1 class="pb-4">Sign In Page</h1>
                <div id="emptyError" class="alert alert-warning alert-dismissible fade show d-none" role="alert">
                    <strong>Warning!</strong> Please fill in all the fields.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% if (request.getParameter("error") != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error!</strong> <%= request.getParameter("error") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                <div class="form-item">
                    <label for="email">Enter Email</label><br>
                    <input type="email" name="email" id="email" placeholder="Enter Email" autocomplete="off">
                </div>
                <div class="form-item">
                    <label for="password">Enter Password</label><br>
                    <input type="password" name="password" id="password" placeholder="Enter Password">
                </div>                
                <button type="submit" class="btn col-md-12 mt-2 mb-2">Login</button>
                <div class="link">
                    <p>You don't have an account? <a href="../Form/Register.jsp">Click Here!</a></p>
                </div>
            </form>
        </div>
    </div>
    <script>
        function validateForm() {
            var email = document.getElementById("email").value.trim();
            var password = document.getElementById("password").value.trim();
            var emptyError = document.getElementById("emptyError");

            if (email === "" || password === "") {
                emptyError.classList.remove("d-none"); // Show error message
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>