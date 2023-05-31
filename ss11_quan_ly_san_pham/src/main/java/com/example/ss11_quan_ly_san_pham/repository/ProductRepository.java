package com.example.ss11_quan_ly_san_pham.repository;

import com.example.ss11_quan_ly_san_pham.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> list = new ArrayList<>();

    static {
        list.add(new Product(1, "AF1", 1000, "New", "Nike"));
        list.add(new Product(2, "AM97", 2000, "New", "Nike"));
        list.add(new Product(3, "Jordan", 3000, "New", "Nike"));
    }

    @Override
    public List<Product> showList() {
        return list;
    }

    @Override
    public void add(Product product) {
        list.add(product);
    }

    @Override
    public void edit(int id, String name, double price, String status, String producer) {
        Product product = findById(id);
        product.setName(name);
        product.setPrice(price);
        product.setStatus(status);
        product.setProducer(producer);
    }

    @Override
    public void delete(int id) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            if (list.get(i).getId() == id) {
                list.remove(i);
                break;
            }
        }
    }

    @Override
    public Product findById(int id) {
        for (Product p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }
}
