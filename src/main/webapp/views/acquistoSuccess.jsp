<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.model.Ordine"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Acquisto Confermato</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.success-container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	background: #f8f9fa;
	border-radius: 8px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.success-container h1 {
	color: #28a745;
}

.btn-home {
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="success-container">
			<h1>✅ Acquisto Confermato!</h1>
			<p>Grazie per il tuo ordine. I dettagli sono i seguenti:</p>

			<%
			Ordine ordine = (Ordine) session.getAttribute("ordine");
			if (ordine != null) {
			%>
			<p>
				<strong>Codice Ordine:</strong>
				<%=ordine.getCodOrdine()%></p>
			<p>
				<strong>Email:</strong>
				<%=ordine.getEmail()%></p>
			<p>
				<strong>Metodo di pagamento:</strong>
				<%=ordine.getMetodoPagamento()%></p>

			<%
			if ("Carta".equals(ordine.getMetodoPagamento())) {
			%>
			<p>
				<strong>Numero Carta:</strong> **** **** ****
				<%=ordine.getNumeroCarta().substring(12)%></p>
			<p>
				<strong>Scadenza:</strong>
				<%=ordine.getScadenza()%></p>
			<%
			} else {
			%>
			<p>
				<strong>Paypal Email:</strong>
				<%=ordine.getPaypalEmail()%></p>
			<%
			}
			%>

			<p>
				<strong>Totale:</strong> 49.99€
			</p>
			<%
			} else {
			%>
			<p>⚠️ Errore nel recupero dei dettagli dell'ordine.</p>
			<%
			}
			%>


			<a href="/home" class="btn btn-success btn-home">Torna alla Home</a>
		</div>
	</div>

</body>
</html>
