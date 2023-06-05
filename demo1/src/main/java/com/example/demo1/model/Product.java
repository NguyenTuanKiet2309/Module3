package com.example.demo1.model;

public class Product {
    private int id;
    private String productName;
    private String description;
    private double price;
    private String image;
    private ProductType productType;

    public Product() {
    }

    public Product(String productName, String description, double price, String image, ProductType productType) {
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.image = image;
        this.productType = productType;
    }

    public Product(int id, String productName, String description, double price, String image, ProductType productType) {
        this.id = id;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.image = image;
        this.productType = productType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }
}
