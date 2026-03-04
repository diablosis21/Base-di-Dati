DROP DATABASE IF EXISTS Esercizio_1;
CREATE DATABASE Esercizio_1;
USE Esercizio_1;

CREATE TABLE Impiegati(
	Cod_fiscale varchar(16) not null,
	Cognome varchar(255) not null,
    Nome varchar(255) not null,
    Data_di_nascita date not null,
    Codice_filiale varchar(255) not null,
    PRIMARY KEY(Cod_fiscale)
);

CREATE TABLE Filiale(
	Codice varchar(255) not null,
    Sede varchar(255) not null,
    Citta varchar(255) not null,
    CF_Direttore varchar(16),
    PRIMARY KEY(Codice)
);

ALTER TABLE Impiegati
ADD FOREIGN KEY (Codice_filiale) REFERENCES Filiale(Codice);

ALTER TABLE Filiale
ADD FOREIGN KEY (CF_Direttore) REFERENCES Impiegati(Cod_fiscale);


USE Esercizio_1;

-- 1. Inseriamo due filiali senza ancora specificare il direttore (usiamo NULL)
INSERT INTO Filiale (Codice, Sede, Citta, CF_Direttore)
VALUES 
('F01', 'Sede Centrale', 'Milano', NULL),
('F02', 'Sede Sud', 'Roma', NULL);

-- 2. Inseriamo quattro impiegati (due per ogni filiale)
INSERT INTO Impiegati (Cod_fiscale, Cognome, Nome, Data_di_nascita, Codice_filiale)
VALUES 
('RSSMRA80A10H501U', 'Rossi', 'Mario', '1980-01-10', 'F01'),
('BNCLGU90B15F205X', 'Bianchi', 'Luigi', '1990-02-15', 'F01'),
('VRDGNN75C12H501Y', 'Verdi', 'Giovanna', '1975-03-12', 'F02'),
('NRIMRA95E20F205W', 'Neri', 'Maria', '1995-05-20', 'F02');

-- 3. Aggiorniamo le filiali per assegnare i direttori (scegliamo Rossi per F01 e Verdi per F02)
UPDATE Filiale 
SET CF_Direttore = 'RSSMRA80A10H501U' 
WHERE Codice = 'F01';

UPDATE Filiale 
SET CF_Direttore = 'VRDGNN75C12H501Y' 
WHERE Codice = 'F02';

SELECT * FROM esercizio_1.impiegati;
SELECT * FROM esercizio_1.filiale;
