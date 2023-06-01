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
    <a href="/customers-servlet?action=create">Create new Customer</a>
</p>
<table>
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach  items="${customer}" var="customer">
        <tr>
            <td><a href="/customers-servlet?action=view&id=${customer.getId()}">${customer.getName()}</a> </td>
            <td>${customer.getEmail()} </td>
            <td>${customer.getAddress()} </td>
            <td><a href="/customers-servlet?action=edit&id=${customer.getId()}">edit</a> </td>
            <td><a href="/customers-servlet?action=delete&id=${customer.getId()}">delete</a> </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
