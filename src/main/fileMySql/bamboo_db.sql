drop database if exists bamboo_db;
create database if not exists bamboo_db;
use bamboo_db;
set session sql_mode= 'strict_all_tables';
set default_storage_engine = INNODB;

CREATE TABLE Prodotto(
id INT AUTO_INCREMENT PRIMARY KEY,
codProd VARCHAR(255) UNIQUE NOT NULL,
nomeProdotto VARCHAR(255) UNIQUE NOT NULL,
categoria VARCHAR(255) NOT NULL,
descrizione VARCHAR(255) NOT NULL,
provenienza VARCHAR(255) NOT NULL,
prezzo DECIMAL(5,2) NOT NULL,
immagine VARCHAR(255) NOT NULL
);

CREATE TABLE ValoreNutrizionale(
id INT AUTO_INCREMENT PRIMARY KEY,
codProd VARCHAR(255) UNIQUE NOT NULL,
FOREIGN KEY (codProd) REFERENCES Prodotto (codProd),
energia DECIMAL NOT NULL,
grassi DECIMAL NOT NULL,
grassiSaturi DECIMAL NOT NULL,
carboidrati DECIMAL NOT NULL,
zuccheri DECIMAL NOT NULL,
proteine DECIMAL NOT NULL,
sale DECIMAL NOT NULL
);

CREATE TABLE Account (
id int auto_increment primary key,
username varchar(255) unique not null,
password varchar(255) unique not null
);

INSERT INTO Prodotto (codProd, nomeProdotto, categoria, descrizione, provenienza, prezzo, immagine) VALUES
('FRU001', 'Mirtilli', 'Frutta', 'Mirtilli freschi e succosi', 'Italia', 5.50, '/immages/prodotti/frutta/mirtilli.jpg'),
('FRU002', 'Banane', 'Frutta', 'Banane dolci e mature', 'Ecuador', 2.60, '/immagini/prodotti/frutta/banane.jpg'),
('FRU003', 'Arance', 'Frutta', 'Arance succose e ricche di vitamina C', 'Spagna', 3.20, '/immagini/prodotti/frutta/arance.jpg'),
('FRU004', 'Pere Conference', 'Frutta', 'Pere dolci e croccanti', 'Italia', 3.80, '/immagini/prodotti/frutta/pereconference.jpg'),
('FRU005', 'Clementine', 'Frutta', 'Clementine senza semi, dolci e facili da sbucciare', 'Italia', 3.00, '/immagini/prodotti/frutta/clementine.jpg'),
('FRU006', 'Papaya', 'Frutta', 'Papaya tropicale dolce e succosa', 'Brasile', 6.50, '/immagini/prodotti/frutta/papaya.jpg'),
('FRU007', 'Kiwi', 'Frutta', 'Kiwi ricchi di vitamina C', 'Nuova Zelanda', 3.80, '/immagini/prodotti/frutta/kiwi.jpg'),
('FRU008', 'Fragole', 'Frutta', 'Fragole fresche e dolci', 'Italia', 4.90, '/immagini/prodotti/frutta/fragole.jpg'),
('FRU009', 'Lime', 'Frutta', 'Lime dal sapore intenso', 'Messico', 3.00, '/immagini/prodotti/frutta/lime.jpg'),
('FRU010', 'Uva Bianca', 'Frutta', 'Uva bianca dolce e succosa', 'Italia', 4.20, '/immagini/prodotti/frutta/uvabianca.jpg');

-- Inserimento prodotti (Verdura)
INSERT INTO Prodotto (codProd, nomeProdotto, categoria, descrizione, provenienza, prezzo, immagine) VALUES
('VER001', 'Spinaci', 'Verdura', 'Spinaci freschi e nutrienti', 'Italia', 3.00, '/immagini/prodotti/verdura/spinaci.jpg'),
('VER002', 'Carote', 'Verdura', 'Carote croccanti e dolci', 'Italia', 1.90, '/immagini/prodotti/verdura/carote.jpg'),
('VER003', 'Peperoncino Cayenne', 'Verdura', 'Peperoncino piccante Cayenne', 'Messico', 4.00, '/immagini/prodotti/verdura/peperoncinocayenne.jpg'),
('VER004', 'Aglio Nero', 'Verdura', 'Aglio nero fermentato dal sapore unico', 'Corea', 4.00, '/immagini/prodotti/verdura/aglionero.jpg'),
('VER005', 'Patate', 'Verdura', 'Patate fresche ideali per ogni ricetta', 'Francia', 1.80, '/immagini/prodotti/verdura/patate.jpg'),
('VER006', 'Cavolo Romanesco', 'Verdura', 'Cavolo romanesco dal design unico', 'Italia', 3.50, '/immagini/prodotti/verdura/cavoloromanesco.jpg'),
('VER007', 'Melanzana', 'Verdura', 'Melanzane fresche, ideali per parmigiana', 'Italia', 2.50, '/immagini/prodotti/verdura/melanzana.jpg'),
('VER008', 'Funghi Shiitake', 'Verdura', 'Funghi orientali dal gusto deciso', 'Giappone', 5.00, '/immagini/prodotti/verdura/funghishiitake.jpg'),
('VER009', 'Cavolfiore', 'Verdura', 'Cavolfiore fresco e croccante', 'Italia', 2.50, '/immagini/prodotti/verdura/cavolfiore.jpg');


-- Inserimento prodotti (Bevande)
INSERT INTO Prodotto (codProd, nomeProdotto, categoria, descrizione, provenienza, prezzo, immagine) VALUES
('BEV001', 'Succo di Mela', 'Bevande', 'Succo di mela naturale al 100%', 'Italia', 2.30, '/immagini/prodotti/bevande/succoallamela.jpg'),
('BEV002', 'Latte alla Fragola', 'Bevande', 'Latte con un delicato sapore di fragola', 'Germania', 2.10, '/immagini/prodotti/bevande/bevandaallafragola.jpg'),
('BEV003', 'Latte al Cocco', 'Bevande', 'Latte vegetale al cocco', 'Thailandia', 2.50, '/immagini/prodotti/bevande/lattealcocco.jpg'),
('BEV004', 'Limonata Siciliana', 'Bevande', 'Limonata preparata con limoni di Sicilia', 'Italia', 2.40, '/immagini/prodotti/bevande/limonatasiciliana.jpg');

