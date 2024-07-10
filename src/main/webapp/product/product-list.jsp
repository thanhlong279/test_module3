<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/10/2024
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách sản pham</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Trang chủ</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="/product">Product</a>
            </div>
        </div>
        <form class="d-flex" action="product" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <input type="hidden" name="action" value="search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</nav>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<div class="container">
    <h1>Danh sach san pham</h1>
    <button class="btn btn-primary mt-4" onclick="window.location.href='/product?action=product-create'">Thêm moi</button>

    <form class="d-flex" action="product" method="post">
        <div class="col-md-2">
            <label for="startDate" class="form-label">Danh sáchsanrm phẩm đc đặt từ</label>
            <input type="date" class="form-control" id="startDate" name="startDate"
                   value="<%= request.getParameter("startDate") %>">
        </div>

        <div class="col-md-2">
            <label for="endDate" class="form-label">Đến</label>
            <input type="date" class="form-control" id="endDate" name="endDate"
                   value="<%= request.getParameter("endDate") %>">
        </div>
        <button class="btn btn-outline-success" type="submit">Xem</button>
    </form>
<%--    <button type="submit" class="btn btn-primary">Xem</button>--%>
<%--    <p>Danh sach Top: </p>--%>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Số thứ tự</th>
            <th>Ten san pham</th>
            <th>Gia</th>
            <th>Discount</th>
            <th>Stock Quantity</th>
        </tr>
        </thead>
        <tbody>
        <%--        for(Student student : students)--%>
        <c:forEach var="product" items="${products}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.discount}</td>
            <td>${product.quantity}</td>
            <td>
                <a href="/student?action=edit&id=${product.id}" class="btn btn-warning">edit</a>
                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${product.id}">Xóa</button>
                <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Xóa san pham</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Bạn có muốn xóa học sinh có tên là ${product.name}?
                                <p style="color: red">Hành động này không thể hoàn tác!!!!!</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <form action="/product?action=delete" method="post">
                                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                                    <input type="hidden" name="id" value="${product.id}">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>