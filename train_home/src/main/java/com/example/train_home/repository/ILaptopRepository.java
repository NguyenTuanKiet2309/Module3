package com.example.train_home.repository;

import com.example.train_home.model.Laptop;

import java.util.List;

public interface ILaptopRepository {
    List<Laptop> getAll();

    void create(Laptop laptop);

    void edit(int id, String name, double price, String brand);

    void delete(int id);

    Laptop findId(int id);
}
