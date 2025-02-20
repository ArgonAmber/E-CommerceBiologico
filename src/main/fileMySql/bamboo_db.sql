DROP DATABASE IF EXISTS bamboo_db;
CREATE DATABASE IF NOT EXISTS bamboo_db;
USE bamboo_db;
SET SESSION sql_mode = 'STRICT_ALL_TABLES';
SET default_storage_engine = INNODB;


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
energia DECIMAL(5,2) NOT NULL,
grassi DECIMAL(5,2) NOT NULL,
grassiSaturi DECIMAL(5,2) NOT NULL,
carboidrati DECIMAL(5,2) NOT NULL,
zuccheri DECIMAL(5,2) NOT NULL,
proteine DECIMAL(5,2) NOT NULL,
sale DECIMAL(5,2) NOT NULL
);

CREATE TABLE Account (
id int auto_increment primary key,
username varchar(255) unique not null,
password varchar(255) unique not null
);


-- **INSERIMENTO PRODOTTI FRUTTA**
INSERT INTO Prodotto (codProd, nomeProdotto, categoria, descrizione, provenienza, prezzo, immagine) VALUES
('FRU001', 'Mirtilli', 'Frutta', 'Mirtilli freschi e succosi', 'Italia', 5.50, '/images/prodotti/frutta/mirtilli.jpg'),
('FRU002', 'Banane', 'Frutta', 'Banane dolci e mature', 'Ecuador', 2.60, '/images/prodotti/frutta/banane.jpg'),
('FRU003', 'Arance', 'Frutta', 'Arance succose e ricche di vitamina C', 'Spagna', 3.20, '/images/prodotti/frutta/arance.jpg'),
('FRU004', 'Pere Conference', 'Frutta', 'Pere dolci e croccanti', 'Italia', 3.80, '/images/prodotti/frutta/pereconference.jpg'),
('FRU005', 'Clementine', 'Frutta', 'Clementine senza semi, dolci e facili da sbucciare', 'Italia', 3.00, '/images/prodotti/frutta/clementine.jpg'),
('FRU006', 'Papaya', 'Frutta', 'Papaya tropicale dolce e succosa', 'Brasile', 6.50, '/images/prodotti/frutta/papaya.jpg'),
('FRU007', 'Kiwi', 'Frutta', 'Kiwi ricchi di vitamina C', 'Nuova Zelanda', 3.80, '/images/prodotti/frutta/kiwi.jpg'),
('FRU008', 'Fragole', 'Frutta', 'Fragole fresche e dolci', 'Italia', 4.90, '/images/prodotti/frutta/fragole.jpg'),
('FRU009', 'Lime', 'Frutta', 'Lime dal sapore intenso', 'Messico', 3.00, '/images/prodotti/frutta/lime.jpg'),
('FRU010', 'Uva Bianca', 'Frutta', 'Uva bianca dolce e succosa', 'Italia', 4.20, '/images/prodotti/frutta/uvabianca.jpg'),
('FRU011', 'Ananas', 'Frutta', 'Ananas dolce e maturo', 'Costa Rica', 5.00, '/images/prodotti/frutta/ananas.jpg'),
('FRU012', 'Mango', 'Frutta', 'Mango esotico e succoso', 'Brasile', 3.50, '/images/prodotti/frutta/mango.jpg'),
('FRU013', 'Uva Rossa', 'Frutta', 'Uva rossa dolce e aromatica', 'Italia', 4.30, '/images/prodotti/frutta/uvarossa.jpg'),
('FRU014', 'Passion Fruit', 'Frutta', 'Frutto della passione dal sapore tropicale', 'Colombia', 7.00, '/images/prodotti/frutta/passionfruit.jpg'),
('FRU015', 'More', 'Frutta', 'More selvatiche dolci e succose', 'Italia', 5.20, '/images/prodotti/frutta/more.jpg'),
('FRU016', 'Lamponi', 'Frutta', 'Lamponi freschi e profumati', 'Italia', 5.30, '/images/prodotti/frutta/lamponi.jpg'),
('FRU017', 'Arance Rosse', 'Frutta', 'Arance rosse ricche di antiossidanti', 'Italia', 3.50, '/images/prodotti/frutta/arancerosse.jpg'),
('FRU018', 'Uva Nera', 'Frutta', 'Uva nera dolce e corposa', 'Italia', 4.50, '/images/prodotti/frutta/uvanera.jpg'),
('FRU019', 'Mele Rosse', 'Frutta', 'Mele rosse croccanti e succose', 'Italia', 2.70, '/images/prodotti/frutta/melerosse.jpg');

