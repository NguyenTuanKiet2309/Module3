<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 31-05-2023
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
        }

        tr, th, td {
            width: 200px;
            height: 50px;
            border: black solid 1px;
            padding: 0;
            text-align: center;
        }
    </style>
</head>
<body>
<a href="/laptop-servlet?action=create">Create New Laptop</a>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Brand</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${laptop}" var="laptop">
        <tr>
            <td>${laptop.id}</td>
            <td>${laptop.name}</td>
            <td>${laptop.price}</td>
            <td>${laptop.brand}</td>
            <td><a href="/laptop-servlet?action=edit&id=${laptop.getId()}">Edit</a></td>
            <td><a href="/laptop-servlet?action=delete&id=${laptop.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
