package com.example.ss11_quan_ly_san_pham.controller;

import com.example.ss11_quan_ly_san_pham.model.Product;
import com.example.ss11_quan_ly_san_pham.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                response.sendRedirect("/product-servlet");
                break;
            case "delete":
                deleteProduct(request, response);
                response.sendRedirect("/product-servlet");
                break;
            default:
                showListProduct(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = this.productService.showList();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewProduct(request, response);
                response.sendRedirect("/product-servlet");
                break;
            case "edit":
                editProduct(request, response);
                response.sendRedirect("/product-servlet");
                break;
            default:
                showListProduct(request, response);
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        productService.edit(request);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        productService.delete(request);
    }

    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        productService.add(request);
    }
}
