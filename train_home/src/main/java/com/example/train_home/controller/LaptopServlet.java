package com.example.train_home.controller;

import com.example.train_home.model.Laptop;
import com.example.train_home.service.LaptopService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LaptopServlet", value = "/laptop-servlet")
public class LaptopServlet extends HttpServlet {
    private LaptopService laptopService = new LaptopService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "delete":
                deleteLaptop(request, response);
                response.sendRedirect("/laptop-servlet");
                break;
            case "edit":
                showFormEdit(request, response);
                response.sendRedirect("/laptop-servlet");
                break;
            default:
                showLaptop(request, response);
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteLaptop(HttpServletRequest request, HttpServletResponse response) {
        laptopService.delete(request);
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showLaptop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Laptop> laptop = this.laptopService.getAll();
        request.setAttribute("laptop", laptop);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("laptop.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createLaptop(request, response);
                response.sendRedirect("/laptop-servlet");
                break;
            case "edit":
                editLaptop(request, response);
                response.sendRedirect("/laptop-servlet");
                break;
            default:
                showLaptop(request, response);

        }
    }

    private void editLaptop(HttpServletRequest request, HttpServletResponse response) {
        laptopService.edit(request);
    }

    private void createLaptop(HttpServletRequest request, HttpServletResponse response) {
        laptopService.create(request);
    }
}
