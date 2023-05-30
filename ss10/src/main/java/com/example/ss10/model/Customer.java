package com.example.ss10.model;

public class Customer {
    private int id;
    private String name;
    private boolean gender;
    private String date;
    private String address;

    public Customer(int id, String name, boolean gender, String date, String address) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.date = date;
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
