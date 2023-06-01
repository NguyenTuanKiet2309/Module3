package com.example.train_home.service;

import com.example.train_home.model.Laptop;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ILaptopService {
    List<Laptop> getAll();

    void create(HttpServletRequest request);

    void edit(HttpServletRequest request);

    void delete(HttpServletRequest request);
}
