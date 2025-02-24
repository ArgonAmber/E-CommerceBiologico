<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Acquisto Confermato</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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
            <p>Grazie per il tuo acquisto! Il tuo ordine è stato elaborato con successo.</p>
            <p>Riceverai una conferma via email.</p>

            <a href="/home" class="btn btn-success btn-home">Torna alla Home</a>
        </div>
    </div>

</body>
</html>
