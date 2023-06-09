<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gio hang</title>
</head>
<body>
<h2>Thong tin gio hang:</h2>
<table border="1">
    <tr>
        <td>Id SP</td>
        <td>Ten SP</td>
        <td>Anh</td>
        <td>So luong</td>
        <td>Gia</td>
        <td>Tong tien</td>
        <td>Lua chon</td>
    </tr>
    <c:forEach items="${sessionScope.order.orderDetails}" var="order">
        <tr>
            <td>${order.key }</td>
            <td>${order.product.name }</td>
            <td><img src=?image=${order.product.image }" width="100" /></td>
            <td>${order.quantity }</td>
            <td>${order.unitPrice }</td>
            <td>${order.quantity * order.unitPrice}</td>
            <td><a href=?key=${order.id}">Xoa</a></td>
        </tr>
    </c:forEach>
</table>
<%--<a href="/add-order">Thanh toan</a>--%>
</body>
</html>