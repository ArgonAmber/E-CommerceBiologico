<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bamboo | E-commerce Bio</title>

<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
<!-- CSS nostro -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/registerStyle.css">
<!-- Link al file js -->
<script src="${pageContext.request.contextPath}/js/scriptRegister.js" defer></script>
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
	    
    <div class="container">
    <div class="left d-md-block mx-auto">
        <div class="header">
            <h2 class="animation a1">Registrati</h2>
            <h4 class="animation a2">Crea un nuovo account</h4>
        </div>
        <form action="/register" method="post" onsubmit="return validateForm()">
            <div class="form">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" id="contextPath" value="${pageContext.request.contextPath}" />
                <input type="text" id="username" name="username" class="form-field animation a3" placeholder="Username" onblur="checkUsername()">
                <input type="email" id="email" name="email" class="form-field animation a4" placeholder="Email">
                <input type="password" id="password" name="password" class="form-field animation a5" placeholder="Password">
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-field animation a6" placeholder="Conferma Password">
                <div id="errorMessagePassword" class="text-danger" style="display: none;">Le password non coincidono. Riprova.</div>
                <div id="errorMessageUsername" class="text-danger" style="display: none;">Il nome utente è già in uso. Scegli un altro nome utente.</div>
                <button class="animation a7">REGISTRATI</button>
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
   
    
</body>
</html>