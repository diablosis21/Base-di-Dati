-- 1. Prepariamo l'ambiente di lavoro pulito
DROP DATABASE IF EXISTS Biblioteca;
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- 2. Creiamo la tabella degli Autori
CREATE TABLE Autori (
    ID_Autore INT AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Cognome VARCHAR(100) NOT NULL,
    Nazione VARCHAR(50),
    PRIMARY KEY (ID_Autore)
);

-- 3. Creiamo la tabella dei Libri (collegata agli autori)
CREATE TABLE Libri (
    ID_Libro INT AUTO_INCREMENT,
    Titolo VARCHAR(255) NOT NULL,
    Anno_Pubblicazione INT,
    ID_Autore INT, -- Questa sarà la nostra chiave esterna
    PRIMARY KEY (ID_Libro),
    FOREIGN KEY (ID_Autore) REFERENCES Autori(ID_Autore)
);

-- 4. Inseriamo i dati degli Autori 
-- (Non inserisco l'ID perché ci pensa l'AUTO_INCREMENT!)
INSERT INTO Autori (Nome, Cognome, Nazione) VALUES 
('Dante', 'Alighieri', 'Italia'),
('Jane', 'Austen', 'Regno Unito'),
('George', 'Orwell', 'Regno Unito');

-- 5. Inseriamo i dati dei Libri
-- L'ID_Autore 1 è Dante, il 2 è Jane Austen, il 3 è George Orwell
INSERT INTO Libri (Titolo, Anno_Pubblicazione, ID_Autore) VALUES 
('La Divina Commedia', 1320, 1),
('Orgoglio e Pregiudizio', 1813, 2),
('1984', 1949, 3),
('La Fattoria degli Animali',
