
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("sideMenu").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "250px";
    });

    document.getElementById("closeMenuButton").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "0";
    });
});

////////////////////////////////////////////////////////////////////////////////////////////////

function showCategory(categoria) {
    fetch(`/prodotto/prodotti/categoria?categoria=${categoria}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nel caricamento dei prodotti: " + response.status);
            }
            return response.text(); // Leggi la risposta come testo
        })
        .then(text => {
            console.log("Risposta completa dal server:", text); // Aggiungi questo log
            try {
                const data = JSON.parse(text); // Prova a convertire il testo in JSON
                let catalogo = document.getElementById("catalogo");
                catalogo.innerHTML = ""; // Puliamo il catalogo

                if (data.length === 0) {
                    catalogo.innerHTML = "<p class='text-center'>Nessun prodotto trovato.</p>";
                    return;
                }

                data.forEach(prodotto => {
                    let productHTML = `
                        <div class="col-md-3">
                            <div class="product-card">
                                <img src="${prodotto.immagine}" alt="${prodotto.nomeProdotto}">
                                <h5>${prodotto.nomeProdotto}</h5>
                                <p>${prodotto.prezzo}€</p>
                            </div>
                        </div>
                    `;
                    catalogo.innerHTML += productHTML;
                });
            } catch (error) {
                throw new Error("Errore nel parsing del JSON: " + error.message);
            }
        })
        .catch(error => console.error("Errore nel caricamento dei prodotti:", error));
}
