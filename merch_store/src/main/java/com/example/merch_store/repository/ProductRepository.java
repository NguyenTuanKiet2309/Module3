package com.example.merch_store.repository;

import com.example.merch_store.model.Customer;
import com.example.merch_store.model.Product;
import com.example.merch_store.model.ProductType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String GET_PRODUCT_BY_ID = "select * from products where id = ?";
    private static final String SELECT_ALL_PRODUCTS = "select * from products";

    @Override
    public Product getProductId(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnection();
        try {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_BY_ID);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    int id1 = resultSet.getInt("product_id");
                    String name = resultSet.getString("product_name");
                    String description = resultSet.getString("product_description");
                    double price = resultSet.getDouble("price");
                    String image = resultSet.getString("image");
                    int id_productType = resultSet.getInt("product_type_id");
                    String name_productType = resultSet.getString("product_type_name");
                    ProductType productType = new ProductType(id_productType,name_productType);
                    product = new Product(id1,name,description,price,image,productType);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> getAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try (CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_PRODUCTS);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                String description = resultSet.getString("product_description");
                double price = Double.parseDouble(resultSet.getString("price"));
                String image = resultSet.getString("image");
                int id_productType = resultSet.getInt("product_type_id");
                String name_productType = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(id_productType,name_productType);
                productList.add(new Product(id,name,description,price,image,productType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }
}
