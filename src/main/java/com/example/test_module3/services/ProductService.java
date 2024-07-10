package com.example.test_module3.services;

import com.example.test_module3.models.Product;
import com.example.test_module3.repositories.ProductRepository;

import java.util.List;

public class ProductService {
    ProductRepository repo = new ProductRepository();
    public List<Product> findAll() {
        return repo.findAll();
    }

    public void save(Product product) {
            repo.save(product);
    }

    public List<Product> findAllSale(String startDate, String endDate) {
        return repo.findAllSale(startDate, endDate);
    }
}
