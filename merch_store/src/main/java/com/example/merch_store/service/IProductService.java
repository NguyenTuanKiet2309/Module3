package com.example.merch_store.service;

import com.example.merch_store.model.Product;

import java.util.List;

public interface IProductService {
    Product getProductId(int id);
    public List<Product> getAll();

}
