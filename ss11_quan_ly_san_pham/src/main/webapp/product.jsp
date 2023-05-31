<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product-servlet?action=create">ADD NEW PRODUCT</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Status</th>
        <th>Producer</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach items="${products}" var="products">
        <tr>
            <td>${products.id}</td>
            <td>${products.name}</td>
            <td>${products.price}</td>
            <td>${products.status}</td>
            <td>${products.producer}</td>
            <td><a href="/product-servlet?action=edit&id=${products.getId()}">Edit</a></td>
            <td><a href="/product-servlet?action=delete&id=${products.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
