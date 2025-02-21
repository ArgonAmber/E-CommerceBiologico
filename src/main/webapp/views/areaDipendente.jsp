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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/areaDipendente.css">
   
</head>

<div class="wrapper">
    <!-- Navbar -->
    <nav class="navbar custom-navbar w-100">
    
     <div class="container-fluid p-0 d-flex justify-content-between align-items-center" style="margin: 10px;">
     
			<button class="navbar-toggler d-md-none" type="button" onclick="MenuMobile()">
                <span class="navbar-toggler-icon"></span>
            </button>
    
     
            <div class="navbar-left d-none d-md-inline">
                <a href="/welcome">Logout</a>              
            </div>
            
            <div class="navbar-center position-absolute start-50 translate-middle-x">
            	<a class="nav-link" href="/home">
                <img src="${pageContext.request.contextPath}/images/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
                </a>
            </div>
            
                     
        </div>
    
    </nav>
  
    <!-- Menù a tendina -->
    <div id="sideMenu" class="side-menu">
        <a onclick="MenuMobile()" class="closebtn" id="closeMenuButton">&times;</a>
        <a href="#" onclick="saveProduct()">Inserisci un prodotto</a>
        <a href="#" onclick="showProducts()">Visualizza tutti i prodotti</a>
        <a href="#" onclick="showOrders()">Visualizza tutti gli ordini</a>
        <a href="#" onclick="showAccounts()">Visualizza tutti gli account</a>
    </div>
    

   
    <div class="content">
 
 		<div class="left-column d-none d-md-block">
 			<a href="#" onclick="saveProduct()">Inserisci un prodotto</a>
            <a href="#" onclick="showProducts()">Visualizza tutti i prodotti</a>
            <a href="#" onclick="showOrders()">Visualizza tutti gli ordini</a>
            <a href="#" onclick="showAccounts()">Visualizza tutti gli account</a>
        </div>
        
        <div class="right-column" id="productTable"></div>

    </div>
 
 
 
    
    
    <!-- Footer -->
    <footer class="text-center py-3">
    	<div class="container-text">
        <p>&copy; 2025 Bamboo - Tutti i diritti riservati.</p>
        <p>
            <a href="#">Privacy Policy</a>
            <a href="#"> Termini di Servizio</a>
            <a href="https://images2.corriereobjects.it/Media/Foto/2013/08/07/BABBUINI.jpg?v=20130807083119">Richiedi assistenza</a>
        </p>
        </div>
    </footer>
    </div>






    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scriptAreaDipendente.js"></script>


<body>

</body>
</html>