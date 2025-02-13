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
prezzo DECIMAL NOT NULL
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