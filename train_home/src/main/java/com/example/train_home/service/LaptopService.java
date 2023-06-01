package com.example.train_home.service;

import com.example.train_home.model.Laptop;
import com.example.train_home.repository.LaptopRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class LaptopService implements ILaptopService {
    private LaptopRepository laptopRepository = new LaptopRepository();

    @Override
    public List<Laptop> getAll() {
        return laptopRepository.getAll();
    }

    @Override
    public void create(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String brand = request.getParameter("brand");
        laptopRepository.create(new Laptop(id,name,price,brand));
    }

    @Override
    public void edit(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String brand = request.getParameter("brand");
        laptopRepository.edit(id,name,price,brand);
    }

    @Override
    public void delete(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        laptopRepository.delete(id);
    }
}
