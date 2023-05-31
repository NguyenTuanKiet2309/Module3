package com.example.ss11_quan_ly_san_pham.service;

import com.example.ss11_quan_ly_san_pham.model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IProductService {
    List<Product> showList();

    void add(HttpServletRequest request);

    void delete(HttpServletRequest request);

    void findById(HttpServletRequest request);
    void edit(HttpServletRequest request);
    void findById(int id);
}
