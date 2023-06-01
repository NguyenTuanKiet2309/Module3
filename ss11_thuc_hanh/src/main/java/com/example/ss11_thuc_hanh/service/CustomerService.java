package com.example.ss11_thuc_hanh.service;

import com.example.ss11_thuc_hanh.model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService{
    private static Map<Integer,Customer> map = new HashMap<>();

    static {
        map.put(1, new Customer(1,"John", "john@codegym.vn", "Hanoi"));
        map.put(2, new Customer(2,"Bill", "bill@codegym.vn", "DaNang"));
        map.put(3, new Customer(3,"Alex", "alex@codegym.vn", "GiaLai"));
        map.put(4, new Customer(4,"Adam", "adam@codegym.vn", "HaiDuong"));
        map.put(5, new Customer(5,"Eva", "eva@codegym.vn", "Hanoi"));
        map.put(6, new Customer(6,"Sophia", "sophia@codegym.vn", "Hanoi"));
    }
    @Override
    public List<Customer> getAll() {
        return new ArrayList<>(map.values());
    }

    @Override
    public void save(Customer customer) {
        map.put(customer.getId(),customer);
    }

    @Override
    public Customer findById(int id) {
        return map.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        map.put(id,customer);
    }

    @Override
    public void delete(int id) {
        map.remove(id);
    }
}
