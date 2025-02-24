document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("sideMenu").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "250px";
    });

    document.getElementById("closeMenuButton").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "0";
    });
});

// Funzione per mostrare lo storico ordini
function showOrders() {
    fetch("/ordine/storico")
        .then(response => response.json())
        .then(ordini => {
            let userContent = document.getElementById("userContent");
            userContent.innerHTML = `
                <h3>Storico Ordini</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Codice Ordine</th>
                            <th>Totale (€)</th>
                            <th>Metodo Pagamento</th>
                            <th>Data Ordine</th>
                        </tr>
                    </thead>
                    <tbody id="ordineTableBody"></tbody>
                </table>
            `;

            let tableBody = document.getElementById("ordineTableBody");

            if (ordini.length === 0) {
                tableBody.innerHTML = `<tr><td colspan="4" class="text-center">Nessun ordine trovato.</td></tr>`;
                return;
            }

            ordini.forEach(ordine => {
                let row = document.createElement("tr");
                row.innerHTML = `
                    <td>${ordine.codOrdine}</td>
                    <td>${ordine.totale}</td>
                    <td>${ordine.metodoPagamento}</td>
                    <td>${new Date(ordine.dataOrdine).toLocaleDateString()}</td>
                `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => console.error("Errore nel caricamento dello storico ordini:", error));
}

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





