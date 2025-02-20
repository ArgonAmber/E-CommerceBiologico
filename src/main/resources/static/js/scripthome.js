

var menu = "close";
function MenuMobile() {
    var sideMenu = document.getElementById("sideMenu");
    var heroContent = document.querySelector('.hero-content');
    if (menu == "close") {
        sideMenu.style.width = "100%";
        heroContent.style.display = "none";
        menu = "open";
    } else {
        sideMenu.style.width = "0";
		heroContent.style.display = "block";
        menu = "close";
    }
}


document.addEventListener("DOMContentLoaded", function () {
    // Gestione del menu a tendina
    document.getElementById("sideMenu").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "250px";
    });

    document.getElementById("closeMenuButton").addEventListener("click", function () {
        document.getElementById("sideMenu").style.width = "0";
    });
});

////////////////////////////////////////////////////////////////////////////////////////////////
//                               GESTIONE CATALOGO PRODOTTI                                    //
////////////////////////////////////////////////////////////////////////////////////////////////

function showCategory(categoria) {
    fetch(`/prodotto/prodotti/categoria?categoria=${categoria}`)
        .then(response => {
            if (!response.ok) {
                throw new Error("Errore nel caricamento dei prodotti: " + response.status);
            }
            return response.text();
        })
        .then(text => {
            console.log("Risposta completa dal server:", text);
            try {
                const data = JSON.parse(text);
                let catalogo = document.getElementById("catalogo");
                catalogo.innerHTML = "";

                if (data.length === 0) {
                    catalogo.innerHTML = "<p class='text-center'>Nessun prodotto trovato.</p>";
                    return;
                }

				data.forEach(prodotto => {
				    let productHTML = `
				        <div class="col-md-3">
				            <div class="product-card" 
				                data-id="${prodotto.id}" 
				                data-nome="${prodotto.nomeProdotto}" 
				                data-immagine="${prodotto.immagine}" 
				                data-descrizione="${prodotto.descrizione}" 
				                data-provenienza="${prodotto.provenienza}" 
				                data-prezzo="${prodotto.prezzo}">

				                <img src="${prodotto.immagine}" alt="${prodotto.nomeProdotto}">
				                <h5>${prodotto.nomeProdotto}</h5>
				                <p>${prodotto.prezzo}€</p>
				            </div>
				        </div>
				    `;
				    catalogo.innerHTML += productHTML;
				});

                // Associare l'evento click ai prodotti appena caricati
				document.querySelectorAll(".product-card").forEach(card => {
				    card.addEventListener("click", function () {
				        let nome = this.getAttribute("data-nome");
				        let immagine = this.getAttribute("data-immagine");
				        let descrizione = this.getAttribute("data-descrizione");
				        let provenienza = this.getAttribute("data-provenienza");
				        let prezzo = this.getAttribute("data-prezzo");
				        let id = this.getAttribute("data-id"); // Prendiamo anche l'ID

				        console.log("ID prodotto cliccato:", id); // Debug

				        showProductOverlay(nome, immagine, descrizione, provenienza, prezzo, id);
				    });
				});

            } catch (error) {
                throw new Error("Errore nel parsing del JSON: " + error.message);
            }
        })
        .catch(error => console.error("Errore nel caricamento dei prodotti:", error));
}

////////////////////////////////////////////////////////////////////////////////////////////////
//                               GESTIONE SCHEDA PRODOTTO                                     //
////////////////////////////////////////////////////////////////////////////////////////////////

// Funzione per mostrare la scheda in sovrimpressione
function showProductOverlay(nome, immagine, descrizione, provenienza, prezzo, id) {
    console.log("ID prodotto ricevuto nella scheda:", id); // Debug

    document.getElementById("overlayTitle").innerText = nome;
    document.getElementById("overlayImage").src = immagine;
    document.getElementById("overlayDescription").innerText = descrizione;
    document.getElementById("overlayOrigin").innerText = provenienza;
    document.getElementById("overlayPrice").innerText = prezzo;

    let overlay = document.getElementById("productOverlay");
    overlay.style.display = "flex";

    let addToCartBtn = document.getElementById("addToCart");
    addToCartBtn.setAttribute("data-id", id);

    addToCartBtn.onclick = function () {
        console.log("Aggiunta al carrello dell'ID:", id); // Debug
        aggiungiAlCarrello(id);
    };

    document.querySelector(".close-overlay").addEventListener("click", hideProductOverlay);

    overlay.addEventListener("click", function (event) {
        if (event.target === overlay) {
            hideProductOverlay();
        }
    });
}


