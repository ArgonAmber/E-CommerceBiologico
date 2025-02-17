<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bamboo - E-commerce Bio</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/images/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">                   
                    <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Registrati</a></li>
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

    <!-- Sezione Catalogo con Grid System -->
    <div class="container py-5">
        <div class="row">
            <!-- Colonna sinistra: Filtri -->
            <div class="col-md-3">
                <h3>Filtri</h3>
                <button class="btn btn-success w-100 my-2" onclick="showCategory('frutta')">🍎 Frutta</button>
                <button class="btn btn-success w-100 my-2" onclick="showCategory('verdura')">🥕 Verdura</button>
                <button class="btn btn-success w-100 my-2" onclick="showCategory('pasta')">🍝 Pasta & Riso</button>
                <button class="btn btn-success w-100 my-2" onclick="showCategory('bevande')">🥤 Bevande</button>
            </div>

            <!-- Colonna destra: Catalogo prodotti -->
            <div class="col-md-9">
                <h3>Catalogo Prodotti</h3>
                <div id="catalogo" class="row">
                    <p class="text-center">Seleziona una categoria per visualizzare i prodotti.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-center py-3 bg-dark text-white">
        <p>&copy; 2025 Bamboo - Tutti i diritti riservati.</p>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripthome.js"></script>

</body>
</html>
