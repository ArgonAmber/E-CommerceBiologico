<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bamboo | E-commerce Bio</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
    <!-- CSS nostro -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcomeStyle.css">
    <!-- Link al file script.js -->
    <script src="${pageContext.request.contextPath}/js/script.js" defer></script>
</head>

<body>

<!-- Navbar -->
    <nav class="navbar custom-navbar">
    
     <div class="container-fluid d-flex justify-content-between align-items-center">
     
			<button class="navbar-toggler d-sm-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>     
     
            <div class="navbar-left d-none d-sm-inline">
                <a href="#">Prodotti</a> |
                <a href="#">Eventi</a> |
                <a href="#">Chi siamo</a>
            </div>
            
            <div class="navbar-center position-absolute start-50 translate-middle-x">
            	<a class="nav-link" href="/home">
                <img src="${pageContext.request.contextPath}/images/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
                </a>
            </div>
            
            <div class="navbar-right ms-auto">
            	<a class="nav-link" href="/welcome">
                <i class="bi bi-person"></i>
                </a>
            </div>
            
        </div>
    
    </nav>


    <h2>Welcome</h2>
     <form action="/login" method="post">
        <!-- PER IL TOKEN CSRF -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Accedi">
    </form>
    <p>${message}</p>
    
    <h2>Non hai un account?<a href="/preReg">Iscriviti</a></h2>
    
</body>
</html>
