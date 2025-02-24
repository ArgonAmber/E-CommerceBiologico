<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
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
	href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

	<div class="wrapper">
	
		<!-- Navbar -->
		<nav class="navbar custom-navbar">
			<div
				class="container-fluid d-flex justify-content-between align-items-center">

				<button class="navbar-toggler d-md-none" type="button"
					onclick="MenuMobile()">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="navbar-left d-none d-md-inline">
					<a href="#">Prodotti</a> | <a href="#">Eventi</a> | <a href="#">Chi
						siamo</a>
				</div>

				<div
					class="navbar-center position-absolute start-50 translate-middle-x">
					<a class="nav-link" href="/home"> <img
						src="${pageContext.request.contextPath}/images/logoBamboo.png"
						alt="Bamboo Logo" class="logo-navbar">
					</a>
				</div>

				<div class="navbar-right ms-auto">
					<% 
                String utente = (String) session.getAttribute("utente"); 
                if (utente != null) { // Se l'utente è loggato, mostra il link all'area utente
            %>
					<a class="nav-link" href="/areaUtente"> <i class="bi bi-person"></i>
					</a>
					<% } else { // Se l'utente NON è loggato, mostra il link al login %>
					<a class="nav-link" href="/welcome"> <i class="bi bi-person"></i>
					</a>
					<% } %>
				</div>
			</div>
		</nav>
		

		<!-- Menù a tendina -->
		<div id="sideMenu" class="side-menu">
			<a onclick="MenuMobile()" class="closebtn" id="closeMenuButton">&times;</a>
			<a href="#">Prodotti</a> <a href="#">Eventi</a> <a href="#">Chi
				siamo</a>
		</div>


		<div class="content">

			<!-- Hero Section -->
			<header class="text-center py-5 hero-section">
				<div class="container hero-content">
					<h1 class="display-4">Bamboo - Il tuo e-commerce bio</h1>
					<p class="lead">Prodotti naturali, freschi e sostenibili.</p>
				</div>
			</header>
			
			<!-- Carosello -->
			<div id="multiImageCarousel" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<!-- Slide 1 -->
					<div class="carousel-item active">
						<div class="row">
							<div class="col-sm-4 col-md-2">
								<img src="/images/carosello/immaginicarosello1.jpg"
									class="d-block w-100" alt="Lamponi" data-bs-toggle="modal"
									data-bs-target="#imageModal"
									onclick="setModalImage('/images/carosello/immaginicarosello1.jpg')">
							</div>
							<div class="col-sm-4 col-md-2">
								<img src="/images/carosello/immaginicarosello2.jpg"
									class="d-block w-100" alt="Mela" data-bs-toggle="modal"
									data-bs-target="#imageModal"
									onclick="setModalImage('/images/carosello/immaginicarosello2.jpg')">
							</div>
							<div class="col-sm-4 col-md-2">
								<img src="/images/carosello/immaginicarosello3.jpg"
									class="d-block w-100" alt="Arancia">
							</div>
							<div class="col-sm-4 col-md-2 d-none d-md-block">
								<img src="/images/carosello/immaginicarosello4.jpg"
									class="d-block w-100" alt="Banana">
							</div>
							<div class="col-sm-4 col-md-2 d-none d-md-block">
								<img src="/images/carosello/immaginicarosello5.jpg"
									class="d-block w-100" alt="Fragola">
							</div>
							<div class="col-sm-4 col-md-2 d-none d-md-block">
								<img src="/images/carosello/immaginicarosello6.jpg"
									class="d-block w-100" alt="Uva">
							</div>
						</div>
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item">
						<div class="row">
							<div class="col-sm-4 col-md-2">
								<img src="/images/carosello/immaginicarosello7.jpg"
									class="d-block w-100" alt="Ciliegia">
							</div>
							<div class="col-sm-4 col-md-2">
								<img src="/images/carosello/immaginicarosello8.jpg"
									class="d-block w-100" alt="Kiwi">
							</div>
							<div class="col-sm-4 col-md-2">
								<img src="/images/carosello/immaginicarosello9.jpg"
									class="d-block w-100" alt="Ananas">
							</div>
							<div class="col-sm-4 col-md-2 d-none d-md-block">
								<img src="/images/carosello/immaginicarosello1.jpg"
									class="d-block w-100" alt="Pesca">
							</div>
							<div class="col-sm-4 col-md-2 d-none d-md-block">
								<img src="/images/carosello/immaginicarosello2.jpg"
									class="d-block w-100" alt="Cocco">
							</div>
							<div class="col-sm-4 col-md-2 d-none d-md-block">
								<img src="/images/carosello/immaginicarosello3.jpg"
									class="d-block w-100" alt="Mirtilli">
							</div>
						</div>
					</div>
				</div>

				<!-- Controlli del Carosello -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#multiImageCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Precedente</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#multiImageCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Successivo</span>
				</button>
			</div>

			<!-- Sezione Catalogo con Grid System -->
			<div class="container py-5">
				<div class="row">
					<!-- Colonna sinistra: Filtri -->
					<div class="col-md-3">
						<h3>Filtri</h3>
						<button class="btn btn-success w-100 my-2"
							onclick="showCategory('frutta')">🍎 Frutta</button>
						<button class="btn btn-success w-100 my-2"
							onclick="showCategory('verdura')">🥕 Verdura</button>
						<button class="btn btn-success w-100 my-2"
							onclick="showCategory('cereali')">🍝 Cereali</button>
						<button class="btn btn-success w-100 my-2"
							onclick="showCategory('bevande')">🥤 Bevande</button>
					</div>

					<!-- Colonna destra: Catalogo prodotti -->
					<div class="col-md-9">
						<h3>Catalogo Prodotti</h3>
						<div id="catalogo" class="row">
							<p class="text-center">Seleziona una categoria per
								visualizzare i prodotti.</p>
						</div>
					</div>
				</div>
			</div>



		</div>

		<!-- Footer -->
		<footer class="text-center py-3">
			<div class="container-text">
				<p>&copy; 2025 Bamboo - Tutti i diritti riservati.</p>
				<p>
					<a href="#">Privacy Policy</a> <a href="#"> Termini di Servizio</a>
					<a href="#">Contattaci</a>
				</p>
			</div>
			<div class="container-social">
				<a href="https://www.instagram.com"> <i
					class="bi bi-instagram social-icon"></i>
				</a> <a href="https://www.linkedin.com"> <i
					class="bi bi-linkedin social-icon"></i>
				</a>
			</div>
		</footer>
	</div>

	<!-- SCHEDA PRODOTTO in sovrimpressione -->
	<div id="productOverlay" class="product-overlay">
		<div class="overlay-content">
			<span class="close-overlay">&times;</span> <img id="overlayImage"
				src="" alt="Immagine prodotto">
			<h2 id="overlayTitle"></h2>
			<p id="overlayDescription"></p>
			<p>
				<strong>Provenienza:</strong> <span id="overlayOrigin"></span>
			</p>
			<p>
				<strong>Prezzo:</strong> <span id="overlayPrice"></span>€
			</p>
			<button class="btn btn-success" id="addToCart">Aggiungi al
				carrello</button>
		</div>
	</div>



	<!-- Icona del carrello flottante -->
	<div id="floatingCart" class="floating-cart">
		<i class="bi bi-cart3"></i> <span id="cartCounter" class="cart-badge">0</span>
	</div>

	<!-- Pannello laterale del carrello -->
	<div id="cartSidebar" class="cart-sidebar">
		<div class="cart-header">
			<h4>Il tuo carrello</h4>
			<span class="close-cart">&times;</span>
		</div>
		<div class="cart-content">
			<p id="emptyCartMessage" style="display: none;">Il carrello è
				vuoto.</p>

			<ul id="cartItemsList"></ul>
		</div>
		<div class="cart-footer">
			<strong>Totale: <span id="cartTotal">0.00</span>€
			</strong> <a href="${pageContext.request.contextPath}/views/payment.jsp">
				<button class="btn btn-success w-100">Vai al checkout</button>
			</a>

		</div>
	</div>



	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/scripthome.js"></script>
</body>
</html>