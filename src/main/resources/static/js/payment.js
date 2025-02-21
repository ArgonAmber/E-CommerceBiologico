document.addEventListener("DOMContentLoaded", function () {
    let metodoPagamentoSelect = document.getElementById("metodoPagamento");
    let paypalFields = document.getElementById("paypal-fields");
    let cardFields = document.getElementById("card-fields");
    let payButton = document.querySelector(".payment-button");
    let paymentForm = document.getElementById("payment-form");

    // Mostra i campi giusti al caricamento della pagina
    aggiornaCampiPagamento();

    // Cambia i campi quando si sceglie un metodo di pagamento
    metodoPagamentoSelect.addEventListener("change", aggiornaCampiPagamento);

    function aggiornaCampiPagamento() {
        let metodoSelezionato = metodoPagamentoSelect.value;

        if (metodoSelezionato === "PayPal") {
            paypalFields.style.display = "block";
            cardFields.style.display = "none";
        } else {
            paypalFields.style.display = "none";
            cardFields.style.display = "block";
        }
    }

    // Quando l'utente clicca su "PAGA ORA"
	payButton.addEventListener("click", function (event) {
	    event.preventDefault(); // Evita l'invio automatico

	    let emailInput = document.querySelector(".email-field").value;
	    if (!validateEmail(emailInput)) {
	        alert("Inserisci un'email valida!");
	        return;
	    }

	    let metodoSelezionato = metodoPagamentoSelect.value;
	    let pagamentoValido = false;

	    let formData = new FormData(paymentForm);
	    formData.append("totale", 49.99); // Simuliamo un totale

	    if (metodoSelezionato === "PayPal") {
	        let paypalPassword = document.querySelector("input[name='paypalPassword']").value;
	        if (paypalPassword.trim() === "") {
	            alert("Inserisci la password di PayPal!");
	            return;
	        }
	        pagamentoValido = true;
	    } else {
	        let numeroCarta = document.querySelector("input[name='numeroCarta']").value;
	        let scadenza = document.querySelector("input[name='scadenza']").value;
	        let cvv = document.querySelector("input[name='cvv']").value;

	        if (!validateCard(numeroCarta, scadenza, cvv)) {
	            alert("Inserisci correttamente i dati della carta!");
	            return;
	        }
	        pagamentoValido = true;
	    }

	    if (pagamentoValido) {
	        // Invia il pagamento al backend
	        fetch("/ordine/salva", {
	            method: "POST",
	            body: formData
	        })
	        .then(response => {
	            if (!response.ok) {
	                throw new Error("Errore durante il pagamento");
	            }
	            return response.text();
	        })
	        .then(() => {
				console.log("Reindirizzamento alla pagina di successo");
	            window.location.href = "/ordine/acquistoSuccess"; // Reindirizza alla pagina di successo				
	        })
	        .catch(error => console.error("Errore:", error));
	    }
	});

    function validateEmail(email) {
        let emailRegex = /^[a-zA-Z0-9._%+-]+@(gmail|hotmail|yahoo|outlook|live|icloud|libero|virgilio|tiscali|fastweb|tim|poste)\.(com|it|net|org|eu|fr|es|de|uk)$/;
        return emailRegex.test(email);
    }

    function validateCard(numeroCarta, scadenza, cvv) {
        let cardRegex = /^[0-9]{16}$/;
        let expiryRegex = /^(0[1-9]|1[0-2])\/\d{2}$/;
        let cvvRegex = /^[0-9]{3}$/;

        return cardRegex.test(numeroCarta) && expiryRegex.test(scadenza) && cvvRegex.test(cvv);
    }
});
