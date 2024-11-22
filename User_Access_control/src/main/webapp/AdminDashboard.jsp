<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="CSS/styles.css"> <!-- Link to the CSS file -->
</head>
<body>

    <header>
        <h1>Admin Dashboard</h1>
    </header>

    <nav>
        <a href="home.jsp">Home</a>
        <a href="createSoftware.jsp">Create Software</a>
        <a href="listSoftware.jsp">List of Software</a>
        <a href="Editsoftware.jsp">Edit Software</a>
        <a href="Remove.jsp">Remove Software</a>
        <a href="pendingRequests.jsp">Status of Request</a>
         <a><button onclick="window.location.href='Login.jsp'">Logout</button></a>
    </nav>

    <main>
        <h2>Welcome to the Admin Dashboard</h2>
        <!-- Create the 4 grid items -->
        <div class="grid-item">
            <h3>Software Statistics</h3>
            <p>View detailed statistics for all software</p>
        </div>
        <div class="grid-item">
            <h3>Manage Requests</h3>
            <p>Review and manage software requests</p>
        </div>
        <div class="grid-item">
            <h3>Pending Approvals</h3>
            <p>View pending software approvals</p>
        </div>
        <div class="grid-item">
            <h3>System Settings</h3>
            <p>Configure system settings</p>
        </div>
    </main>

    <footer>
        <p>© 2024 User Access Management System</p>
    </footer>

</body>
</html>
