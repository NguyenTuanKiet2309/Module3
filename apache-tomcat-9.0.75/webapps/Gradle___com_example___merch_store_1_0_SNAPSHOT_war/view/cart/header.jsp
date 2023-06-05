<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 02-06-2023
  Time: 08:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="header">
    <div class="message">
        <p class="">
            NO ADDITIONAL CUSTOM FEES OR TAXES FOR OUR ASIA CUSTOMERS
        </p>
    </div>
    <div class="container-fluid p-md-5 mt-1">
        <div
                class="row row-cols-3 justify-content-between align-items-center pt-2"
        >
            <div class="col col-auto d-block d-md-none">
                <button class="hamburger" onclick="switcher()">
                    <i class="fa fa-bars switcher-icon"></i>
                </button>
            </div>

            <div class="row col col-md-auto align-items-center">
                <div class="col col-auto">
                    <img
                            class="logo"
                            src="https://cdn.shopify.com/s/files/1/0554/1291/6301/files/JOJI_LOGO.png?v=1661459445&width=400"
                    />
                </div>
                <div class="col d-md-block d-none">
                    <a class="links" href="">SMITHEREENS</a>
                    <a class="links" href="">MERCH</a>
                    <a class="links" href="">MUSIC</a>
                </div>
            </div>

            <div class="col col-auto">
                <i class="far fa-user"></i>
                <i class="fa fa-shopping-bag bag-icon"></i>
            </div>
        </div>
    </div>
</div>
<script>
    function switcher() {
        let overlayMain = document.querySelector(".overlay--main");
        if (overlayMain.style.display === "none") {
            overlayMain.style.display = "block";
            document.body.style.overflow = "hidden";
        } else {
            overlayMain.style.display = "none";
            document.body.style.overflow = "visible";
        }
    }
</script>
</body>
</html>
