package com.example.demo1.service;

import com.example.demo1.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();

    void create(Product product);
}
