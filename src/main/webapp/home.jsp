<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bamboo - E-commerce Bio</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}static/css/style.css">
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
    <img src="${pageContext.request.contextPath}/static/immagini/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
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

    <!-- Footer -->
    <footer class="text-center py-3 bg-dark text-white">
        <p>&copy; 2025 Bamboo - Tutti i diritti riservati.</p>
    </footer>

    <!-- Bootstrap JS (per il menu mobile) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script per i filtri -->
    <script>
        function showCategory(category) {
            document.getElementById("catalogo").innerHTML = "<p class='text-center'>Caricamento prodotti " + category + "...</p>";
        }
    </script>

</body>
</html>