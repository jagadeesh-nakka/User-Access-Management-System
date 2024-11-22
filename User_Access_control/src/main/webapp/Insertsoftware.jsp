<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    // Database connection details
    String dbURL = "jdbc:postgresql://localhost:5432/Rbac";
    String dbUser = "postgres";
    String dbPassword = "root";

    // Form data
    String softwareName = request.getParameter("softwareName");
    String description = request.getParameter("description");
    String[] accessLevelsArray = request.getParameterValues("accessLevels");

    // Combine access levels into a single string
    String accessLevels = String.join(",", accessLevelsArray);

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load PostgreSQL driver
        Class.forName("org.postgresql.Driver");

        // Establish connection
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL Insert query
        String sql = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // Set parameters
        pstmt.setString(1, softwareName);
        pstmt.setString(2, description);
        pstmt.setString(3, accessLevels);

        // Execute query
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<h2>Software created successfully!</h2>");
        } else {
            out.println("<h2>Error: Unable to create software.</h2>");
        }
    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        // Close resources
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

<a href="CreateSoftware.jsp">Create Another Software</a>
<a href="AdminDashboard.jsp">Back to Dashboard</a>
