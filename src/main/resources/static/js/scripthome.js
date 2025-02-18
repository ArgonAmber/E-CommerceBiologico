 HEAD
// Oggetto contenente i prodotti suddivisi per categoria
/*const products = {
	"frutta": [
		{ name: "Mirtilli", price: "€5,50", img: "/images/prodotti/frutta/mirtilli.jpg" },
		{ name: "Banane", price: "€2,60", img: "/images/prodotti/frutta/banane.jpg" },
		{ name: "Arance", price: "€3,20", img: "/images/prodotti/frutta/arance.jpg" },
		{ name: "Pere Conference", price: "€3,80", img: "/images/prodotti/frutta/pereconference.jpg" },
		{ name: "Clementine", price: "€3,00", img: "/images/prodotti/frutta/clementine.jpg" },
		{ name: "Papaya", price: "€6,50", img: "/images/prodotti/frutta/papaya.jpg" },
		{ name: "Kiwi", price: "€3,80", img: "/images/prodotti/frutta/kiwi.jpg" },
		{ name: "Fragole", price: "€4,90", img: "/images/prodotti/frutta/fragole.jpg" },
		{ name: "Lime", price: "€3,00", img: "/images/prodotti/frutta/lime.jpg" },
		{ name: "Uva Bianca", price: "€4,20", img: "/images/prodotti/frutta/uvabianca.jpg" },
		{ name: "Ananas", price: "€5,00", img: "/images/prodotti/frutta/ananas.jpg" },
		{ name: "Mango", price: "€3,50", img: "/images/prodotti/frutta/mango.jpg" },
		{ name: "Uva Rossa", price: "€4,30", img: "/images/prodotti/frutta/uvarossa.jpg" },
		{ name: "Passion Fruit", price: "€7,00", img: "/images/prodotti/frutta/passionfruit.jpg" },
		{ name: "More", price: "€5,20", img: "/images/prodotti/frutta/more.jpg" },
		{ name: "Lamponi", price: "€5,30", img: "/images/prodotti/frutta/lamponi.jpg" },
		{ name: "Arance Rosse", price: "€3,50", img: "/images/prodotti/frutta/arancerosse.jpg" },
		{ name: "Uva Nera", price: "€4,50", img: "/images/prodotti/frutta/uvanera.jpg" },
		{ name: "Mele Rosse", price: "€2,70", img: "/images/prodotti/frutta/melerosse.jpg" }
	],
	"verdura": [
		{ name: "Spinaci", price: "€3,00", img: "/images/prodotti/verdura/spinaci.jpg" },
		{ name: "Carote", price: "€1,90", img: "/images/prodotti/verdura/carote.jpg" },
		{ name: "Peperoncino Cayenne", price: "€4,00", img: "/images/prodotti/verdura/peperoncinocayenne.jpg" },
		{ name: "Aglio Nero", price: "€4,00", img: "/images/prodotti/verdura/aglionero.jpg" },
		{ name: "Patate", price: "€1,80", img: "/images/prodotti/verdura/patate.jpg" },
		{ name: "Cavolo Romanesco", price: "€3,50", img: "/images/prodotti/verdura/cavoloromanesco.jpg" },
		{ name: "Melanzana", price: "€2,50", img: "/images/prodotti/verdura/melanzana.jpg" },
		{ name: "Funghi Shiitake", price: "€5,00", img: "/images/prodotti/verdura/funghishiitake.jpg" },
		{ name: "Funghi Champignon", price: "€3,80", img: "/images/prodotti/verdura/funghichampignon.jpg" },
		{ name: "Cavolfiore", price: "€2,50", img: "/images/prodotti/verdura/cavolfiore.jpg" },
		{ name: "Pomodori San Marzano", price: "€3,80", img: "/images/prodotti/verdura/pomodorisanmarzano.jpg" },
		{ name: "Funghi Portobello", price: "€4,20", img: "/images/prodotti/verdura/funghiportobello.jpg" },
		{ name: "Cipolle Rosse", price: "€2,20", img: "/images/prodotti/verdura/cipollerosse.jpg" },
		{ name: "Aglio", price: "€2,00", img: "/images/prodotti/verdura/aglio.jpg" },
		{ name: "Sedano", price: "€2,20", img: "/images/prodotti/verdura/sedano.jpg" },
		{ name: "Pomodori Datterini", price: "€3,50", img: "/images/prodotti/verdura/pomodoridatterini.jpg" },
		{ name: "Asparagi", price: "€4,50", img: "/images/prodotti/verdura/asparagi.jpg" },
		{ name: "Mini Peperoni", price: "€3,30", img: "/images/prodotti/verdura/minipeperoni.jpg" },
		{ name: "Barbabietola", price: "€3,00", img: "/images/prodotti/verdura/barbabietola.jpg" },
		{ name: "Scalogno", price: "€2,90", img: "/images/prodotti/verdura/scalogno.jpg" }
	],

	"pasta": [
		{ name: "Spaghetti", price: "€1,50", img: "/images/prodotti/pasta/spaghetti.jpg" },
		{ name: "Penne Rigate", price: "€1,20", img: "/images/prodotti/pasta/pennerigate.jpg" },
		{ name: "Fusilli", price: "€1,50", img: "/images/prodotti/pasta/fusilli.jpg" },
		{ name: "Riso Basmati", price: "€1,50", img: "/images/prodotti/pasta/risobasmati.jpg" }
	],
	"bevande": [
		{ name: "Succo di Mela", price: "€2,30", img: "/images/prodotti/bevande/succoallamela.jpg" },
		{ name: "Latte alla Fragola", price: "€2,10", img: "/images/prodotti/bevande/bevandaallafragola.jpg" },
		{ name: "Latte al Cocco", price: "€2,50", img: "/images/prodotti/bevande/lattealcocco.jpg" },
		{ name: "Limonata Siciliana", price: "€2,40", img: "/images/prodotti/bevande/limonatasiciliana.jpg" }
	]
};

// Funzione per mostrare la categoria selezionata
function showCategory(category) {
	let catalogo = document.getElementById("catalogo");
	catalogo.innerHTML = ""; // Puliamo il catalogo prima di inserire i nuovi prodotti

	if (products[category]) {
		products[category].forEach(product => {
			let productHTML = `
			<div class="col-md-3">
			    <div class="product-card">
			        <a href="${product}" class="text-decoration-none">
			            <img src="${product.img}" alt="${product.name}">
			            <h5>${product.name}</h5>
			            <p>${product.price}</p>
			        </a>
			    </div>
			</div>
            `;
			catalogo.innerHTML += productHTML;
		});
	}
}
*/

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


