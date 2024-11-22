<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Software</title>
    <link rel="stylesheet" href="CSS/edit.css"> <!-- Add your CSS file -->
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
         <button onclick="window.location.href='Login.jsp'">Requests</button>
    </nav>

    <h2>Edit Software Details</h2>

    <form action="editSoftwareAction.jsp" method="post">
        <label for="softwareId">Software ID:</label>
        <input type="text" id="softwareId" name="softwareId" required><br>

        <label for="softwareName">Software Name:</label>
        <input type="text" id="softwareName" name="softwareName" required><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea><br>

        <input type="submit" value="Update Software">
    </form>

    <footer>
        <p>&copy; 2024 Software Management</p>
    </footer>

</body>
</html>
