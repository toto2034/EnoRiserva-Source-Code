DROP DATABASE IF EXISTS storage;
CREATE DATABASE storage;
USE storage;

DROP TABLE IF EXISTS utenti;
DROP TABLE IF EXISTS product;

CREATE TABLE utenti (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(50),
    nome VARCHAR(30)
);

CREATE TABLE product (
	ID_prodotto INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Descrizione VARCHAR(30) NOT NULL,
	Tipologia VARCHAR(30) NOT NULL,
    Regione VARCHAR(30) NOT NULL,
	Datac VARCHAR(20) NOT NULL,
    Prezzo INT NOT NULL,
    Quantita INT NOT NULL
);


INSERT INTO product VALUES (1, 'Chianti Classico', 'Vino toscano DOCG', 'Vino Rosso', 'Toscana', '2022-10-15', 15, 50);
INSERT INTO product VALUES (2, 'Barolo', 'Vino piemontese DOCG', 'Vino Rosso', 'Piemonte', '2021-11-20', 30, 40);

INSERT INTO product VALUES (3, 'Verdicchio', 'Vino marchigiano secco', 'Vino Bianco', 'Marche', '2023-06-10', 10, 60);
INSERT INTO product VALUES (4, 'Falanghina', 'Vino fresco campano', 'Vino Bianco', 'Campania', '2022-08-05', 12, 70);

INSERT INTO product VALUES (5, 'Moët & Chandon', 'Champagne francese brut', 'Champagne', 'Francia', '2022-12-31', 50, 20);
INSERT INTO product VALUES (6, 'Veuve Clicquot', 'Champagne elegante', 'Champagne', 'Francia', '2021-09-25', 55, 25);

INSERT INTO utenti (username, password, email, nome)
VALUES ('armando21', '0000', 'armando@gmail.com', 'Armando');