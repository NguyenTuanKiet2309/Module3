<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 31-05-2023
  Time: 08:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h1>Customer</h1>
<p>
    <a href="/customers?action=create">Create new Customer</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${customers}" var="customers">
        <tr>
            <td><a href="/customers?action=view&id=${customers.getId()}">${customers.getName()}</a></td>
            <td>${customers.getEmail()} </td>
            <td>${customers.getAddress()} </td>
            <td><a href="/customers?action=edit&id=${customers.getId()}">edit</a></td>
            <td><a href="/customers?action=delete&id=${customers.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
