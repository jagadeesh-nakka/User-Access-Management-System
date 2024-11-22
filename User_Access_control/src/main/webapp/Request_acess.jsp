<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Software Access</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 1rem;
        }
        main {
            margin: 2rem auto;
            width: 80%;
            max-width: 600px;
            background: white;
            padding: 1.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        input, select, textarea, button {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        footer {
            text-align: center;
            margin-top: 2rem;
            font-size: 0.9rem;
            color: #777;
        }
    </style>
</head>
<body>

    <header>
        <h1>Request Software Access</h1>
    </header>

    <main>
        <form action="request_access.jsp" method="POST">
            <div>
                <label for="softwareName">Software Name:</label>
                <select id="softwareName" name="softwareName" required>
                    <option value="">-- Select Software --</option>
                    <% 
                        // Database connection details
                        String jdbcUrl = "jdbc:postgresql://localhost:5432/Rbac";
                        String jdbcUsername = "postgres";
                        String jdbcPassword = "root";
                        Connection connection = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        
                        List<String> softwareNames = new ArrayList<>();
                        try {
                            // Connect to the database
                            Class.forName("org.postgresql.Driver");
                            connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
                            String query = "SELECT name FROM software";
                            stmt = connection.createStatement();
                            rs = stmt.executeQuery(query);

                            // Fetch software names
                            while (rs.next()) {
                                softwareNames.add(rs.getString("name"));
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (connection != null) connection.close();
                            } catch (SQLException se) {
                                se.printStackTrace();
                            }
                        }

                        // Display software names in the dropdown
                        for (String softwareName : softwareNames) {
                    %>
                        <option value="<%= softwareName %>"><%= softwareName %></option>
                    <% 
                        }
                    %>
                </select>
            </div>

            <div>
                <label for="accessType">Access Type:</label>
                <select id="accessType" name="accessType" required>
                    <option value="">-- Select Access Type --</option>
                    <option value="Read">Read</option>
                    <option value="Write">Write</option>
                    <option value="Admin">Admin</option>
                </select>
            </div>

            <div>
                <label for="reason">Reason for Request:</label>
                <textarea id="reason" name="reason" rows="4" required></textarea>
            </div>

            <div>
                <button type="submit">Submit Request</button>
            </div>
        </form>

        <% 
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String softwareName = request.getParameter("softwareName");
                String accessType = request.getParameter("accessType");
                String reason = request.getParameter("reason");

                // Assuming user ID is available from session or authentication system
                int userId = 1; // Replace this with actual user ID from session or authentication

                if (softwareName != null && accessType != null && reason != null) {
                    try {
                        // Establish database connection
                        Class.forName("org.postgresql.Driver");
                        Connection con = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

                        // Fetch the software ID for the selected software name
                        String softwareQuery = "SELECT id FROM software WHERE name = ?";
                        PreparedStatement psSoftware = con.prepareStatement(softwareQuery);
                        psSoftware.setString(1, softwareName);
                        ResultSet rsSoftware = psSoftware.executeQuery();

                        if (rsSoftware.next()) {
                            int softwareId = rsSoftware.getInt("id");

                            // Insert request into the requests table
                            String insertQuery = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, ?)";
                            PreparedStatement psInsert = con.prepareStatement(insertQuery);
                            psInsert.setInt(1, userId);
                            psInsert.setInt(2, softwareId);
                            psInsert.setString(3, accessType);
                            psInsert.setString(4, reason);
                            psInsert.setString(5, "Pending");
                            psInsert.executeUpdate();

                            out.println("<p>Request submitted successfully!</p>");
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p>Error occurred: " + e.getMessage() + "</p>");
                    }
                }
            }
        %>
    </main>

    <footer>
        <p>© 2024 Employee Access Management System</p>
    </footer>

</body>
</html>
