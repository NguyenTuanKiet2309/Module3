<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<style>
    .discount {
        height:180px; width:230px;
        margin:0;
        padding:10px;
        border:1px #CCC solid;
    }
</style>
<body>
<form method="post" action="/discount-servlet">
    <div class="discount">
        <h3>Product Discount Calculator</h3>
        <input type="text" name="description" size="30" style="width: 228px" placeholder="Product Description"/>
        <input type="number" name="price" size="30" style="width: 228px" placeholder="List Price"/>
        <input type="number" name="percent" size="30" style="width: 228px" placeholder="Discount Percent"/>
        <input type="submit" value="Calculate Discount"/>
    </div>
</form>
</body>
</html>