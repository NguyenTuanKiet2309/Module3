package com.example.merch_store.model;

import java.util.List;

public class Order {
    private int id;
    private Customer customer;
    private List<OrderDetail> orderDetails;
    private String status;

    public Order() {
    }

    public Order(int id, Customer customer, List<OrderDetail> products, String status) {
        this.id = id;
        this.customer = customer;
        this.orderDetails = products;
        this.status = status;
    }

    public Order(Customer customer, List<OrderDetail> products, String status) {
        this.customer = customer;
        this.orderDetails = products;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
