<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creative Signup Form</title>
    <link rel="stylesheet" href="CSS/createAcc.css"> <!-- Ensure correct path for CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="background">
        <div class="signup-container">
            <div class="image-section">
                <h1>Welcome!</h1>
                <p>Create your account and start your journey with us.</p>
            </div>
            <div class="form-section">
                <!-- Form submission to processing.jsp -->
                <form action="processing.jsp" method="POST">
                    <h2>Create Account</h2>
                    <div class="form-group">
                        <input type="text" id="name" name="name" placeholder="User Name" required>
                    </div>
                    
                    <div class="form-group">
                        <input type="password" id="password" name="password" placeholder="Password" required>
                    </div>
                    
                    <div class="form-group">
                        <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm Password" required>
                    </div>
                    
                    <!-- Role Selection -->
                    <div class="form-group">
                        <label for="role"></label>
                        <select name="role" id="role" required>
                            <option value="Employee">Employee</option>
                            <option value="Manager">Manager</option>
                            <option value="Admin">Admin</option>
                        </select><br>
                    </div>
                    
                    <button type="submit">Sign Up</button>
                </form>
                <p class="login-link">Already have an account? <a href="Login.jsp">Log in</a></p>
            </div>
        </div>
    </div>
</body>
</html>
