<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Menu list</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <br>

    <div class="container">
        <h3 class="text-center">Menu List</h3>
        <hr>
        <div class="text-left">
            <a href="${pageContext.request.contextPath}/new" class="btn btn-success">Add New Item</a>
        </div>
        <br>
        <table class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Category</th>
                    <th>Menu Name</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="menu" items="${menuList}">
                    <tr>
                        <td><c:out value="${menu.id}" /></td>
                        <td><c:out value="${menu.categoryID}" /></td>
                        <td><c:out value="${menu.menuName}" /></td>
                        <td><c:out value="${menu.price}" /></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/edit?id=<c:out value='${menu.id}' />"
                                class="btn btn-primary btn-sm">Edit</a>
                            <a href="${pageContext.request.contextPath}/delete?id=<c:out value='${menu.id}' />"
                                class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
