package com.example.test_module3.controllers;

import com.example.test_module3.models.Product;
import com.example.test_module3.services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Controller", urlPatterns = "/product")
public class Controller extends HttpServlet {
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "product-create":
                req.getRequestDispatcher("/product/product-create.jsp").forward(req, resp);
                break;
            default:
                List<Product> products = productService.findAll();
                req.setAttribute("products", products);
                req.getRequestDispatcher("/product/product-list.jsp").forward(req, resp);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "product-create":
                createProduct(req, resp);
                break;
            case "product":
                checkSales(req, resp);
                break;
        }
    }

    private void checkSales(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        List<Product> products = productService.findAllSale(startDate, endDate);
        RequestDispatcher requestDispatcher;
        if(products.isEmpty()) {
            req.setAttribute("message", "ko tìm thấy sản phẩm");
            requestDispatcher = req.getRequestDispatcher("/product");
        }else{
            req.setAttribute("products", products);
            requestDispatcher = req.getRequestDispatcher("/product");
        }
        requestDispatcher.forward(req, resp);
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException  {
        String name = req.getParameter("name");
        Double price = Double.parseDouble(req.getParameter("price"));
        Double discount = Double.parseDouble(req.getParameter("discount"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Product product = new Product(name, price, discount, quantity);
        productService.save(product);
        resp.sendRedirect("/product");
    }


}
