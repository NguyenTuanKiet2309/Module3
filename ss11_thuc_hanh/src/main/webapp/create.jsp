<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 31-05-2023
  Time: 08:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
</head>
<body>
<h1>Create New Customer</h1>
<p>
    <c:if test="${message!=null}">
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/customers">Back to Home</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table border="1">
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
