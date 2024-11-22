<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
         <button onclick="window.location.href='Login.jsp'">Requests</button>
    </nav>

    <h2>Status of User Requests</h2>
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
            <c:forEach var="request" items="${requests}">
                <tr>
                    <td>${request.id}</td>
                    <td>${request.username}</td>
                    <td>${request.software}</td>
                    <td>${request.accessLevel}</td>
                    <td>${request.status}</td>
                    <td>
                        <!-- Form for updating the request status -->
                        <form action="statusRequest.jsp" method="post">
                            <input type="hidden" name="requestId" value="${request.id}">
                            <button type="submit" name="action" value="Approved">Approve</button>
                            <button type="submit" name="action" value="Rejected">Reject</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
