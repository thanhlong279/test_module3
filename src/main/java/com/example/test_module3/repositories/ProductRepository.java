package com.example.test_module3.repositories;

import com.example.test_module3.models.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select * from code_gym.Products");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ProductID");
                String name = resultSet.getString("ProductName");
                double price = resultSet.getDouble("Price");
                double discount = resultSet.getDouble("Discount");
                int quantity = resultSet.getInt("StockQuantity");
                products.add(new Product(name, price, discount, quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public void save(Product product) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().
                    prepareStatement("insert into Products(ProductName, Price, Discount, StockQuantity) value (?, ?, ?, ?)");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setDouble(3, product.getDiscount());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> findAllSale(String startDate, String endDate) {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("SELECT *\n" +
                    "FROM Products\n" +
                    "INNER JOIN Orders ON FIND_IN_SET(Products.ProductID, Orders.id_products)\n" +
                    "WHERE Orders.OrderDate BETWEEN ? AND ?");
            preparedStatement.setString(1, startDate);
            preparedStatement.setString(2, endDate);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("ProductID");
                String name = resultSet.getString("ProductName");
                double price = resultSet.getDouble("Price");
                double discount = resultSet.getDouble("Discount");
                int quantity = resultSet.getInt("StockQuantity");
                products.add(new Product(name, price, discount, quantity));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}
