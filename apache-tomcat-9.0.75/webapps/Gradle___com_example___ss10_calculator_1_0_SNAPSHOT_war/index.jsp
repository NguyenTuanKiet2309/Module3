<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<form method="get" action="calculator-servlet">
    <h1>Simple Calculator</h1>
    <table>
        <tr>
            <td>First Number: </td>
            <td><input name="first-number" type="text"/></td>
        </tr>
        <tr>
            <td>Operator: </td>
            <td>
                <select name="operator">
                    <option value="+">+</option>
                    <option value="-">-</option>
                    <option value="*">*</option>
                    <option value="/">/</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second Number: </td>
            <td><input name="second-number" type="text"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Calculate"/></td>
        </tr>
    </table>
</form>
</body>
</html>