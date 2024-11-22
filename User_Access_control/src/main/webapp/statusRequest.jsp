<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, org.apache.logging.log4j.LogManager, org.apache.logging.log4j.Logger"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Status of Request</title>
    <link rel="stylesheet" href="CSS/status.css">
</head>
<body>

    <!-- Common Navigation Bar -->
    <nav>
        <a href="home.jsp">Home</a>
        <a href="createSoftware.jsp">Create Software</a>
        <a href="listSoftware.jsp">List of Software</a>
        <a href="editSoftware.jsp">Edit Software</a>
        <a href="removeSoftware.jsp">Remove Software</a>
        <a href="statusRequest.jsp">Status of Request</a>
    </nav>

    <h2>Status of User Requests</h2>

    <%
        // Logger setup for error tracking
        Logger logger = LogManager.getLogger("JSPLogger");

        // Database connection details
        String jdbcURL = "jdbc:postgresql://localhost:5432/Rbac";
        String jdbcUsername = "postgres";
        String jdbcPassword = "root";
        
        // List to hold requests
        List<Request> requests = new ArrayList<>();

        // Request class definition within the JSP
        class Request {
            private int id;
            private String username;
            private String software;
            private String accessLevel;
            private String status;
            
            // Constructor
            public Request(int id, String username, String software, String accessLevel, String status) {
                this.id = id;
                this.username = username;
                this.software = software;
                this.accessLevel = accessLevel;
                this.status = status;
            }

            // Getters
            public int getId() {
                return id;
            }

            public String getUsername() {
                return username;
            }

            public String getSoftware() {
                return software;
            }

            public String getAccessLevel() {
                return accessLevel;
            }

            public String getStatus() {
                return status;
            }
        }
        
        // Fetch requests from database
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
            String query = "SELECT id, username, software, access_level, status FROM requests";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String software = rs.getString("software");
                String accessLevel = rs.getString("access_level");
                String status = rs.getString("status");
                
                requests.add(new Request(id, username, software, accessLevel, status));
            }
        } catch (SQLException e) {
            logger.error("Database error occurred while fetching requests: ", e);
            out.println("<p>Error fetching request data. Please try again later.</p>");
        }

        // Handle form submission for approving or rejecting requests
        String action = request.getParameter("action");
        if (action != null) {
            int requestId = Integer.parseInt(request.getParameter("requestId"));
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
                String updateQuery = "UPDATE requests SET status = ? WHERE id = ?";
                try (PreparedStatement ps = connection.prepareStatement(updateQuery)) {
                    ps.setString(1, action);
                    ps.setInt(2, requestId);
                    ps.executeUpdate();
                }
            } catch (SQLException e) {
                logger.error("Database error occurred while updating request status: ", e);
                out.println("<p>Error updating request status. Please try again later.</p>");
            }
            // Refresh the page after update
            response.sendRedirect("statusRequest.jsp");
        }
    %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>User</th>
                <th>Software</th>
                <th>Access Level</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Dynamically load request statuses -->
            <%
                for (Request req : requests) {
            %>
                <tr>
                    <td><%= req.getId() %></td>
                    <td><%= req.getUsername() %></td>
                    <td><%= req.getSoftware() %></td>
                    <td><%= req.getAccessLevel() %></td>
                    <td><%= req.getStatus() %></td>
                    <td>
                        <!-- Form for updating the request status -->
                        <form action="statusRequest.jsp" method="post">
                            <input type="hidden" name="requestId" value="<%= req.getId() %>">
                            <button type="submit" name="action" value="Approved">Approve</button>
                            <button type="submit" name="action" value="Rejected">Reject</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