-- **INSERIMENTO PRODOTTI VERDURA**
INSERT INTO Prodotto (codProd, nomeProdotto, categoria, descrizione, provenienza, prezzo, immagine) VALUES
('VER001', 'Spinaci', 'Verdura', 'Spinaci freschi e nutrienti', 'Italia', 3.00, '/images/prodotti/verdura/spinaci.jpg'),
('VER002', 'Carote', 'Verdura', 'Carote croccanti e dolci', 'Italia', 1.90, '/images/prodotti/verdura/carote.jpg'),
('VER003', 'Peperoncino Cayenne', 'Verdura', 'Peperoncino piccante Cayenne', 'Messico', 4.00, '/images/prodotti/verdura/peperoncinocayenne.jpg'),
('VER004', 'Aglio Nero', 'Verdura', 'Aglio nero fermentato dal sapore unico', 'Corea', 4.00, '/images/prodotti/verdura/aglionero.jpg'),
('VER005', 'Patate', 'Verdura', 'Patate fresche ideali per ogni ricetta', 'Francia', 1.80, '/images/prodotti/verdura/patate.jpg'),
('VER006', 'Cavolo Romanesco', 'Verdura', 'Cavolo romanesco dal design unico', 'Italia', 3.50, '/images/prodotti/verdura/cavoloromanesco.jpg'),
('VER007', 'Melanzana', 'Verdura', 'Melanzane fresche, ideali per parmigiana', 'Italia', 2.50, '/images/prodotti/verdura/melanzana.jpg'),
('VER008', 'Funghi Shiitake', 'Verdura', 'Funghi orientali dal gusto deciso', 'Giappone', 5.00, '/images/prodotti/verdura/funghishiitake.jpg'),
('VER009', 'Funghi Champignon', 'Verdura', 'Funghi champignon freschi e versatili', 'Italia', 3.80, '/images/prodotti/verdura/funghichampignon.jpg'),
('VER010', 'Cavolfiore', 'Verdura', 'Cavolfiore fresco e croccante', 'Italia', 2.50, '/images/prodotti/verdura/cavolfiore.jpg'),
('VER011', 'Pomodori San Marzano', 'Verdura', 'Pomodori San Marzano ideali per sughi', 'Italia', 3.80, '/images/prodotti/verdura/pomodorisanmarzano.jpg'),
('VER012', 'Funghi Portobello', 'Verdura', 'Funghi Portobello dal sapore intenso', 'Italia', 4.20, '/images/prodotti/verdura/funghiportobello.jpg'),
('VER013', 'Cipolle Rosse', 'Verdura', 'Cipolle rosse dal gusto delicato', 'Italia', 2.20, '/images/prodotti/verdura/cipollerosse.jpg'),
('VER014', 'Aglio', 'Verdura', 'Aglio fresco per insaporire ogni piatto', 'Italia', 2.00, '/images/prodotti/verdura/aglio.jpg'),
('VER015', 'Sedano', 'Verdura', 'Sedano fresco e croccante', 'Italia', 2.20, '/images/prodotti/verdura/sedano.jpg'),
('VER016', 'Pomodori Datterini', 'Verdura', 'Pomodori dolci e succosi', 'Italia', 3.50, '/images/prodotti/verdura/pomodoridatterini.jpg'),
('VER017', 'Asparagi', 'Verdura', 'Asparagi verdi freschi e saporiti', 'Italia', 4.50, '/images/prodotti/verdura/asparagi.jpg'),
('VER018', 'Mini Peperoni', 'Verdura', 'Peperoni dolci in formato mini', 'Italia', 3.30, '/images/prodotti/verdura/minipeperoni.jpg'),
('VER019', 'Barbabietola', 'Verdura', 'Barbabietole rosse dal sapore dolce', 'Italia', 3.00, '/images/prodotti/verdura/barbabietola.jpg'),
('VER020', 'Scalogno', 'Verdura', 'Scalogno dal gusto aromatico', 'Francia', 2.90, '/images/prodotti/verdura/scalogno.jpg');


