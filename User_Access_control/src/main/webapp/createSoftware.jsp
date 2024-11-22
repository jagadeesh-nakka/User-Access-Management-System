<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Software</title>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<body>
    <header>
        <h1>Create New Software</h1>
    </header>
    
    <nav>
        <a href="AdminDashboard.jsp">Back to Admin Dashboard</a>
        <a><button onclick="window.location.href='Login.jsp'">Logout</button></a> 
    </nav>

    <main>
        <form action="Insertsoftware.jsp" method="POST">
            <div>
                <label for="softwareName">Software Name:</label>
                <input type="text" id="softwareName" name="softwareName" required>
            </div>
            <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            <div>
                <label>Access Levels:</label><br>
                <input type="checkbox" id="read" name="accessLevels" value="Read">
                <label for="read">Read</label><br>
                <input type="checkbox" id="write" name="accessLevels" value="Write">
                <label for="write">Write</label><br>
                <input type="checkbox" id="admin" name="accessLevels" value="Admin">
                <label for="admin">Admin</label><br>
            </div>
            <div>
                <button type="submit">Create Software</button>
            </div>
        </form>
    </main>

    <footer>
        <p>© 2024 User Access Management System</p>
    </footer>
</body>
</html>
