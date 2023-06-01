package com.example.ss11_thuc_hanh.service;

import com.example.ss11_thuc_hanh.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getAll();

    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);

    void delete(int id);
}
