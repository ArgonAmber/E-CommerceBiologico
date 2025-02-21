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
  
</head>

<body>

<!-- Navbar -->
    <nav class="navbar custom-navbar">
    
     <div class="container-fluid d-flex justify-content-between align-items-center">
     
			
    
     
            
            <div class="navbar-center position-absolute start-50 translate-middle-x">
            	<a class="nav-link" href="/home">
                <img src="${pageContext.request.contextPath}/images/logoBamboo.png" alt="Bamboo Logo" class="logo-navbar">
                </a>
            </div>                
            
        </div>
    
    </nav>
  
   
 
   
  <div class="container d-flex flex-column align-items-center">
    
  <div class="left d-md-block">
    <!-- Primo form per gli utenti normali -->
    <div class="header">
      <h2 class="animation a1">Benvenuto</h2>
      <h4 class="animation a2">Inserisci le tue credenziali</h4>
    </div>
    <form action="/login" method="post" onsubmit="">
    <div class="form">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input type="text" id="username" name="username" class="form-field animation a3" placeholder="Username">
      <input type="password" id="password" name="password" class="form-field animation a4" placeholder="Password">
      <input type="hidden" name="userType" value="user"> <!-- Per login come utente -->
      <div id="errorMessagePassword" class="text-danger" style="display: none;">Questo account non esiste.</div>
      <p class="animation a5">
        <a href="#">Password dimenticata?</a>
      </p>
      <button class="animation a6">ACCEDI</button>
      <h2 class="animation a7">Non hai un account? <a href="/preReg">Iscriviti</a></h2>
    </div>
    </form>

    <!-- Secondo form per i dipendenti -->
    <div class="header">
      <h2 class="animation a1"><br><br><br>Accesso Dipendente</h2>
      <h4 class="animation a2">Inserisci le credenziali aziendali</h4>
    </div>
    
    <form action="/login" method="post" onsubmit="">
    <div class="form">     
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input type="text" id="username" name="username" class="form-field animation a3" placeholder="username">
      <input type="password" id="password" name="password" class="form-field animation a4" placeholder="Password">
      <input type="hidden" name="userType" value="admin"> <!-- Per login come dipendente -->
      <div id="errorMessagePassword" class="text-danger" style="display: none;">Questo account non esiste.</div>
      <p class="animation a5">
        <a href="#">Password dimenticata?</a>
      </p>
      <button class="animation a6">ACCEDI</button>	  
    </div>
    </form>

  </div>


  <div class="right d-none d-md-block"></div>
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
    
    
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scriptWelcome.js"></script>
    
</body>
</html>
