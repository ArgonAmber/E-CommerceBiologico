

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

    addToCartBtn.onclick = function (event) {
        console.log("Aggiunta al carrello dell'ID:", id); // Debug
		animateToCart(immagine, event); // Effetto immagine volante
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

    // Funzione per aprire/chiudere il carrello con l'icona
    floatingCart.addEventListener("click", function () {
        if (cartSidebar.classList.contains("open")) {
            cartSidebar.classList.remove("open");
            floatingCart.style.transform = "translateX(0)"; // Riporta l'icona a destra
        } else {
            cartSidebar.classList.add("open");
            floatingCart.style.transform = "translateX(-280px)"; // Sposta l'icona a sinistra
        }
    });

    // Chiude il carrello cliccando sulla "X"
    closeCartBtn.addEventListener("click", function () {
        cartSidebar.classList.remove("open");
        floatingCart.style.transform = "translateX(0)";
    });

    // Chiude il carrello cliccando fuori e riporta l'icona
    document.addEventListener("click", function (event) {
        if (!cartSidebar.contains(event.target) && !floatingCart.contains(event.target)) {
            cartSidebar.classList.remove("open");
            floatingCart.style.transform = "translateX(0)";
        }
    });

    // Inizializza il carrello
    aggiornaCarrello();
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
		                    let prezzoUnitario = item.prodotto.prezzo; // Prezzo base del prodotto
		                    let prezzoTotale = prezzoUnitario * item.quantita; // Totale per quel prodotto

		                    let li = document.createElement("li");
		                    li.classList.add("cart-item");

		                    li.innerHTML = `
		                        <div class="cart-item-container">
		                            <div class="cart-details">
		                                <p class="cart-product-name"><strong>${item.prodotto.nomeProdotto}</strong></p>
		                                <p>Totale: <strong>${prezzoTotale.toFixed(2)}€</strong> 
		                                    ${item.quantita > 1 ? `<span class="prezzo-unitario">( ${prezzoUnitario.toFixed(2)}€ cad. )</span>` : ""}
		                                </p>
		                                <div class="cart-quantity-controls">
		                                    <button class="quantity-btn" onclick="decrementaQuantita(${item.prodotto.id})">-</button>
		                                    <span class="cart-quantity">${item.quantita}</span>
		                                    <button class="quantity-btn" onclick="incrementaQuantita(${item.prodotto.id})">+</button>
		                                </div>
		                            </div>
		                            <button class="remove-btn" onclick="rimuoviDalCarrello(${item.prodotto.id})">🗑️</button>
		                        </div>
		                        <hr class="cart-divider"> 
		                    `;

		                    cartItemsList.appendChild(li);

		                    totale += prezzoTotale;
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
		
		// Incrementa la quantità di un prodotto nel carrello
		function incrementaQuantita(idProdotto) {
		    fetch(`/carrello/aumenta?idProdotto=${idProdotto}`, { method: "POST" })
		        .then(response => {
		            if (!response.ok) {
		                throw new Error("Errore nell'incremento della quantità");
		            }
		            return response.text();
		        })
		        .then(() => aggiornaCarrello())
		        .catch(error => console.error("Errore:", error));
		}

		// Decrementa la quantità di un prodotto nel carrello
		function decrementaQuantita(idProdotto) {
		    fetch(`/carrello/diminuisci?idProdotto=${idProdotto}`, { method: "POST" })
		        .then(response => {
		            if (!response.ok) {
		                throw new Error("Errore nel decremento della quantità");
		            }
		            return response.text();
		        })
		        .then(() => aggiornaCarrello())
		        .catch(error => console.error("Errore:", error));
		}

	

    // Aggiorna il numero di prodotti nel badge
    function updateCartCounter() {
        let cartItems = JSON.parse(localStorage.getItem("cart")) || [];
        cartCounter.innerText = cartItems.length;
        cartCounter.style.display = cartItems.length > 0 ? "block" : "none";
    }

    updateCartCounter(); // Inizializza il badge all'avvio
	
				
	// Animazione aggiunta carrello !
	
	function animateToCart(productImage, event) {
	    let cartIcon = document.getElementById("floatingCart");

	    // Creiamo un'immagine volante
	    let flyingImage = document.createElement("img");
	    flyingImage.src = productImage;
	    flyingImage.classList.add("flying-image");
	    document.body.appendChild(flyingImage);

	    // Recuperiamo la posizione iniziale dell'immagine del prodotto
	    let productRect = event.target.getBoundingClientRect();
	    flyingImage.style.position = "fixed";
	    flyingImage.style.width = "50px"; // Dimensione fissa
	    flyingImage.style.height = "50px";
	    flyingImage.style.left = productRect.left + "px";
	    flyingImage.style.top = productRect.top + "px";
	    flyingImage.style.zIndex = "9999";
	    flyingImage.style.transition = "all 0.7s ease-in-out";

	    console.log("Immagine volante creata:", flyingImage);

	    // Otteniamo la posizione finale (carrello)
	    let cartRect = cartIcon.getBoundingClientRect();

	    // Delay per garantire l'animazione dell'immagine volante
	    setTimeout(() => {
	        flyingImage.style.left = cartRect.left + "px";
	        flyingImage.style.top = cartRect.top + "px";
	        flyingImage.style.transform = "scale(0)";
	        flyingImage.style.opacity = "0";
	    }, 50);

	    // Quando l'immagine arriva al carrello, attiva il bagliore verde
	    setTimeout(() => {
	        console.log("Aggiungo cart-glow"); // Debug
	        cartIcon.classList.add("cart-glow");

	        // FORZA il CSS per garantire che venga applicato
	        cartIcon.style.boxShadow = "0 0 20px rgba(0, 255, 0, 1)";
	        cartIcon.style.border = "2px solid #00ff00";
	        cartIcon.style.backgroundColor = "white"; // Mantenere l'icona bianca

	        // Rimuove la luce verde dopo 150ms (flash veloce)
	        setTimeout(() => {
	            console.log("Rimuovo cart-glow"); // Debug
	            cartIcon.classList.remove("cart-glow");

	            // RIMUOVE il CSS forzato dopo 150ms
	            cartIcon.style.boxShadow = "none";
	            cartIcon.style.border = "1px solid #ddd";
	            cartIcon.style.backgroundColor = "white";
	        }, 150);
	    }, 400); // ORA parte al momento giusto!

	    // Dopo l'animazione, rimuoviamo l'immagine e attiviamo il sobbalzo
	    setTimeout(() => {
	        flyingImage.remove();

	        // Aggiunge il sobbalzo
	        cartIcon.classList.add("cart-bounce");

	        // Rimuove il sobbalzo dopo 500ms
	        setTimeout(() => {
	            cartIcon.classList.remove("cart-bounce");
	        }, 500);
	    }, 700); // L'immagine ha più tempo per scomparire
	}
