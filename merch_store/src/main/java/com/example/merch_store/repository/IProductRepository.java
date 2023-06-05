package com.example.merch_store.repository;

import com.example.merch_store.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepository {
    Product getProductId(int id);


    public List<Product> getAll();

}
