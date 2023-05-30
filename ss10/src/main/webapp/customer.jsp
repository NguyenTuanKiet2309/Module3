<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30-05-2023
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous"
/>
<body>
<c:import url="navbar.jsp"></c:import>
<h2 style="text-align: center">Danh Sách Khách Hàng</h2>
<table class="table table-bordered">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Date</th>
        <th>Address</th>
    </tr>
    <c:forEach items="${list}" var="c" varStatus="loop">
        <tr>
            <td>
                <c:out value="${loop.count}"/>
            </td>
            <td>
                <c:out value="${c.name}"/>
            </td>
            <td>
                <c:if test="${c.gender == true}">Nam</c:if>
                <c:if test="${c.gender == false}">Nữ</c:if>
            </td>
            <td>
                <c:out value="${c.date}"/>
            </td>
            <td>
                <c:out value="${c.address}"/>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
