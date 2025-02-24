<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/paymentStyle.css">
</head>
<body>

	<div class="container">
		<div class="left">
			<div class="header">
				<h2 class="animation a1">Pagamento</h2>
				<h4 class="animation a2">Inserisci i dettagli per procedere</h4>
			</div>
			
			<!-- Form per il pagamento -->
			<form id="payment-form" action="${pageContext.request.contextPath}/ordine/salva" method="post">
				
				<!-- Selezione del metodo di pagamento -->
				<label for="metodoPagamento">Metodo di pagamento:</label>
				<select name="metodoPagamento" id="metodoPagamento" class="form-field animation a6" required>
					<option value="PayPal">PayPal</option>
					<option value="Carta">Carta di Credito/Debito</option>
				</select>

				<!-- Campi comuni -->
				<input type="text" name="nome" class="form-field animation a3" placeholder="Nome Completo" required>
				<input type="email" name="email" class="form-field animation a4 email-field" placeholder="Email" required>

				<!-- Campi per PayPal -->
				<div id="paypal-fields" class="payment-fields">
					<input type="password" name="paypalPassword" class="form-field animation a5" placeholder="Password PayPal" required>
				</div>

				<!-- Campi per Carta di Credito/Debito -->
				<div id="card-fields" class="payment-fields" style="display: none;">
					<input type="text" name="numeroCarta" class="form-field" placeholder="Numero Carta" required>
					<input type="text" name="scadenza" class="form-field" placeholder="MM/YY" required>
					<input type="text" name="cvv" class="form-field" placeholder="CVV" required>
				</div>

				<!-- Totale nascosto -->
				<input type="hidden" name="totale" id="totale" value="49.99"> <!-- Simuliamo un totale -->

				<!-- Pulsante di pagamento -->
				<button type="submit" class="animation a7 payment-button">PAGA ORA</button>

			</form>
		</div>
		<div class="right"></div>
	</div>

	<!-- Collegamento a payment.js -->
	<script src="${pageContext.request.contextPath}/js/payment.js"></script>

</body>
</html>
