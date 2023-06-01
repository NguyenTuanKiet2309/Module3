<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 31-05-2023
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/laptop-servlet">Back to list</a>
<form method="post" action="/laptop-servlet?action=create" id="createlaptop">
    <table>
        <tr>
            <td>Id:</td>
            <td><input type="number" name="id" id="id"></td>
        </tr>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" id="price"></td>
        </tr>
        <tr>
            <td>Brand:</td>
            <td><input type="text" name="brand" id="brand"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="createLaptop" form="createlaptop">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
