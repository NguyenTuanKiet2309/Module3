package com.example.ss12_thuc_hanh.repository;

import com.example.ss12_thuc_hanh.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private String jdbcUsername = "root";
    private String jdbcPassword = "codegym";

    private static final String SP_INSERT_USERS_SQL = "call add_new_users(?,?,?)";
    private static final String SP_SELECT_ALL_USERS = "call find_all()";
    private static final String SP_DELETE_USERS_SQL = "call delete_users(?)";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String FIND_BY_COUNTRY = "select * from users where country like ?";
    private static final String SORT_BY_NAME = "select * from users order by name";


    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    private void addUserTransaction() {
        Connection connection = getConnection();
        Savepoint savepoint = null;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement1 = connection.prepareStatement("insert into users(name,email,country)" +
                    " values ('Kiệt','kiet@gmail','GiaLai')");
            PreparedStatement preparedStatement2 = connection.prepareStatement("insert into users(name,email,country)" +
                    " values ('nhan','nhan@gmail','QuangNam',1)");
            PreparedStatement preparedStatement3 = connection.prepareStatement("insert into users(name,email,country)" +
                    " values ('huy','huy@gmail','GiaLai')");
            preparedStatement1.executeUpdate();
            preparedStatement2.executeUpdate();
            savepoint = connection.setSavepoint("save_point_1");
            preparedStatement3.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback(savepoint);
                connection.commit();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            e.printStackTrace();
        }
    }

    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = getConnection();
        try (CallableStatement callableStatement = connection.prepareCall(SP_INSERT_USERS_SQL)) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getGmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        Connection connection = getConnection();
        try (CallableStatement callableStatement = connection.prepareCall(SP_SELECT_ALL_USERS);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id1 = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id1, name, email, country));
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
        return users;
    }

    @Override
    public void delete(int id) {
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_DELETE_USERS_SQL);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void update(User user) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getGmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public List<User> findByCountry(String country) {
        List<User> users = new ArrayList<>();
        Connection connection = getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_COUNTRY)) {
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                users.add(new User(id, name, email, country));
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
        return users;
    }

    @Override
    public List<User> sortByName() {
        List<User> userList = new ArrayList<>();
        Connection connection = getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
