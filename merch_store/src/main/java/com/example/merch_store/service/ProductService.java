package com.example.merch_store.service;

import com.example.merch_store.model.Product;
import com.example.merch_store.model.ProductType;
import com.example.merch_store.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public Product getProductId(int id) {
        return productRepository.getProductId(id);
    }

    @Override
    public List<Product> getAll() {
        return productRepository.getAll();
    }
}
