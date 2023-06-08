package com.example.ss12_thuc_hanh.model;

public class User {
    private int id;
    private String name;
    private  String gmail;
    private String country;

    public User() {
    }

    public User(String name, String email, String country) {
        this.name = name;
        this.gmail = email;
        this.country = country;
    }

    public User(int id, String name, String email, String country) {
        this.id = id;
        this.name = name;
        this.gmail = email;
        this.country = country;
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

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
