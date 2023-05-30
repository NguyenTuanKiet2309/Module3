package com.example.ss10.repository;

import com.example.ss10.model.Customer;
import com.example.ss10.repository.impl.ICustomerRepository;

import javax.rmi.CORBA.Stub;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> list = new ArrayList<>();

    static {
        list.add(new Customer(1, "Kiệt", true, "09-07-1996", "Đà Nẵng"));
        list.add(new Customer(2, "Nhàn", true, "12-12-1996", "Đà Nẵng"));
        list.add(new Customer(3, "Hạnh", false, "11-11-1996", "Đà Nẵng"));
        list.add(new Customer(4, "Huy", true, "03-03-1996", "Đà Nẵng"));
        list.add(new Customer(5, "Nam", true, "04-05-1996", "Đà Nẵng"));
    }

    @Override
    public List<Customer> display() {
        return list;
    }
}
