<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bamboo | E-commerce Bio</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
    <!-- CSS nostro -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

  <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="bi bi-list"></i>
            </button>
            <a class="navbar-brand mx-lg-0" href="#">
                <img src="${pageContext.request.contextPath}/images/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
            </a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/prodotti">Prodotti</a>
                    </li>
                    <li class="nav-item separator">|</li>
                    <li class="nav-item">
                        <a class="nav-link" href="/chisiamo">Chi siamo</a>
                    </li>
                </ul>
                
                <form class="d-lg-flex mx-auto custom-search-container">
        		<div class="custom-search-form position-relative">
            		<input type="search" class="form-control custom-search" placeholder="&#128269; Cerca" aria-label="Search">
            		<span class="input-group-text" id="shortcut">ctrl K</span>
        		</div>
   			    </form>
                
                <ul class="navbar-nav d-lg-none">
                    <li class="nav-item">
                        <a class="nav-link" href="/welcome">
                            <i class="bi bi-person"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<form class="d-lg-flex mx-auto custom-search-container">
    <div class="custom-search-form position-relative">
        <input type="search" class="form-control custom-search" placeholder="&#128269; Cerca" aria-label="Search">
        <span class="input-group-text" id="shortcut">ctrl K</span>
    </div>
</form>


</body>
</html>
