<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01-06-2023
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="user-servlet?action=users">List All Users</a>
    </h2>
</center>
<div class="container">
    <div align="center">
        <caption><h2>Sort By Name</h2></caption>
        <table class="table table-bordered">
            <thead class="table-dark">

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
            </tr>
            </thead>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                </tr>
            </c:forEach>
        </table>
    </div
</div>
</body>
</html>
