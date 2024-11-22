<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Access Approval Page</title>
    <link rel="stylesheet" href="CSS/pending.css"> <!-- Link to the CSS file -->
    <style>
        /* Header Section Styling */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
        }

        header h1 {
            margin: 0;
        }

        /* Buttons for Home, List, and Requests positioned on the right side */
        .header-buttons {
            display: flex;
            gap: 10px;
        }

        .header-buttons button {
            padding: 10px;
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .header-buttons button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <h1>Access Approval System</h1>
        <!-- Buttons on the right side, with Home button first -->
        <div class="header-buttons">
            <button onclick="window.location.href='listsoftwarem.jsp'">Home</button>
            <button onclick="window.location.href='listsoftwarem.jsp'">List</button>
            <button onclick="window.location.href='pendingRequests.jsp'">Requests</button>
             <button onclick="window.location.href='Login.jsp'">Logout</button>
             
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <h2>Pending Access Requests</h2>

        <!-- Table for Pending Requests -->
        <table id="requestsTable">
            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Software Name</th>
                    <th>Access Type</th>
                    <th>Reason for Request</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // DB connection details
                    String dbURL = "jdbc:postgresql://localhost:5432/Rbac"; // Adjust your DB details
                    String dbUsername = "postgres"; // Your DB username
                    String dbPassword = "root"; // Your DB password
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Load PostgreSQL driver
                        Class.forName("org.postgresql.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                        // Fetch pending requests from database
                        String sql = "SELECT u.username AS \"Employee Name\", s.name AS \"Software Name\", r.access_type AS \"Access Type\", r.reason AS \"Reason for Request\", r.id AS \"Request ID\" " +
                                     "FROM requests r " +
                                     "JOIN users u ON r.user_id = u.id " +
                                     "JOIN software s ON r.software_id = s.id " +
                                     "WHERE r.status = 'Pending'";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        // Loop through the result set and display rows
                        while (rs.next()) {
                            String employeeName = rs.getString("Employee Name");
                            String softwareName = rs.getString("Software Name");
                            String accessType = rs.getString("Access Type");
                            String reason = rs.getString("Reason for Request");
                            int requestId = rs.getInt("Request ID");
                %>
                    <tr id="request_<%= requestId %>">
                        <td><%= employeeName %></td>
                        <td><%= softwareName %></td>
                        <td><%= accessType %></td>
                        <td><%= reason %></td>
                        <td>
                            <!-- Approve Form -->
                            <form action="" method="POST" style="display: inline;">
                                <input type="hidden" name="requestId" value="<%= requestId %>">
                                <input type="hidden" name="action" value="approve">
                                <button type="submit" class="approve">Approve</button>
                            </form>
                            <!-- Reject Form -->
                            <form action="" method="POST" style="display: inline;">
                                <input type="hidden" name="requestId" value="<%= requestId %>">
                                <input type="hidden" name="action" value="reject">
                                <button type="submit" class="reject">Reject</button>
                            </form>
                        </td>
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

                    // Handle form submission (approve/reject action)
                    String action = request.getParameter("action");
                    int requestId = request.getParameter("requestId") != null ? Integer.parseInt(request.getParameter("requestId")) : 0;
                    
                    if (action != null && requestId > 0) {
                        Connection conn2 = null;
                        PreparedStatement stmt2 = null;
                        try {
                            // Reconnect to DB to update status
                            conn2 = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                            
                            // Determine status based on action
                            String status = "Pending";
                            if ("approve".equals(action)) {
                                status = "Approved";
                            } else if ("reject".equals(action)) {
                                status = "Rejected";
                            }

                            // Update the request status in the database
                            String sql2 = "UPDATE requests SET status = ? WHERE id = ?";
                            stmt2 = conn2.prepareStatement(sql2);
                            stmt2.setString(1, status);
                            stmt2.setInt(2, requestId);
                            int rowsUpdated = stmt2.executeUpdate();
                            
                            if (rowsUpdated > 0) {
                                // If successful, hide the row on the frontend
                                out.println("<script type=\"text/javascript\">");
                                out.println("document.getElementById('request_" + requestId + "').style.display = 'none';");
                                out.println("</script>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (stmt2 != null) stmt2.close();
                                if (conn2 != null) conn2.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </tbody>
        </table>
    </main>

    <!-- Footer Section -->
    <footer>
        <p>© 2024 Access Approval System. All rights reserved.</p>
    </footer>

</body>
</html>
