<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 02-06-2023
  Time: 08:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<main role="main">
    <div class="container mt-4">

        <div id="thongbao" class="alert alert-danger d-none face" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>
        </div>

        <h1 class="text-center">Cart</h1>
        <div class="row">
            <div class="col col-md-12">
                <table class="table table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th>STT</th>
                        <th>Products Image</th>
                        <th>Products Name</th>
                        <th>Quanlity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="datarow">
                    <tr>
                        <td>1</td>
                        <td>
                            <img src="images/12.png" class="hinhdaidien" style="width: 100px">
                        </td>
                        <td>SMITHEREENS Black Pullover Hoodie</td>
                        <td class="text-right">
                            <div class="cart-quantity cart-column">
                                <input class="cart-quantity-input" type="number" value="1">
                            </div>
                        </td>
                        <td class="text-right">1</td>
                        <td class="text-right">1</td>
                        <td>
                            <!-- Nút xóa, bấm vào sẽ xóa thông tin dựa vào khóa chính `id_products` -->
                            <a id="delete_1" data-sp-ma="2" class="btn btn-danger btn-delete-sanpham">
                                <i class="fa fa-trash" aria-hidden="true"></i> Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <img src="view/images/12.png" class="hinhdaidien" style="width: 100px">
                        </td>
                        <td>SMITHEREENS Black Pullover Hoodie</td>
                        <td class="text-right">
                            <div class="cart-quantity cart-column">
                                <input class="cart-quantity-input" type="number" value="1">
                            </div>
                        </td>
                        <td class="text-right">1</td>
                        <td class="text-right">1</td>
                        <td>
                            <!-- Nút xóa, bấm vào sẽ xóa thông tin dựa vào khóa chính `sp_ma` -->
                            <a id="delete_2" data-sp-ma="6" class="btn btn-danger btn-delete-sanpham">
                                <i class="fa fa-trash" aria-hidden="true"></i> Delete
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>
                            <img src="view/images/12.png" class="hinhdaidien" style="width: 100px">
                        </td>
                        <td>SMITHEREENS Black Pullover Hoodie</td>
                        <td class="text-right">
                            <div class="cart-quantity cart-column">
                                <input class="cart-quantity-input" type="number" value="1">
                            </div>
                        </td>
                        <td class="text-right">1</td>
                        <td class="text-right">1</td>
                        <td>
                            <!-- Nút xóa, bấm vào sẽ xóa thông tin dựa vào khóa chính `sp_ma` -->
                            <a id="delete_3" data-sp-ma="4" class="btn btn-danger btn-delete-sanpham">
                                <i class="fa fa-trash" aria-hidden="true"></i> Delete
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <a href="checkout.html" class="btn btn-primary btn-md"><i
                        class="fa fa-shopping-cart" aria-hidden="true"></i>Pay</a>
            </div>
        </div>
    </div>
    <!-- End block content -->
</main>
</body>
</html>
