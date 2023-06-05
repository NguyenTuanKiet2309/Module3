package com.example.ss12_thuc_hanh.service;

import com.example.ss12_thuc_hanh.model.User;
import com.example.ss12_thuc_hanh.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private UserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public List<User> getAll() {
        List<User> userList = userRepository.getAll();
        return userList;
    }

    @Override
    public void delete(int id) throws SQLException {
            userRepository.delete(id);
    }

    @Override
    public void update(User user) throws SQLException {
            userRepository.update(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = userRepository.findByCountry(country);
        return userList;
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = userRepository.sortByName();
        return userList;
    }
}
