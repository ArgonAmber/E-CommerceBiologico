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
    <nav class="navbar navbar-expand navbar-light bg-dark">
        <div class="container-fluid d-flex justify-content-center">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/images/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/welcome">
                            <i class="bi bi-person"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="text-center py-5 hero-section">
        <div class="container hero-content">
            <h1 class="display-4">Bamboo - Il tuo e-commerce bio</h1>
            <p class="lead">Prodotti naturali, freschi e sostenibili.</p>
        </div>
    </header>

    <!-- Sezione Catalogo -->
    <div class="container text-center py-5">
        <h2>Catalogo Prodotti</h2>
    </div>

    <div class="container">
        <!-- Sezione Frutta -->
        <h3>Frutta</h3>
        <div class="row">
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/frutta/banane.jpg" alt="Banana">
                <p>Banana - €2,60</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/frutta/arance.jpg" alt="Arancia">
                <p>Arancia - €3,20</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/frutta/mele.jpg" alt="Mela">
                <p>Mela - €2,70</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/frutta/mango.jpg" alt="Mango">
                <p>Mango - €3,50</p>
            </div>
        </div>
        
        <!-- Sezione Verdura -->
        <h3>Verdura</h3>
        <div class="row">
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/verdura/broccoli.jpg" alt="Broccoli">
                <p>Broccoli - €1,80</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/verdura/cavolfiori.jpg" alt="Cavolfiore">
                <p>Cavolfiore - €2,10</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/verdura/carote.jpg" alt="Carote">
                <p>Carote - €1,90</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/verdura/pomodori.jpg" alt="Pomodori">
                <p>Pomodori - €1,80</p>
            </div>
        </div>

        <!-- Sezione Bevande -->
        <h3>Bevande</h3>
        <div class="row">
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/bevande/succoallamela.jpg" alt="Succo di Mela">
                <p>Succo di Mela - €2,30</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/bevande/bevandaallafragola.jpg" alt="Latte alla Fragola">
                <p>Latte alla Fragola - €2,10</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/bevande/lattealcoccoo.jpg" alt="Latte al Cocco">
                <p>Latte al Cocco - €2,50</p>
            </div>
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath}/images/prodotti/bevande/limonatasiciliana.jpg" alt="Limonata Siciliana">
                <p>Limonata Siciliana - €2,40</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center py-3 bg-dark text-white">
        <p>&copy; 2025 Bamboo - Tutti i diritti riservati.</p>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
