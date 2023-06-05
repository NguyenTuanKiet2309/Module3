package com.example.demo1.repository;

import com.example.demo1.model.Product;
import com.example.demo1.model.ProductType;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
        String query = "select p.*,py.product_type_name from products p join product_type py on p.product_type_id = py.product_type_id;";
    @Override
    public List<Product> getAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                String description = resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("image");
                int idType = resultSet.getInt("product_type_id");
                String nameType = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(idType,nameType);
                Product product = new Product(id,name,description,price,image,productType);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public void create(Product product) {

    }
}
