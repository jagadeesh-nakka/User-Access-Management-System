<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    // Database connection details
    String dbURL = "jdbc:postgresql://localhost:5432/Rbac"; 
    String dbUsername = "postgres";
    String dbPassword = "root";
    

    
    try {
        Class.forName("org.postgresql.Driver");
      
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        String sql = "SELECT * FROM users WHERE username = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);

        rs = stmt.executeQuery();

        if (rs.next()) {
            // Validate password (assuming it's hashed)
            String storedPassword = rs.getString("password");
            if (password.equals(storedPassword)) { // Replace with hashed password comparison
                String role = rs.getString("role");

                // Set session attributes
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // Redirect based on role
                switch (role) {
                    case "Admin":
                        response.sendRedirect("AdminDashboard.jsp");
                        break;
                    case "Manager":
                        response.sendRedirect("pendingRequests.jsp");
                        break;
                    default:
                        response.sendRedirect("requestAccess.jsp");
                        break;
                }
            } else {
                out.println("<script>alert('Invalid Username or Password!');window.location='login.jsp';</script>");
            }
        } else {
            out.println("<script>alert('Invalid Username or Password!');window.location='login.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred. Please try again later.');window.location='login.jsp';</script>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
