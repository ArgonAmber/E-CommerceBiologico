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
    <!-- Link al file script.js -->
    <script src="${pageContext.request.contextPath}/js/script.js" defer></script>
</head>

<body>

	<div class="wrapper">
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
  
    <!-- Menù a tendina -->
    <div id="sideMenu" class="side-menu">
        <a href="#" class="closebtn" id="closeMenuButton">&times;</a>
        <a href="#">Prodotti</a>
        <a href="#">Eventi</a>
        <a href="#">Chi siamo</a>
    </div>
    
   
    <div class="content">
    <!-- Hero Section -->
    <header class="text-center py-5 hero-section">
        <div class="container hero-content">
            <h1 class="display-4">Bamboo - Il tuo e-commerce bio</h1>
            <p class="lead">Prodotti naturali, freschi e sostenibili.</p>
        </div>
    </header>

<!-- Sezione Filtri -->
<div class="container text-center py-4">
    <h2>Filtra i prodotti per categoria</h2>
    <div class="d-flex flex-column align-items-center gap-3 mt-3">
        <!-- Prima riga: Frutta & Verdura -->
        <div class="d-flex gap-4">
            <button class="btn btn-success btn-lg d-flex align-items-center justify-content-center px-5 py-3"
                style="width: 260px; height: 80px;" onclick="showCategory('frutta')">
                <span class="fs-2 me-2">🍎</span> <span class="fs-3 fw-bold text-nowrap">Frutta</span>
            </button>
            <button class="btn btn-success btn-lg d-flex align-items-center justify-content-center px-5 py-3"
                style="width: 260px; height: 80px;" onclick="showCategory('verdura')">
                <span class="fs-2 me-2">🥕</span> <span class="fs-3 fw-bold text-nowrap">Verdura</span>
            </button>

            <button class="btn btn-success btn-lg d-flex align-items-center justify-content-center px-5 py-3"
                style="width: 260px; height: 80px;" onclick="showCategory('pasta')">
                <span class="fs-2 me-2">🍝</span> <span class="fs-3 fw-bold text-nowrap">Pasta & Riso</span>
            </button>
            <button class="btn btn-success btn-lg d-flex align-items-center justify-content-center px-5 py-3"
                style="width: 260px; height: 80px;" onclick="showCategory('bevande')">
                <span class="fs-2 me-2">🥤</span> <span class="fs-3 fw-bold text-nowrap">Bevande</span>
            </button>
        </div>
    </div>
</div>

    <!-- Sezione Catalogo (Inizialmente vuota, riempita dai filtri) -->
    <div class="container py-4">
        <div id="catalogo">
            <p class="text-center">Seleziona una categoria per visualizzare i prodotti.</p>
        </div>
    </div>
    </div>
    
    <!-- Footer -->
    <footer class="text-center py-3">
    	<div class="container-text">
        <p>&copy; 2025 Bamboo - Tutti i diritti riservati.</p>
        <p>
            <a href="#">Privacy Policy</a>
            <a href="#"> Termini di Servizio</a>
            <a href="#">Contattaci</a>
        </p>
        </div>
            <div class="container-social">
                <a href="https://www.instagram.com">
					<i class="bi bi-instagram social-icon"></i>                
				</a>
                <a href="https://www.linkedin.com">
					<i class="bi bi-linkedin social-icon"></i>                
				</a>
            </div>
    </footer>
    </div>

</body>
</html>