// Funzione per chiudere la scheda in sovrimpressione
function hideProductOverlay() {
    document.getElementById("productOverlay").style.display = "none";
}

////////////////////////////////////////////////////////////////////////////////////////////////
//                                       CARRELLO                                             //
////////////////////////////////////////////////////////////////////////////////////////////////

document.addEventListener("DOMContentLoaded", function () {
    const floatingCart = document.getElementById("floatingCart");
    const cartSidebar = document.getElementById("cartSidebar");
    const closeCartBtn = document.querySelector(".close-cart");
    const cartCounter = document.getElementById("cartCounter");
    const cartItemsList = document.getElementById("cartItemsList");
    const cartTotal = document.getElementById("cartTotal");
	
    // Mostra il carrello cliccando sull'icona flottante
    floatingCart.addEventListener("click", function () {
        cartSidebar.classList.add("open");
    });

    // Chiude il carrello cliccando sulla "X"
    closeCartBtn.addEventListener("click", function () {
        cartSidebar.classList.remove("open");
    });

    // Chiude il carrello cliccando fuori dal pannello
    document.addEventListener("click", function (event) {
        if (!cartSidebar.contains(event.target) && !floatingCart.contains(event.target)) {
            cartSidebar.classList.remove("open");
        }
    });
	
	// Aggiungere un prodotto al carrello
	function aggiungiAlCarrello(idProdotto) {
	    fetch(`/carrello/aggiungi?idProdotto=${idProdotto}`, { method: "POST" })
	        .then(() => aggiornaCarrello());
	}

	    // Rimuovere un prodotto dal carrello
	    function rimuoviDalCarrello(idProdotto) {
	        fetch(`/carrello/rimuovi?idProdotto=${idProdotto}`, { method: "POST" })
	            .then(() => aggiornaCarrello());
	    }

	    // Recuperare e aggiornare il carrello
		function aggiornaCarrello() {
		    fetch("/carrello/")
		        .then(response => response.json())
		        .then(data => {
		            let cartItemsList = document.getElementById("cartItemsList");
		            let cartTotal = document.getElementById("cartTotal");
		            let cartCounter = document.getElementById("cartCounter");

		            cartItemsList.innerHTML = "";
		            let totale = 0;
		            let count = 0;

		            if (data.length === 0) {
		                cartItemsList.innerHTML = "<p>Il carrello è vuoto.</p>";
		            } else {
		                data.forEach(item => {
		                    let li = document.createElement("li");
		                    li.innerHTML = `
		                        <div class="cart-item">
		                            
		                            <div class="cart-details">
		                                <p><strong>${item.prodotto.nomeProdotto}</strong></p>
		                                <p>${item.quantita} x ${item.prodotto.prezzo.toFixed(2)}€</p>
		                                <button class="remove-btn" onclick="rimuoviDalCarrello(${item.prodotto.id})">🗑️</button>
		                            </div>
		                        </div>
		                    `;
		                    cartItemsList.appendChild(li);

		                    totale += item.prodotto.prezzo * item.quantita;
		                    count += item.quantita;
		                });
		            }

		            cartTotal.innerText = totale.toFixed(2);
		            cartCounter.innerText = count;
		            cartCounter.style.display = count > 0 ? "block" : "none";
		        })
		        .catch(error => console.error("Errore nel caricamento del carrello:", error));
		}

	    aggiornaCarrello(); // Inizializza il carrello al caricamento della pagina

	    // Esponiamo le funzioni globalmente per renderle accessibili dall'HTML
	    window.aggiungiAlCarrello = aggiungiAlCarrello;
	    window.rimuoviDalCarrello = rimuoviDalCarrello;
	});

    // Aggiorna il numero di prodotti nel badge
    function updateCartCounter() {
        let cartItems = JSON.parse(localStorage.getItem("cart")) || [];
        cartCounter.innerText = cartItems.length;
        cartCounter.style.display = cartItems.length > 0 ? "block" : "none";
    }

    updateCartCounter(); // Inizializza il badge all'avvio

