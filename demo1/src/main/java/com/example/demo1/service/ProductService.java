package com.example.demo1.service;

import com.example.demo1.model.Product;
import com.example.demo1.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getAll() {
        return productRepository.getAll();
    }

    @Override
    public void create(Product product) {
        productRepository.create(product);
    }
}
