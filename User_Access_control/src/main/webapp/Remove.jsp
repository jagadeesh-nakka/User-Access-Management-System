<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/Remove.css">
    <title>Remove Software</title>
</head>
<body>

    <!-- Common Navigation Bar -->
    <nav>
        <a href="home.jsp">Home</a>
        <a href="createSoftware.jsp">Create Software</a>
        <a href="listSoftware.jsp">List of Software</a>
        <a href="editSoftware.jsp">Edit Software</a>
        <a href="Remove.jsp">Remove Software</a>
        <a href="statusRequest.jsp">Status of Request</a>
         <a href="Login.jsp">Logout</a>

    </nav>

    <h2>Remove Software Application</h2>
    <form action="RemoveSoftwareServlet" method="POST">
        <div>
            <label for="softwareId">Software ID:</label>
            <input type="text" id="softwareId" name="softwareId" required>
        </div>

        <div>
            <button type="submit">Remove Software</button>
        </div>
    </form>

</body>
</html>
