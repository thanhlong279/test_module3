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
    <title>Danh sách Sản Phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light  " style="background-color: #607D8B">
    <div class="container-fluid">
        <a class="navbar-brand" href="showroom?action=showHomeAdmin">
            <img src="${pageContext.request.contextPath}/showroom/images/logoHL2.png"  alt="LOGO" width="100px" height="100px">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="showroom?action=showHomeAdmin"><b>Home</b></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="showroom?action=list"><b>List Product</b></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="showroom?action=statistical"><b>Sales Revenue</b></a>
                    </li>
                </ul>
            </div>
        </div>
        <form class="d-flex" action="product?action=search" method="post">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <input type="hidden" name="action" value="search">
            <button class="btn btn-outline-dark" type="submit">
                <i class="bi bi-search"></i>
            </button>
        </form>
    </div>
</nav>




<div class="container">
    <a class="btn btn-primary mt-4" onclick="window.location.href='/showroom?action=create'">
        Product <i class="bi bi-plus-circle-fill"></i>
    </a>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên Sản Phẩm</th>
            <th>Giá Bán</th>
            <th>Giảm Giá</th>
            <th>Tồn Kho</th>
        </tr>
        </thead>
        <tbody>
        <%--        for(Student student : students)--%>
        <c:forEach var="product" items="${products}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${product.name} </td>
                <td>${product.price} $</td>
                <td>${product.discount} %</td>
                <td>${product.quantity} SP</td>
                <td>
                    <a href="/showroom?action=edit&id=${product.id}" class="btn btn-success">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                    <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${product.id}">
                        <i class="bi bi-trash3"></i>
                    </a>

                    <div class="modal fade" id="deleteModal${product.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Xóa học sinh</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn xóa sản phẩm có tên là ${product.name}?
                                    <p style="color: red">Hành động này không thể hoàn tác!!!!!</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <form action="showroom?action=delete" method="post">
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                        <input type="hidden" name="id" value="${product.id}">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="/showroom?action=show_car&id=${product.id}" class="btn btn-secondary">
                        <i class="bi bi-arrows-angle-expand"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script>
    function navigateToPage(select) {
        if (select.value === "1") {
            window.location.href = '/showroom?action=statistical';
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
