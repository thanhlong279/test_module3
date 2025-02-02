<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 28/06/2024
  Time: 09:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách học sinh</title>
    <meta charset="utf-8">
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
    </div>
</nav>
<div class="container">
    <form method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Tên SP</label>
            <input type="text" class="form-control" id="name" name="name" required maxlength="100" minlength="5">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Giá Bán</label>
            <input type="number" class="form-control" id="price" name="price" required min = "0">
        </div>
<%--        <div class="mb-3">--%>
<%--            <label for="discount" class="form-label">Giảm Giá (%)</label>--%>
<%--            <input type="number" class="form-control" id="discount" name="discount" required min="0" max="100">--%>
<%--        </div>--%>
        <select id="discount" name="discount" required>
            <option value="5">5%</option>
            <option value="10">10%</option>
            <option value="15">15%</option>
            <option value="20">20%</option>
        </select><br><br>
        <div class="mb-3">
            <label class="form-label" for="quantity">Số Lượng (SP)</label>
            <input type="number" step="0.1" class="form-control" id="quantity" name="quantity" min="0" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
