package com.example.ss11_quan_ly_san_pham.repository;

import com.example.ss11_quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showList();

    void add(Product product);

    void edit(int id, String name, double price, String status, String producer);

    void delete(int id);

    Product findById(int id);
}
