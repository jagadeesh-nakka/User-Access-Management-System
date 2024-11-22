<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Access</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff; /* Light blue background */
        }
        header {
            background-color: #007BFF; /* Blue header */
            color: white;
            text-align: center;
            padding: 1rem;
            position: relative;
        }
        /* Status button with blue shades */
        .status-btn {
            position: absolute;
            top: 97px;
            right: 20px;
            background-color: #0056b3; /* Darker blue */
            color: white;
            border: none;
         
            font-size: 1rem;
            cursor: pointer;
            border-radius: 5px;
            width: auto;
        }
        .status-btn:hover {
            background-color: #004085; /* Even darker blue on hover */
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
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }
       #button1{
              
        color:'black';
       width:auto;
       margin-left:55rem;
       background-color: #0056b3;
        
        }
        button {
            background-color: #007BFF; /* Blue button */
            color: white;
            border: none;
            cursor: pointer;
            font-size: 1.1rem;
            padding-left: 0.75rem;
        }
        button:hover {
            background-color: #0056b3; /* Darker blue on hover */
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
        <!-- Status Button styled to appear on top-right -->
         <button  id="button1""onclick="window.location.href='Login.jsp'">Requests</button>
        <button class="status-btn" id="pp" onclick="window.location.href='Login.jsp';">Logout</button>
        
         <button class="status-btn" id="pp1" onclick="window.location.href='Login.jsp';">Logout</button>
    </header>

    <main>
        <form action="Request_acess.jsp" method="POST">
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
    </main>

    <footer>
        <p>© 2024 Employee Access Management System</p>
    </footer>

</body>
</html>
