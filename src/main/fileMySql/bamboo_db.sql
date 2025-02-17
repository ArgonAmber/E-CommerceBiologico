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
