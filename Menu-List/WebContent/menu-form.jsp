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
       
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            background-color: #f3f4f5; 
            border: 1px solid #ced4da;
            border-radius: 10px;
            padding: 8px;
            width: 100%;
        }

        button[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 10px 40px;
            cursor: pointer;
            transition: background-color 0.5s ease-in-out;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .caption {
            text-align: center;
        }
    </style>
</head>
<body>

    <jsp:include page="header.jsp" />
    <br>

    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${menu != null}">
                    
                     <form name="menuForm" action="update" method="post" onsubmit="return validateForm()">
                </c:if>
                <c:if test="${menu == null}">
                     <form name="menuForm" action="insert" method="post" onsubmit="return validateForm()">
                </c:if>

                <div class="caption">
                    <h3>
                        <c:if test="${menu != null}">
                            Edit Menu Item
                        </c:if>
                        <c:if test="${menu == null}">
                            Add New Menu Item
                        </c:if>
                    </h3>
                </div>
                
                <br>

                <c:if test="${menu != null}">
                    <input type="hidden" name="id" value="<c:out value='${menu.id}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Category ID</label> <input type="text"
                        value="<c:out value='${menu.categoryID}' />" class="form-control"
                        name="categoryID" >
                </fieldset>

                <fieldset class="form-group">
                    <label>Menu Name</label> <input type="text"
                        value="<c:out value='${menu.menuName}' />" class="form-control"
                        name="menuName" >
                </fieldset>

                <fieldset class="form-group">
                    <label>Price</label> <input type="text"
                        value="<c:out value='${menu.price}' />" class="form-control"
                        name="price" >
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
    
    <!--validations-->
    
     <script>
        function validateForm() {
            var categoryID = document.forms["menuForm"]["categoryID"].value;
            var menuName = document.forms["menuForm"]["menuName"].value;
            var price = document.forms["menuForm"]["price"].value;

            if (categoryID == "") {
                alert("Category ID must be filled out");
                return false;
            }

            if (menuName == "") {
                alert("Menu Name must be filled out");
                return false;
            }

            if (price == "" || isNaN(price)) {
                alert("Price must be a numeric value");
                return false;
            }

            alert("Item Added Successfully");
            return true;
        }
    </script>
    <jsp:include page="footer.jsp" />
</body>
</html>
