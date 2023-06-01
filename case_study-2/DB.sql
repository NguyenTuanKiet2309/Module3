create database case_study_2;
use case_study_2;
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);
CREATE TABLE account_users (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(50) NOT NULL
);
CREATE TABLE users_role (
    role_id INT,
    account_id INT,
    PRIMARY KEY (role_id , account_id),
    FOREIGN KEY (role_id)
        REFERENCES roles (role_id),
    FOREIGN KEY (account_id)
        REFERENCES account_users (account_id)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    account_id INT,
    FOREIGN KEY (account_id)
        REFERENCES account_users (account_id)
);
    
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price DOUBLE,
    `describe` VARCHAR(100),
    product_image TEXT
);
CREATE TABLE type_products (
    type_product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    FOREIGN KEY (product_id)
        REFERENCES products (product_id),
    type_product VARCHAR(50)
);
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);
CREATE TABLE order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    FOREIGN KEY (order_id)
        REFERENCES `order` (order_id),
    product_id INT,
    FOREIGN KEY (product_id)
        REFERENCES products (product_id),
    quanlity INT,
    price DOUBLE
);