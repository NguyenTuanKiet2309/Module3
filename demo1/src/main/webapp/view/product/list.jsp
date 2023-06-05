<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 02-06-2023
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>description</th>
        <th>price</th>
        <th>image</th>
        <th>type</th>
    </tr>
    <c:forEach var="products" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${products.id}</td>
            <td>${products.productName}</td>
            <td>${products.description}</td>
            <td>${products.price}</td>
            <td><img ${products.image}/></td>
            <td>${products.productType.name}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
