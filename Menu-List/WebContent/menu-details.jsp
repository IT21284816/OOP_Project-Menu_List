<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Menu List</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
        .card {
            background-color: #F2F2F2;
            transition: transform 0.2s;
            position: relative; 
        }

        .card-title {
            color: #333;
        }

        .card-text {
            color: #555;
        }

        .card:hover {
            transform: scale(1.05);
            background-color: #87ff8f;
        }

        .card-body {
            flex-grow: 1;
        }

        .add-to-cart-button {
            position: absolute; 
            bottom: 10px; 
            right: 20px; 
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <br>
    <div class="container">
        <h1 class="text-center">Menu</h1>
        <hr>
        <br>
        <div class="row">
            <c:forEach var="menu" items="${menuList}">
                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h4 class="card-title">${menu.menuName}</h4>
                            <p class="card-text">
                                <strong>ID : </strong> ${menu.categoryID}<br>
                                <strong>Price : </strong> ${menu.price}
                            </p>
                            <button class="btn btn-primary btn-cart add-to-cart-button">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXn2x2x5Bf5f5Vg5f5Vg5f5w5D"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-o5NQOvGB6jkHtr6Bf5f5f5f5f5mJZf4/cW5F5j5okp5s5l5r5N5r5N5r5T5V5s5C5k5"
        crossorigin="anonymous"></script>
        
        <hr>
        <jsp:include page="footer.jsp" />
</body>
</html>
