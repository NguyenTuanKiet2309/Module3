<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29-05-2023
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .result{
        height:180px; width:400px;
        margin:0;
        padding:10px;
        border:1px #CCC solid;
    }
</style>
<body>
<form>
    <div class="result">
        <p>Discount Amout(Lượng chiết khấu): ${discountAmount} </p>
        <p>Discount Price(Giá sau khi đã được chiết khấu): ${discountPrice}</p>
    </div>
</form>
</body>
</html>

