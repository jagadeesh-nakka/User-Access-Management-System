<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Signup</title>
    <link rel="stylesheet" href="CSS/createAcc.css">
</head>
<body>
    <div class="background">
        <div class="signup-container">
            <div class="image-section">
                <h1>Processing Signup</h1>
            </div>
            <div class="form-section">
                <%
                    // Get form data
                    String name = request.getParameter("name");
                    String password = request.getParameter("password");
                    String confirmPassword = request.getParameter("confirm-password");
                    String role = request.getParameter("role");

                    // Check if passwords match
                    if (password.equals(confirmPassword)) {
                        // Database connection variables
                       // Class.forName("org.postgresql.Driver");

                        String dbURL = "jdbc:postgresql://localhost:5432/Rbac"; // Replace with your DB URL
                        String dbUsername = "postgres"; // Replace with your DB username
                        String dbPassword = "root"; // Replace with your DB password

                        Connection conn = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        try {
                            // Load PostgreSQL driver (for older versions of Java)
                          
                            Class.forName("org.postgresql.Driver");

                            // Establish connection
                             //  out.println("<h3>Establish connection</h3>");
                            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
							
							 out.println("<h3>Database connected</h3>");
                            // SQL query to insert the user data into the 'users' table
                            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
                            ps = conn.prepareStatement(sql);
                            ps.setString(1, name);
                            ps.setString(2, password);
                            ps.setString(3, role);

                            int rowsInserted = ps.executeUpdate();

                            // Check if user was successfully added
                            if (rowsInserted > 0) {
                                session.setAttribute("username", name);
                                session.setAttribute("role", role);
                                out.println("<h3>Account successfully created!</h3>");
                                out.println("<p>Welcome, " + name + " (" + role + ").</p>");
                                out.println("<p><a href='Login.jsp'>Login here</a></p>");
                            } else {
                                out.println("<h3>Error: Unable to create account. Please try again.</h3>");
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<h3>Database connection error. Please try again later.</h3>");
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (ps != null) ps.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }

                    } else {
                        // If passwords do not match, show an error message
                        out.println("<h3>Error: Passwords do not match!</h3>");
                        out.println("<p>Please go back and try again.</p>");
                        out.println("<p><a href='signup.jsp'>Go back to signup</a></p>");
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
