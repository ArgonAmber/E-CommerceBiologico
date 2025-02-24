<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
String utente = (String) session.getAttribute("utente"); 
if (utente == null) {
    response.sendRedirect("/welcome"); // Reindirizza alla pagina di login se la sessione è vuota
    return;
}
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area Utente | Bamboo</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/areaDipendente.css">
</head>
<body>

<div class="wrapper">
    <!-- Navbar -->
    <nav class="navbar custom-navbar w-100">
        <div class="container-fluid p-0 d-flex justify-content-between align-items-center" style="margin: 10px;">
            <div class="navbar-left d-none d-md-inline">
                <a href="/logout">Logout</a>              
            </div>
            
            <div class="navbar-center position-absolute start-50 translate-middle-x">
                <a class="nav-link" href="/home">
                    <img src="${pageContext.request.contextPath}/images/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
                </a>
            </div>
        </div>
    </nav>

    <!-- Menù laterale -->
    <div id="sideMenu" class="side-menu">
        <a onclick="MenuMobile()" class="closebtn" id="closeMenuButton">&times;</a>
        <a href="#" onclick="showCart()">Visualizza Carrello</a>
        <a href="#" onclick="showOrders()">Storico Ordini</a>
        <a href="/logout">Logout</a>
    </div>

    <div class="content">
        <div class="left-column d-none d-md-block">
            <a href="#" onclick="showCart()">Visualizza Carrello</a>
            <a href="#" onclick="showOrders()">Storico Ordini</a>
        </div>
        
        <div class="right-column" id="userContent">
            <h2>Benvenuto nella tua Area Utente</h2>
            <p>Gestisci i tuoi ordini e il tuo carrello.</p>

            <!-- SEZIONE CARRELLO - INIZIALMENTE NASCOSTA -->
            <div id="carrelloContainer" style="display: none;">
                <h3>Il tuo carrello</h3>
                <div id="carrello" class="row">
                    <p class="text-center">Caricamento del carrello...</p>
                </div>
                <div class="text-end mt-3">
                    <strong>Totale: <span id="cartTotal">0.00</span>€</strong>
                </div>
                <a href="${pageContext.request.contextPath}/views/payment.jsp">
                    <button class="btn btn-success w-100 mt-3">Vai al checkout</button>
                </a>
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
    </footer>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/scriptAreaUtente.js"></script>

</body>
</html>
