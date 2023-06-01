package com.example.train_home.repository;

import com.example.train_home.model.Laptop;

import java.util.ArrayList;
import java.util.List;

public class LaptopRepository implements ILaptopRepository {
    private static List<Laptop> laptopList = new ArrayList<>();

    static {
        laptopList.add(new Laptop(1, "Dell 1", 1000, "Dell"));
        laptopList.add(new Laptop(2, "Dell 2", 2000, "Dell"));
        laptopList.add(new Laptop(3, "Dell 3", 3000, "Dell"));
        laptopList.add(new Laptop(4, "Dell 4", 4000, "Dell"));
    }

    @Override
    public List<Laptop> getAll() {
        return laptopList;
    }

    @Override
    public void create(Laptop laptop) {
        laptopList.add(laptop);
    }

    @Override
    public void edit(int id, String name, double price, String brand) {
        Laptop laptop = findId(id);
        laptop.setName(name);
        laptop.setPrice(price);
        laptop.setBrand(brand);
    }

    @Override
    public void delete(int id) {
        int size = laptopList.size();
        for (int i = 0; i < size; i++) {
            if (laptopList.get(i).getId() == id) {
                laptopList.remove(i);
                break;
            }
        }
    }

    @Override
    public Laptop findId(int id) {
        for (Laptop l : laptopList) {
            if (l.getId() == id) {
                return l;
            }
        }
        return null;
    }
}
