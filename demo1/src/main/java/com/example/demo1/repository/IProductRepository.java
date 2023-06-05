package com.example.demo1.repository;

import com.example.demo1.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();

    void create(Product product);
}
