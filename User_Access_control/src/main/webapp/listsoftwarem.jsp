<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Software</title>
    <link rel="stylesheet" href="CSS/listsoftware.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Styling for header buttons */
        .header-buttons {
            display: flex;
            justify-content: flex-start;
            gap: 15px;
            padding: 20px;
        }

        .header-buttons button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .header-buttons button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar with buttons -->
    <div class="header-buttons">
        <button onclick="window.location.href='pendingRequests.jsp'">Home</button>
        <button onclick="window.location.href='listsoftwarem.jsp'">List</button>
        <button onclick="window.location.href='pendingRequests.jsp'">Requests</button>
         <button onclick="window.location.href='Login.jsp'">Logout</button>
    </div>

    <h2>List of Software Applications</h2>
    <p>Below is the list of all available software appl  ications:</p>
    
    <!-- Software List Table -->
    <table>
        <thead>
            <tr>
                <th>Software Name</th>
                <th>Description</th>
                <th>Access Levels</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Database connection setup (adjust details as needed)
                String dbURL = "jdbc:postgresql://localhost:5432/Rbac"; // Replace with your actual database URL
                String dbUsername = "postgres"; // Replace with your DB username
                String dbPassword = "root"; // Replace with your DB password
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                
                try {
                    // Load PostgreSQL driver and establish connection
                    Class.forName("org.postgresql.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                    stmt = conn.createStatement();
                    
                    // SQL query to fetch software data
                    String sql = "SELECT name, description, access_levels FROM software"; // Replace with your actual table name
                    rs = stmt.executeQuery(sql);
                    
                    // Iterate through result set and display software names, descriptions, and access levels
                    while (rs.next()) {
                        String softwareName = rs.getString("name"); 
                        String description = rs.getString("description");
                        String accessLevels = rs.getString("access_levels");
            %>
                        <tr>
                            <td><%= softwareName %></td>
                            <td><%= description %></td>
                            <td><%= accessLevels %></td>
                        </tr>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>

</body>
</html>