-- **INSERIMENTO PRODOTTI BEVANDE**
INSERT INTO Prodotto (codProd, nomeProdotto, categoria, descrizione, provenienza, prezzo, immagine) VALUES
('BEV001', 'Arancia Siciliana', 'Bevande', 'Arance siciliane dal gusto intenso', 'Italia', 3.80, '/images/prodotti/bevande/aranciasiciliana.jpg'),
('BEV002', 'Limone Siciliano', 'Bevande', 'Limoni siciliani profumati e succosi', 'Italia', 2.90, '/images/prodotti/bevande/limonesiciliano.jpg'),
('BEV003', 'Pesca Bianca', 'Bevande', 'Pesche bianche dolci e succose', 'Italia', 4.50, '/images/prodotti/bevande/pescabianca.jpg'),
('BEV004', 'Succo di Arancia', 'Bevande', 'Succo di arancia naturale senza zuccheri aggiunti', 'Italia', 3.00, '/images/prodotti/bevande/succoarancia.jpg'),
('BEV005', 'Succo di Arancia Valencia', 'Bevande', 'Succo di arancia Valencia dal sapore intenso', 'Spagna', 3.20, '/images/prodotti/bevande/succoaranciavalencia.jpg'),
('BEV006', 'Succo di Mela', 'Bevande', 'Succo di mela dolce e naturale', 'Italia', 2.80, '/images/prodotti/bevande/succomela.jpg'),
('BEV007', 'Succo di Mora', 'Bevande', 'Succo di mora dal sapore intenso', 'Italia', 3.50, '/images/prodotti/bevande/succomora.jpg'),
('BEV008', 'Succo di Pomodoro', 'Bevande', 'Succo di pomodoro ideale per cocktail e condimenti', 'Italia', 2.90, '/images/prodotti/bevande/succopomodoro.jpg');


INSERT INTO Prodotto (codProd, nomeProdotto, categoria, descrizione, provenienza, prezzo, immagine) VALUES
('CER001', 'Cereali Porridge', 'Cereali', 'Porridge di avena ideale per colazioni salutari', 'UK', 4.20, '/images/prodotti/cereali/cerealiporridge.jpg'),
('CER002', 'Cereali Semi', 'Cereali', 'Mix di cereali con semi per un gusto croccante', 'Italia', 3.50, '/images/prodotti/cereali/cerealisemi.jpg'),
('CER003', 'Cornflakes Senza Glutine', 'Cereali', 'Cornflakes senza glutine croccanti e leggeri', 'USA', 3.80, '/images/prodotti/cereali/cornflakesglutfree.jpg'),
('CER004', 'Cornflakes', 'Cereali', 'Cornflakes classici croccanti', 'Italia', 2.90, '/images/prodotti/cereali/cornflakes.jpg'),
('CER005', 'Fibre Flakes', 'Cereali', 'Fiocchi ricchi di fibre per una colazione equilibrata', 'Francia', 3.70, '/images/prodotti/cereali/fibreflakes.jpg'),
('CER006', 'Golden Granola', 'Cereali', 'Granola dorata croccante con miele', 'Germania', 4.50, '/images/prodotti/cereali/goldengranola.jpg'),
('CER007', 'Mesa Sunrise', 'Cereali', 'Cereali biologici senza glutine', 'Canada', 5.00, '/images/prodotti/cereali/mesasunrise.jpg'),
('CER008', 'Nutty Granola', 'Cereali', 'Granola con mix di frutta secca', 'USA', 4.80, '/images/prodotti/cereali/nuttygranola.jpg'),
('CER009', 'Stelle Cioccolato', 'Cereali', 'Cereali a forma di stelle con cioccolato', 'Italia', 3.90, '/images/prodotti/cereali/stellecioccolato.jpg'),
('CER010', 'Ultimate Granola', 'Cereali', 'Granola croccante con mix di frutta e noci', 'USA', 5.20, '/images/prodotti/cereali/ultimategranola.jpg');
