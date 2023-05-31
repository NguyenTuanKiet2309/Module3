package com.example.ss11_quan_ly_san_pham.service;

import com.example.ss11_quan_ly_san_pham.model.Product;
import com.example.ss11_quan_ly_san_pham.repository.ProductRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class ProductService implements IProductService {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> showList() {
        return productRepository.showList();
    }

    @Override
    public void add(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String status = request.getParameter("status");
        String producer = request.getParameter("producer");
        productRepository.add(new Product(id, name, price, status, producer));
    }

    @Override
    public void delete(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        productRepository.delete(id);
    }

    @Override
    public void findById(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        productRepository.findById(id);
    }

    @Override
    public void edit(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String status = request.getParameter("status");
        String producer = request.getParameter("producer");
        productRepository.edit(id,name,price,status,producer);
    }

    @Override
    public void findById(int id) {
        productRepository.findById(id);
    }
}
