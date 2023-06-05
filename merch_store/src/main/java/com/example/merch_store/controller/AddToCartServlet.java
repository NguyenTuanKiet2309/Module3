package com.example.merch_store.controller;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;
import com.example.merch_store.model.Product;
import com.example.merch_store.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToCartServlet", value = "/view/addtoCart")
public class AddToCartServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        int id;
        if (request.getParameter("ProductId") != null) {
            id = Integer.parseInt(request.getParameter("ProductId"));
            Product product = productService.getProductId(id);
            if (product != null) {
                if (request.getParameter("quantity") != null) {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                }
                HttpSession session = request.getSession();
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    List<OrderDetail> orderDetailList = new ArrayList<>();
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setQuantity(quantity);
                    orderDetail.setProduct(product);
                    orderDetail.setUnitPrice(product.getPrice());
                    orderDetailList.add(orderDetail);
                    order.setOrderDetails(orderDetailList);
                    session.setAttribute("order", order);
                } else {
                    Order order = (Order) session.getAttribute("order");
                    List<OrderDetail> orderDetailList = order.getOrderDetails();
                    boolean check = false;
                    for (OrderDetail orderDetail : orderDetailList) {
                    if (orderDetail.getProduct().getId() == product.getId()) {
                            orderDetail.setQuantity(orderDetail.getQuantity() + quantity);
                            check = true;
                        }
                    }
                    if (check == false) {
                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.setQuantity(quantity);
                        orderDetail.setProduct(product);
                        orderDetail.setUnitPrice(product.getPrice());
                        orderDetailList.add(orderDetail);
                    }
                    session.setAttribute("order", order);
                }
            }
            response.sendRedirect(request.getContextPath() + "/view/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/view/index.jsp");

        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
