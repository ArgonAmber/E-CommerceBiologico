document.addEventListener("DOMContentLoaded", function () {
    console.log("Script Area Utente caricato");
});

// Funzione per mostrare il carrello quando premi "Visualizza Carrello"
function showCart() {
    let carrelloContainer = document.getElementById("carrelloContainer");
    carrelloContainer.style.display = "block";
    aggiornaCarrelloAreaUtente();
}

// Funzione per recuperare e mostrare il carrello
function aggiornaCarrelloAreaUtente() {
    fetch("/carrello/")
        .then(response => response.json())
        .then(data => {
            let carrello = document.getElementById("carrello");
            let cartTotal = document.getElementById("cartTotal");

            carrello.innerHTML = "";
            let totale = 0;

            if (data.length === 0) {
                carrello.innerHTML = "<p class='text-center'>Il carrello è vuoto.</p>";
            } else {
                data.forEach(item => {
                    let prezzoTotale = item.prodotto.prezzo * item.quantita;

                    let productHTML = `
                        <div class="col-md-12 d-flex justify-content-between align-items-center border-bottom p-2">
                            <div>
                                <strong>${item.prodotto.nomeProdotto}</strong>
                                <p>${item.quantita} x ${item.prodotto.prezzo}€</p>
                            </div>
                            <div>
                                <button class="btn btn-sm btn-danger" onclick="rimuoviDalCarrello(${item.prodotto.id})">❌</button>
                            </div>
                        </div>
                    `;
                    carrello.innerHTML += productHTML;

                    totale += prezzoTotale;
                });
            }

            cartTotal.innerText = totale.toFixed(2);
        })
        .catch(error => console.error("Errore nel recupero del carrello:", error));
}

// Funzione per rimuovere un prodotto dal carrello
function rimuoviDalCarrello(idProdotto) {
    fetch(`/carrello/rimuovi?idProdotto=${idProdotto}`, { method: "POST" })
        .then(() => aggiornaCarrelloAreaUtente());
}
