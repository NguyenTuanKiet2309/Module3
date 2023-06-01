package com.example.ss12_thuc_hanh.repository;

import com.example.ss12_thuc_hanh.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;

    public List<User> getAll();

    public void delete(int id) throws SQLException;

    public void update(User user) throws SQLException;

    public List<User> findByCountry(String country);

    public List<User> sortByName();
}
