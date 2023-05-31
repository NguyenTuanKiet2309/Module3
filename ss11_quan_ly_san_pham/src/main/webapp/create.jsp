<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 31-05-2023
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <a href="/product-servlet">Back to List</a>
</p>
<form method="post" action="/product-servlet?action=add" id="add-product">
    <fieldset>
        <legend>Products information</legend>
        <table border="1">
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
                <td><input type="number" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><input type="text" name="status" id="status"></td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td><input type="text" name="producer" id="producer"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create customer" form="add-product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
