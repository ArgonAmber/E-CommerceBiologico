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
	href="${pageContext.request.contextPath}/css/paymentStyle.css">

</head>
<body>

	<div class="container">
		<div class="left">
			<div class="header">
				<h2 class="animation a1">Pagamento</h2>
				<h4 class="animation a2">Inserisci i dettagli per procedere</h4>
			</div>
			<div class="form">
				<input type="text" class="form-field animation a3"
					placeholder="Nome Completo"> <input type="email"
					class="form-field animation a4" placeholder="Email"> <input
					type="text" class="form-field animation a5"
					placeholder="Numero Carta / PayPal"> <select
					class="form-field animation a6">
					<option>PayPal</option>
					<option>Carta di Credito</option>
					<option>Carta di Debito</option>
				</select>
				<button class="animation a7">PAGA ORA</button>
			</div>
		</div>
		<div class="right"></div>
	</div>

</body>
</html>