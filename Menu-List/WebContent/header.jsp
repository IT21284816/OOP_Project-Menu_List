<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<title>Insert title here</title>
<style>

 .navbar {
        background-color: #FF5733; 
    }


.nav-link {
    font-size: 15px; 
    color: #fff; 
}


.nav-link {
    padding: 10px 20px;
}


.nav-link i {
    font-size: 18px; 
}


</style>


</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
            <div>
                <a href="${pageContext.request.contextPath}/all-list" class="nav-link">
                    <i class="fas fa-home"></i> Home
                </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="#" class="nav-link">
                    <i class="fas fa-shopping-cart"></i> Cart
                </a></li>
                <li><a href="${pageContext.request.contextPath}/list" class="nav-link">
                    <i class="fas fa-cogs"></i> Admin
                </a></li>
                <li><a href="#" class="nav-link">
                    <i class="fas fa-info-circle"></i> About Us
                </a></li>
                <li><a href="#" class="nav-link">
                    <i class="fas fa-envelope"></i> Contact Us
                </a></li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li><a href="#" class="nav-link">
                    <i class="fas fa-user-plus"></i> Register
                </a></li>
                <li><a href="#" class="nav-link">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a></li>
            </ul>
        </nav>
    </header>
</body>

</html>