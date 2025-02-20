function MenuMobile() {
    var sideMenu = document.getElementById("sideMenu");
    if (sideMenu.style.width === "100%") {
        sideMenu.style.width = "0";
    } else {
        sideMenu.style.width = "100%";
    }
}

// chiude il menu dopo il click su un link
document.querySelectorAll("#sideMenu a").forEach(link => {
    link.addEventListener("click", function() {
        document.getElementById("sideMenu").style.width = "0";
    });
});


///////////////MENU A TENDINA//////////////////////////////////////////////////////////////

///////////////INSERISCI PRODOTTO//////////////////////////////////////////////////////////////

function saveProduct() {
    var tableContainer = document.querySelector('.right-column');
    var table = document.createElement('table');
    table.className = 'table';

    var thead = document.createElement('thead');
    var theadRow = document.createElement('tr');
    var attributes = ['Codice', 'Nome', 'Categoria', 'Descrizione', 'Provenienza', 'Prezzo', 'Immagine'];

    attributes.forEach(function(attribute) {
        var th = document.createElement('th');
        th.textContent = attribute;
        theadRow.appendChild(th);
    });
    thead.appendChild(theadRow);
    table.appendChild(thead);

    var tbody = document.createElement('tbody');
    var newRow = document.createElement('tr');
    newRow.style.backgroundColor = '#f0f8ff';

    attributes.forEach(function(attribute) {
        var newCell = document.createElement('td');
        newCell.setAttribute('contenteditable', 'true');
        if (attribute === 'Immagine') {
            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.className = 'image-upload';
            input.style.display = 'none';

            var label = document.createElement('label');
            label.className = 'btn btn-success';
            label.textContent = 'Carica immagine';
            label.appendChild(input);

            label.onclick = function() {
                input.click();
            };

            newCell.appendChild(label);
        }
        newRow.appendChild(newCell);
    });

    tbody.appendChild(newRow);
    table.appendChild(tbody);
    tableContainer.innerHTML = '';
    tableContainer.appendChild(table);

    // pulsante "Inserisci" fuori dalla tabella
    var insertButton = document.createElement('button');
    insertButton.className = 'btn btn-success';
    insertButton.textContent = 'Inserisci';
    insertButton.onclick = function() {
        var imageFile = newRow.cells[6].querySelector('.image-upload').files[0];
        if (!imageFile) {
            alert('Per favore seleziona un\'immagine.');
            return;
        }

        var productData = {
            codProd: newRow.cells[0].innerText,
            nomeProdotto: newRow.cells[1].innerText,
            categoria: newRow.cells[2].innerText,
            descrizione: newRow.cells[3].innerText,
            provenienza: newRow.cells[4].innerText,
            prezzo: parseFloat(newRow.cells[5].innerText)
        };

        // Conversione dell'immagine in Base64
        var reader = new FileReader();
        reader.onloadend = function() {
            productData.immagine = reader.result;
            inviaDati(productData);
        };
        reader.readAsDataURL(imageFile);
    };
    tableContainer.appendChild(insertButton);
}

function inviaDati(productData) {
    fetch('/prodotto/insert', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(productData)
    })
    .then(response => {
        if (response.ok) {
            console.log('Prodotto inserito con successo!');
        } else {
            console.error('Errore durante l\'inserimento del prodotto.');
        }
    })
    .catch(error => console.error('Errore:', error));
}





///////////////INSERISCI PRODOTTO//////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////


function showProducts() {
    fetch('/prodotto/prodotti')
        .then(response => response.json())
        .then(products => {
            var table = '<table class="table"><thead><tr><th>Codice</th><th>Nome</th><th>Categoria</th><th>Descrizione</th><th>Provenienza</th><th>Prezzo</th><th>Immagine</th></tr></thead><tbody>';
            products.forEach(function(product) {
                console.log('Percorso immagine:', product.immagine); // Stampa il percorso dell'immagine nella console

                table += '<tr id="product-' + product.id + '">'
                    + '<td ondblclick="editCell(this)">' + product.codProd + '</td>'
                    + '<td ondblclick="editCell(this)">' + product.nomeProdotto + '</td>'
                    + '<td ondblclick="editCell(this)">' + product.categoria + '</td>'
                    + '<td ondblclick="editCell(this)">' + product.descrizione + '</td>'
                    + '<td ondblclick="editCell(this)">' + product.provenienza + '</td>'
                    + '<td ondblclick="editCell(this)">' + product.prezzo + '</td>'
                    + '<td ondblclick="editCell(this)"><img src="' + product.immagine + '" alt="Immagine prodotto" class="img-thumbnail" style="width: 50px; height: 50px;"></td>'
                    + '</tr>'
                    + '<tr><td colspan="7"><div class="button-group"><button class="btn btn-primary" onclick="updateProduct(' + product.id + ')">Aggiorna</button><button class="btn btn-danger" onclick="removeProduct(' + product.id + ')">Rimuovi</button></div></td></tr>';
            });
            table += '</tbody></table>';

            document.getElementById('productTable').innerHTML = table;
        })
        .catch(error => console.error('Errore:', error));
}



function editCell(cell) {
    var originalContent = cell.innerText;
    cell.setAttribute('contenteditable', 'true');
    cell.focus();

    cell.onblur = function() {
        cell.setAttribute('contenteditable', 'false');
        if (cell.innerText !== originalContent) {
            cell.classList.add('updated');
        }
    };
}

function updateProduct(productId) {
    var row = document.getElementById('product-' + productId);
    var updatedData = {
        id: productId,
        codProd: row.cells[0].innerText,
        nomeProdotto: row.cells[1].innerText,
        categoria: row.cells[2].innerText,
        descrizione: row.cells[3].innerText,
        provenienza: row.cells[4].innerText,
        prezzo: parseFloat(row.cells[5].innerText),
        immagine: row.cells[6].querySelector('img').src // Assicurati di includere l'URL dell'immagine
    };

    fetch('/prodotto/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(updatedData)
    })
    .then(response => {
        if (response.ok) {
            // Rimuove la classe updated dopo l'aggiornamento
            for (let cell of row.cells) {
                cell.classList.remove('updated');
            }
            console.log('Prodotto aggiornato con successo!');
        } else {
            console.error('Errore durante l\'aggiornamento del prodotto.');
        }
    })
    .catch(error => console.error('Errore:', error));
}

function removeProduct(productId) {
	// questa roba qua rimuove solo la riga a livello front
    var row = document.getElementById('product-' + productId);
    if (row) {
        row.parentNode.removeChild(row);
    }

	// questo fa il lavoraccio invece
    fetch('/prodotto/delete', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id: productId }) // Invia solo l'ID del prodotto
    })
    .then(response => {
        if (response.ok) {
            console.log('Prodotto rimosso con successo dal database!');
        } else {
            console.error('Errore durante la rimozione del prodotto dal database.');
        }
    })
    .catch(error => {
        console.error('Errore:', error);
    });
}


