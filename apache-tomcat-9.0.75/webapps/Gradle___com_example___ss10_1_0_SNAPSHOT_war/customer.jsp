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
<body>
<h2>Danh Sách Khách Hàng</h2>
<table>
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
            <c:out value="${loop.count}"/>;
        </td>
        <td>
            <c:out value="${c.name}"/>;
        </td>
        <td>
            <c:out value="${c.gender}"/>;
        </td>
        <td>
            <c:out value="${c.date}"/>;
        </td>
        <td>
            <c:out value="${c.address}"/>;
        </td>
    </tr>
</c:forEach>
</table>
</body>
</html>
