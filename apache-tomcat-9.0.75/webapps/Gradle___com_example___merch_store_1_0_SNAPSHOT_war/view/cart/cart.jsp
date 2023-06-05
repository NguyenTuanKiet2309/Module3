<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 02-06-2023
  Time: 08:45
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>cart</title>
</head>
<body>

<c:import url="header.jsp"></c:import>

<br/><br/>

<div class="container">
    <div class="content">
        <div class="shopping_cart">
            <c:forEach var="map" items="${sessionScope.myCartItems}">
                <div class="cart_box">
                    <div class="message">
                        <div class="list_img"><img src="${pageContext.request.contextPath}/resources/pages/images/pi1.jpg" class="img-responsive" alt=""></div>
                        <div class="list_close"><a href="${pageContext.request.contextPath}/cart/remove/${map.value.product.productId}.html">Remove item</a></div>
                        <div class="list_desc"><h4><a href="#"><c:out value="${map.value.product.productName}"/></a></h4><c:out value="${map.value.quantity}"/> x
                            $<c:out value="${map.value.product.productPrice}"/> = <span class="actual"> $<c:out value="${map.value.quantity * map.value.product.productPrice}"/></span></div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="total">
            <div class="total_right">Free Shipping</div>
            <div class="clearfix"> </div>
            <div class="total_right">Total: $<c:out value="${sessionScope.myCartTotal}"/></div>
            <div class="clearfix"> </div>
            <div class="total_right">VAT (10%): <c:out value="${sessionScope.myCartTotal * 0.1}"/></div>
            <div class="clearfix"> </div>
            <div class="total_right">Pay: $<c:out value="${sessionScope.myCartTotal + (sessionScope.myCartTotal * 0.1)}"/></div>
            <div class="clearfix"> </div>
        </div>
        <div class="login_buttons">
            <div class="check_button"><a href="checkout.html">Check out</a></div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>

</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>
