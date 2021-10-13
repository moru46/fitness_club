-- ---------------------- --
-- DICHIARAZIONE DATABASE --
-- ---------------------- --

SET NAMES latin1; 
DROP DATABASE IF EXISTS `FitnessClub`; 
CREATE DATABASE IF NOT EXISTS `FitnessClub`; 
USE `FitnessClub`; 
SET FOREIGN_KEY_CHECKS = 0; 
SET GLOBAL EVENT_SCHEDULER = ON; 

-- ----------------- --
-- CREAZIONE TABELLE --
-- ----------------- --

-- Tabella CentroFitness --

DROP TABLE IF EXISTS `CentroFitness`; 
CREATE TABLE `CentroFitness` ( 
`CodCentro` VARCHAR(50) NOT NULL, 
`Indirizzo` VARCHAR(50) NOT NULL, 
`TotPersone` INT(11) NOT NULL, 
`NumTelefonico` VARCHAR(50) NOT NULL, 
`Dimensione` INT(11) NOT NULL,
PRIMARY KEY (`CodCentro`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella SaleAllenamento -- 

DROP TABLE IF EXISTS `SaleAllenamento`; 
CREATE TABLE `SaleAllenamento` ( 
`CodSala` VARCHAR(50) NOT NULL, 
`Nome` VARCHAR(50) NOT NULL, 
`Rank` VARCHAR(50) NOT NULL, 
`TotAttrezzi` INT(11) NOT NULL, 
`Centro` VARCHAR(50) NOT NULL,
`Responsabile` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodSala`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella GiorniApertura -- 

DROP TABLE IF EXISTS `GiorniApertura`; 
CREATE TABLE `GiorniApertura` ( 
`CodCentro` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`OrarioApertura` TIME NOT NULL, 
`OrarioChiusura` TIME NOT NULL, 
PRIMARY KEY (`CodCentro`,`Giorno`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Apparecchiature --

DROP TABLE IF EXISTS `Apparecchiature`; 
CREATE TABLE `Apparecchiature` ( 
`CodAttrezzo` VARCHAR(50) NOT NULL, 
`Tipologia` VARCHAR(50) NOT NULL, 
`Usura` INT(11) NOT NULL, 
`ConsumoEnergetico` INT(11) NOT NULL, 
`Sala` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodAttrezzo`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Riparazione --

DROP TABLE IF EXISTS `Riparazione`; 
CREATE TABLE `Riparazione` ( 
`CodAttrezzo` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodAttrezzo`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 


-- Tabella Piscine --

DROP TABLE IF EXISTS `Piscine`; 
CREATE TABLE `Piscine` ( 
`CodPiscina` VARCHAR(50) NOT NULL, 
`Rank` VARCHAR(50) NOT NULL, 
`CapienzaMax` INT(11) NOT NULL, 
`Centro` VARCHAR(50) NOT NULL,
`Responsabile` VARCHAR(30) NOT NULL,
PRIMARY KEY (`CodPiscina`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Cliente --

DROP TABLE IF EXISTS `Cliente`; 
CREATE TABLE `Cliente` ( 
`CodFiscale` VARCHAR(50) NOT NULL, 
`Nome` VARCHAR(50) NOT NULL, 
`Cognome` VARCHAR(11) NOT NULL, 
`Indirizzo` VARCHAR(50) NOT NULL,
`DataNascita` DATE NOT NULL,
`Documento` VARCHAR(50) NOT NULL,
`ComuneRilascio` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodFiscale`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Dipendente --

DROP TABLE IF EXISTS `Dipendente`; 
CREATE TABLE `Dipendente` ( 
`CodFiscale` VARCHAR(50) NOT NULL, 
`Nome` VARCHAR(50) NOT NULL, 
`Cognome` VARCHAR(50) NOT NULL, 
`Indirizzo` VARCHAR(50) NOT NULL,
`DataNascita` DATE NOT NULL,
`Documento` VARCHAR(50) NOT NULL,
`ComuneRilascio` VARCHAR(50) NOT NULL,
`RuoloLavorativo` VARCHAR(50) NOT NULL,
`Supervisore` VARCHAR(50),
PRIMARY KEY (`CodFiscale`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella SchedaBase --

DROP TABLE IF EXISTS `SchedaBase`; 
CREATE TABLE `SchedaBase` ( 
`CodCliente` VARCHAR(50) NOT NULL, 
`Peso` INT(11) NOT NULL, 
`Altezza` INT(11) NOT NULL, 
`StatoPeso` VARCHAR(50) NOT NULL,
`MassaMagra` INT(11) NOT NULL,
`MassaGrassa` INT(11) NOT NULL,
`Acqua` INT(11) NOT NULL,
`Medico` VARCHAR(50) NOT NULL,
`DataVisita` DATE NOT NULL,
PRIMARY KEY (`CodCliente`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella ClienteGiornaliero --

DROP TABLE IF EXISTS `ClienteGiornaliero`; 
CREATE TABLE `ClienteGiornaliero` ( 
`CodFiscale` VARCHAR(50) NOT NULL, 
`Nome` VARCHAR(50) NOT NULL, 
`Cognome` VARCHAR(50) NOT NULL, 
`Indirizzo` VARCHAR(50) NOT NULL,
`DataNascita` DATE NOT NULL,
`Documento` VARCHAR(50) NOT NULL,
`ComuneRilascio` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodFiscale`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Contratto --

DROP TABLE IF EXISTS `Contratto`; 
CREATE TABLE `Contratto` ( 
`CodContratto` VARCHAR(50) NOT NULL, 
`Tipologia` VARCHAR(50) NOT NULL, 
`DataInizio` DATE NOT NULL, 
`DataFine` DATE NOT NULL,
`Scopo` VARCHAR(50) NOT NULL,
`CostoMensile` INT(11) NOT NULL,
`Cliente` VARCHAR(50) NOT NULL,
`DataSottoscrizione` DATE NOT NULL,
`Consulente` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodContratto`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Personalizzato --

DROP TABLE IF EXISTS `Personalizzato`; 
CREATE TABLE `Personalizzato` ( 
`CodContratto` VARCHAR(50) NOT NULL, 
`NumSedi` INT(11) NOT NULL, 
`NumIngressi` INT(11) NOT NULL, 
`Rank` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodContratto`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Rate --

DROP TABLE IF EXISTS `Rate`; 
CREATE TABLE `Rate` ( 
`CodContratto` VARCHAR(50) NOT NULL, 
`DataScadenza` DATE NOT NULL, 
`Importo` INT(11) NOT NULL, 
`StatoPagamento` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodContratto`,`DataScadenza`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Muscoli --

DROP TABLE IF EXISTS `Muscoli`; 
CREATE TABLE `Muscoli` ( 
`CodMuscolo` VARCHAR(50) NOT NULL, 
`Nome` VARCHAR(50) NOT NULL, 
`LvPotenziamento` VARCHAR(50) NOT NULL, 
`Contratto` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodMuscolo`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella SediAccessibili --

DROP TABLE IF EXISTS `SediAccessibili`; 
CREATE TABLE `SediAccessibili` ( 
`CodCentro` VARCHAR(50) NOT NULL, 
`CodContratto` VARCHAR(50) NOT NULL, 
PRIMARY KEY (`CodCentro`,`CodContratto`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella TabellaEsercizi --

DROP TABLE IF EXISTS `TabellaEsercizi`; 
CREATE TABLE `TabellaEsercizi` ( 
`CodTabella` VARCHAR(50) NOT NULL, 
`DataInizio` DATE NOT NULL, 
`DataFine` DATE NOT NULL, 
`Tutor` VARCHAR(50) NOT NULL,
`Cliente` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodTabella`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Esercizio --

DROP TABLE IF EXISTS `Esercizio`; 
CREATE TABLE `Esercizio` ( 
`CodEsercizio` VARCHAR(50) NOT NULL, 
`Nome` VARCHAR(50) NOT NULL, 
`DispendioEnergetico` INT(11) NOT NULL, 
PRIMARY KEY (`CodEsercizio`) 
)ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Configurazione --

DROP TABLE IF EXISTS `Configurazione`; 
CREATE TABLE `Configurazione` ( 
`CodTabella` VARCHAR(50) NOT NULL, 
`CodEsercizio` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`Macchinario` VARCHAR(50) NOT NULL,
`Inclinazione` INT(11),
`Velocita` INT(11),
`Peso` INT(11),
`Serie` INT(11) NOT NULL,
`Ripetizioni` INT(11) NOT NULL,
`Recupero` INT(11) NOT NULL,
PRIMARY KEY (`CodTabella`,`CodEsercizio`,`Giorno`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella SchedaAlimentazione --

DROP TABLE IF EXISTS `SchedaAlimentazione`; 
CREATE TABLE `SchedaAlimentazione` ( 
`CodScheda` VARCHAR(50) NOT NULL, 
`DataInizio` DATE NOT NULL, 
`DataFine` DATE NOT NULL, 
`ApportoGiornaliero` INT(11) NOT NULL,
`Obiettivo` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodScheda`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Pasto --

DROP TABLE IF EXISTS `Pasto`; 
CREATE TABLE `Pasto` ( 
`CodPasto` VARCHAR(50) NOT NULL, 
`ApportoCalorico` INT(11) NOT NULL, 
`InfoPasto` VARCHAR(50) NOT NULL, 
PRIMARY KEY (`CodPasto`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella CalendarioDieta --

DROP TABLE IF EXISTS `CalendarioDieta`; 
CREATE TABLE `CalendarioDieta` ( 
`CodScheda` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`NumPasti` INT(11) NOT NULL, 
PRIMARY KEY (`CodScheda`,`Giorno`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella VisitaDieta --

DROP TABLE IF EXISTS `VisitaDieta`; 
CREATE TABLE `VisitaDieta` ( 
`Nutrizionista` VARCHAR(50) NOT NULL, 
`Cliente` VARCHAR(50) NOT NULL, 
`SchedaAlimentazione` VARCHAR(50) NOT NULL, 
`DataVisita` DATE NOT NULL,
PRIMARY KEY (`Nutrizionista`,`Cliente`,`SchedaAlimentazione`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella ComposizioneDieta --

DROP TABLE IF EXISTS `ComposizioneDieta`; 
CREATE TABLE `ComposizioneDieta` ( 
`Pasto` VARCHAR(50) NOT NULL, 
`SchedaAlimentazione` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`ParteGiorno` VARCHAR(50) NOT NULL,
PRIMARY KEY (`Pasto`,`SchedaAlimentazione`,`Giorno`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Armadietto --

DROP TABLE IF EXISTS `Armadietto`; 
CREATE TABLE `Armadietto` ( 
`CodArmadietto` VARCHAR(50) NOT NULL, 
`Combinazione` VARCHAR(50) NOT NULL DEFAULT '0000', 
`Stato` VARCHAR(50) NOT NULL, 
`Spogliatoio` VARCHAR(50) NOT NULL,
`OrarioOccupazione` TIME DEFAULT NULL,
PRIMARY KEY (`CodArmadietto`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Spogliatoi --

DROP TABLE IF EXISTS `Spogliatoi`; 
CREATE TABLE `Spogliatoi` ( 
`CodSpogliatoio` VARCHAR(50) NOT NULL, 
`Capienza` INT(11) NOT NULL, 
`Centro` VARCHAR(50) NOT NULL, 
`PuntoCardinale` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodSpogliatoio`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella AccessoCliente --

DROP TABLE IF EXISTS `AccessoCliente`; 
CREATE TABLE `AccessoCliente` ( 
`Cliente` VARCHAR(50) NOT NULL, 
`Data` DATE NOT NULL, 
`OraIngresso` TIME NOT NULL, 
`OraUscita` TIME NOT NULL,
`Centro` VARCHAR(50) NOT NULL,
`Armadietto` VARCHAR(50) NOT NULL DEFAULT 'Nessun Armadietto',
`TotGiornaliero` INT(11),
PRIMARY KEY (`Cliente`,`Data`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Corsi --

DROP TABLE IF EXISTS `Corsi`; 
CREATE TABLE `Corsi` ( 
`CodCorso` VARCHAR(50) NOT NULL, 
`Nome` VARCHAR(50) NOT NULL, 
`DataInizio` DATE NOT NULL, 
`DataFine` DATE NOT NULL,
`Livello` VARCHAR(50) NOT NULL,
`MaxPartecipanti` INT(11) NOT NULL,
`Sala` VARCHAR(50) NOT NULL,
PRIMARY KEY (`CodCorso`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella CalendarioCorsi --

DROP TABLE IF EXISTS `CalendarioCorsi`; 
CREATE TABLE `CalendarioCorsi` ( 
`CodCorso` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`OraInizio` TIME NOT NULL, 
`OraFine` TIME NOT NULL,
PRIMARY KEY (`CodCorso`,`Giorno`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella IscrizioneCorso --

DROP TABLE IF EXISTS `IscrizioneCorso`; 
CREATE TABLE `IscrizioneCorso` ( 
`Corso` VARCHAR(50) NOT NULL, 
`Cliente` VARCHAR(50) NOT NULL, 
PRIMARY KEY (`Corso`,`Cliente`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella IstruttoreCorsi --

DROP TABLE IF EXISTS `IstruttoreCorsi`; 
CREATE TABLE `IstruttoreCorsi` ( 
`Istruttore` VARCHAR(50) NOT NULL, 
`Corso` VARCHAR(50) NOT NULL, 
PRIMARY KEY (`Istruttore`,`Corso`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Turnazione --

DROP TABLE IF EXISTS `Turnazione`; 
CREATE TABLE `Turnazione` ( 
`Dipendente` VARCHAR(50) NOT NULL, 
`Centro` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`InizioTurno` TIME NOT NULL,
`FineTurno` TIME NOT NULL,
PRIMARY KEY (`Dipendente`,`Centro`,`Giorno`,`InizioTurno`,`FineTurno`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella Monitoraggio --

DROP TABLE IF EXISTS `Monitoraggio`; 
CREATE TABLE `Monitoraggio` ( 
`SchedaAllenamento` VARCHAR(50) NOT NULL, 
`Esercizio` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`IstanteInizio` TIME NOT NULL,
`IstanteFine` TIME NOT NULL,
`NumSerie` INT(11) NOT NULL,
`NumRipetizioni` INT(11) NOT NULL,
`Recupero` INT(11) NOT NULL,
`Voto` INT(11) NOT NULL,
PRIMARY KEY (`Esercizio`,`Giorno`,`SchedaAllenamento`, `IstanteInizio`, `IstanteFine`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Tabella ConfigurazioniEffettive --

DROP TABLE IF EXISTS `ConfigurazioniEffettive`; 
CREATE TABLE `ConfigurazioniEffettive` ( 
`CodTabella` VARCHAR(50) NOT NULL, 
`Esercizio` VARCHAR(50) NOT NULL, 
`Giorno` VARCHAR(50) NOT NULL, 
`Macchinario` VARCHAR(50),
`Velocita` INT(11),
`Peso` INT(11),
`Inclinazione` INT(11),
PRIMARY KEY (`Esercizio`,`CodTabella`,`Giorno`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

-- Creazione tabella Integratori --

DROP TABLE IF EXISTS `Integratori`;
CREATE TABLE `Integratori`(
`Nome` VARCHAR(50) NOT NULL,
`Formato` VARCHAR(50) NOT NULL,
`NumPezzi` INT(11) NOT NULL,
`PrincipioAttivo` VARCHAR(50) NOT NULL,
`QuantitaSostanza` INT(11) NOT NULL,
`DurScadenza` INT(11) NOT NULL,
PRIMARY KEY(`Nome`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creazione tabella Fornitore --

DROP TABLE IF EXISTS `Fornitore`;
CREATE TABLE `Fornitore`(
`CodFornitore` VARCHAR(50) NOT NULL,
`Nome` VARCHAR(50) NOT NULL,
`Indirizzo` VARCHAR(50) NOT NULL,
`NumTelefonico` VARCHAR(50) NOT NULL,
`FormaSocietaria` VARCHAR(50) not null,
`PartitaIva` INT NOT NULL,
PRIMARY KEY(`CodFornitore`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creazione tabella OrdiniFornitore --

DROP TABLE IF EXISTS `OrdiniFornitore`;
CREATE TABLE `OrdiniFornitore`(
`CodOrdine` VARCHAR(50) NOT NULL,
`DataRichiesta` DATE NOT NULL,
`DataEvasione` DATE,
`StatoSpedizione` VARCHAR(50) NOT NULL,
`Fornitore` VARCHAR(50) NOT NULL,
`StatoOrdine` VARCHAR(50) NOT NULL,
`Centro` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CodOrdine`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella OrdiniCliente --

DROP TABLE IF EXISTS `OrdiniCliente`;
CREATE TABLE `OrdiniCliente`(
`CodOrdine` VARCHAR(50) NOT NULL,
`Magazzino` VARCHAR(50) NOT NULL,
`DataOrdine` DATE NOT NULL,
`DataAcquisto` DATE NOT NULL,
`Cliente` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CodOrdine`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Magazzino --

DROP TABLE IF EXISTS `Magazzino`;
CREATE TABLE `Magazzino`(
`CodMagazzino` VARCHAR(50) NOT NULL,
`Capacita` INT(11) NOT NULL,
`Dimensione` INT(11) NOT NULL,
`Centro` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CodMagazzino`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella VenditaIntegratori --

DROP TABLE IF EXISTS `VenditaIntegratori`;
CREATE TABLE `VenditaIntegratori`(
`Fornitore` VARCHAR(50) NOT NULL,
`Integratore` VARCHAR(50) NOT NULL,
`Prezzo` INT(11) NOT NULL,
PRIMARY KEY(`Fornitore`, `Integratore`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella DettagliOrdineC --

DROP TABLE IF EXISTS `DettagliOrdineC`;
CREATE TABLE `DettagliOrdineC`(
`Ordine` VARCHAR(50) NOT NULL,
`Integratore` VARCHAR(50) NOT NULL,
`Quantita` INT(11) NOT NULL,
PRIMARY KEY(`Ordine`, `Integratore`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella DettagliOrdineF --

DROP TABLE IF EXISTS `DettagliOrdineF`;
CREATE TABLE `DettagliOrdineF`(
`Ordine` VARCHAR(50) NOT NULL,
`Integratore` VARCHAR(50) NOT NULL,
`Quantita` INT(11) NOT NULL,
PRIMARY KEY(`Ordine`, `Integratore`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Creazione tabella DettagliMagazzino --

DROP TABLE IF EXISTS `DettagliMagazzino`;
CREATE TABLE `DettagliMagazzino`(
`Magazzino` VARCHAR(50) NOT NULL,
`Integratore` VARCHAR(50) NOT NULL,
`Quantita` INT(11) NOT NULL,
`Prezzo` INT(11) NOT NULL,
`DataScadenza` DATE NOT NULL,
`Scontato` VARCHAR(50) DEFAULT 'NO',
PRIMARY KEY(`Magazzino`, `Integratore`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Utenti --

DROP TABLE IF EXISTS `Utenti`;
CREATE TABLE `Utenti`(
`Username` VARCHAR(50) NOT NULL,
`NumCommenti` INT(11) NOT NULL DEFAULT 0,
`LvCredibilita` INT(11) NOT NULL DEFAULT 0,
`Password` VARCHAR(50) NOT NULL,
`Cliente` VARCHAR(50) NOT NULL,
PRIMARY KEY(`Username`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Post --

DROP TABLE IF EXISTS `Post`;
CREATE TABLE `Post`(
`CodPost` VARCHAR(50) NOT NULL,
`Thread` VARCHAR(50) NOT NULL,
`CampoTestuale` VARCHAR(255) NOT NULL,
`Utente` VARCHAR(50) NOT NULL,
`Data` DATE NOT NULL,
`Ora` TIME NOT NULL,
PRIMARY KEY(`CodPost`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Commenti --

DROP TABLE IF EXISTS `Commenti`;
CREATE TABLE `Commenti`(
`CodCommento` VARCHAR(50) NOT NULL,
`Giudizio` INT(11) NOT NULL,
`CampoTestuale` VARCHAR(255),
`Utente` VARCHAR(50) NOT NULL,
`Data` DATE NOT NULL,
`Ora` TIME NOT NULL,
`Post` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CodCommento`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Media --

DROP TABLE IF EXISTS `Media`;
CREATE TABLE `Media`(
`Link` VARCHAR(50) NOT NULL,
`Post` VARCHAR(50) NOT NULL,
PRIMARY KEY(`Link`, `Post`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Interessi --

DROP TABLE IF EXISTS `Interessi`;
CREATE TABLE `Interessi`(
`CodInteresse` VARCHAR(50) NOT NULL,
`Nome` VARCHAR(50) NOT NULL,
`Utente` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CodInteresse`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Cerchia --

DROP TABLE IF EXISTS `Cerchia`;
CREATE TABLE `Cerchia`(
`CodCerchia` VARCHAR(50) not null,
`Nome` VARCHAR(50) not null,
PRIMARY KEY(`CodCerchia`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella DettagliCerchia --

DROP TABLE IF EXISTS `DettagliCerchia`;
CREATE TABLE `DettagliCerchia`(
`Cerchia` VARCHAR(50) NOT NULL,
`Interesse` VARCHAR(50) NOT NULL,
PRIMARY KEY(`Cerchia`,`Interesse`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella UtentiCerchia --

DROP TABLE IF EXISTS `UtentiCerchia`;
CREATE TABLE `UtentiCerchia`(
`Cerchia` VARCHAR(50) NOT NULL,
`Utente` VARCHAR(50) NOT NULL,
PRIMARY KEY(`Cerchia`,`Utente`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Amicizie --

DROP TABLE IF EXISTS `Amicizie`;
CREATE TABLE `Amicizie`(
`UtenteRichiedente` VARCHAR(50) NOT NULL,
`UtenteRicevente` VARCHAR(50) NOT NULL,
`DataRichiesta` DATE NOT NULL,
`Stato` VARCHAR(50) NOT NULL,
PRIMARY KEY(`UtenteRichiedente`,`UtenteRicevente`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella PartecipantiSfida --

DROP TABLE IF EXISTS `PartecipantiSfida`;
CREATE TABLE `PartecipantiSfida`(
`Sfida` VARCHAR(50) NOT NULL,
`Utente` VARCHAR(50) NOT NULL,
`TotPsicofisico` INT NOT NULL DEFAULT 0,
`DataIscrizione` DATE NOT NULL,
PRIMARY KEY(`Sfida`,`Utente`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella Sfide --

DROP TABLE IF EXISTS `Sfide`;
CREATE TABLE `Sfide`(
`CodSfida` VARCHAR(50) NOT NULL,
`Scopo` VARCHAR(50) NOT NULL,
`DataInizio` DATE NOT NULL,
`DataFine` DATE NOT NULL,
`Vincitore` VARCHAR(50),
`SchedaAllenamento` VARCHAR(50),
`SchedaAlimentazione` VARCHAR(50),
PRIMARY KEY(`CodSfida`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella AllenamentoCustom --

DROP TABLE IF EXISTS `AllenamentoCustom`;
CREATE TABLE `AllenamentoCustom`(
`CodTabella` VARCHAR(50) NOT NULL,
`Partecipante` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CodTabella`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella AlimentazioneCustom --

DROP TABLE IF EXISTS `AlimentazioneCustom`;
CREATE TABLE `AlimentazioneCustom`(
`CodScheda` VARCHAR(50) NOT NULL,
`Partecipante` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CodScheda`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella CalendarioDietaC --

DROP TABLE IF EXISTS `CalendarioDietaC`;
CREATE TABLE `CalendarioDietaC`(
`SchedaAlimentazione` VARCHAR(50) NOT NULL,
`Giorno` VARCHAR(50) NOT NULL,
`NumPasti` INT(11) NOT NULL,
PRIMARY KEY(`SchedaAlimentazione`, `Giorno`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella PastiCustom --

DROP TABLE IF EXISTS `PastiCustom`;
CREATE TABLE `PastiCustom`(
`CodPasto` VARCHAR(50) NOT NULL,
`ApportoCalorico` INT(11) NOT NULL,
`InfoPasto` VARCHAR(255) NOT NULL,
PRIMARY KEY(`CodPasto`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella ParametriPsicofisici --

DROP TABLE IF EXISTS `ParametriPsicofisici`;
CREATE TABLE `ParametriPsicofisici`(
`Utente` VARCHAR(50) NOT NULL,
`Sfida` VARCHAR(50) NOT NULL,
`Data` DATE NOT NULL,
`Motivazione` INT(11) NOT NULL,
`Fatica` INT(11) NOT NULL,
`Stress` INT(11) NOT NULL,
PRIMARY KEY(`Utente`,`Sfida`,`Data`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Tabella DettagliDietaCustom --

DROP TABLE IF EXISTS `DettagliDietaCustom`;
CREATE TABLE `DettagliDietaCustom`(
`Pasto` VARCHAR(50) NOT NULL,
`SchedaAlimentazione` VARCHAR(50) NOT NULL,
`Giorno` VARCHAR(50) NOT NULL,
`ParteGiorno` VARCHAR(50) NOT NULL,
PRIMARY KEY(`Giorno`, `SchedaAlimentazione`, `Pasto`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TRIGGER IF EXISTS Partecipanti_Corso -- Gestione MaxPartecipanti ad un corso

DELIMITER $$

CREATE TRIGGER Partecipanti_Corso
BEFORE INSERT ON IscrizioneCorso
FOR EACH ROW
BEGIN 

DECLARE _partecipanti INT DEFAULT 0;
DECLARE _maxpartecipanti INT DEFAULT 0;

SELECT COUNT(DISTINCT Cliente) INTO _partecipanti
FROM IscrizioneCorso
WHERE Corso = NEW.Corso;

SELECT MaxPartecipanti INTO _maxpartecipanti
FROM Corsi
WHERE CodCorso = NEW.Corso;

SET _partecipanti = _partecipanti + 1;

IF _maxpartecipanti < _partecipanti THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Errore, il corso ha raggiunto il massimo numero di partecipanti';
END IF;

END $$

DELIMITER ;

DROP TRIGGER IF EXISTS OttoOre; -- Gestione errori turnazione con più di 8 ore
DELIMITER $$
CREATE TRIGGER OttoOre
BEFORE INSERT ON Turnazione
FOR EACH ROW
BEGIN

DECLARE nessun_turno INT DEFAULT 0;
DECLARE somma_ore INT DEFAULT 0;
DECLARE orario_inizio INT DEFAULT 0;
DECLARE ora_inizio INT DEFAULT 0;
DECLARE ora_fine INT DEFAULT 0;
DECLARE orario_fine INT DEFAULT 0;
DECLARE finito INT DEFAULT 0;

DECLARE cursore_ingresso CURSOR FOR
	SELECT time_format(InizioTurno,'%H'),time_format(FineTurno,'%H')
    FROM Turnazione
    WHERE Dipendente = NEW.Dipendente
    AND Giorno= NEW.Giorno;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito=1;

SELECT time_format(NEW.InizioTurno,'%H') INTO ora_inizio;
SELECT time_format(NEW.FineTurno,'%H') INTO ora_fine;

SET somma_ore = (ora_fine) - (ora_inizio);

IF somma_ore > 8 THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Errore, le ore di lavoro superano le 8 ore';
END IF;

SELECT COUNT(*) INTO nessun_turno
FROM Turnazione
WHERE Dipendente = NEW.Dipendente
AND Giorno = NEW.Giorno;

IF nessun_turno > 0 THEN 

OPEN cursore_ingresso; 

scan: LOOP
FETCH cursore_ingresso INTO orario_inizio,orario_fine;
IF finito = 1 THEN
	LEAVE scan;
END IF;
IF  (orario_inizio < ora_inizio AND orario_fine <= ora_inizio) THEN -- Caso non sovrapposti
SET somma_ore = somma_ore + ((orario_fine)-(orario_inizio));
END IF;
IF  (orario_inizio >= ora_fine AND orario_fine > ora_fine) THEN -- Caso non sovrapposti
SET somma_ore = somma_ore + ((orario_fine)-(orario_inizio));
END IF;
IF  (orario_inizio < ora_inizio AND orario_fine <= ora_fine AND orario_fine > ora_inizio) THEN -- Caso sovrapposti sporge a sx
SET somma_ore = somma_ore + ((ora_inizio)-(orario_inizio));
END IF;
IF  (orario_inizio >= ora_inizio AND orario_inizio < ora_fine AND orario_fine > ora_fine) THEN -- Caso sovrapposti sporge a dx
SET somma_ore = somma_ore + ((orario_fine)-(ora_fine));
END IF;
IF  (orario_inizio < ora_inizio AND orario_fine > ora_fine) THEN -- Caso sovrapposti sia a sx sia a dx
SET somma_ore = somma_ore + ((ora_inizio)-(orario_inizio)) + ((orario_fine)-(ora_fine));
END IF;
END LOOP;

CLOSE cursore_ingresso;

IF somma_ore > 8 THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Errore, le ore di lavoro superano le 8 ore';
END IF;

END IF;

END $$
DELIMITER ;

-- Un nutrizionista non può effettuare una visita per una tabella dieta da lui non assegnata

DROP TRIGGER IF EXISTS ControlloNutrizionista;
DELIMITER $$
CREATE TRIGGER ControlloNutrizionista
BEFORE INSERT ON VisitaDieta
FOR EACH ROW
BEGIN

DECLARE _visite_prec INT DEFAULT 0;
DECLARE _nutrizionista VARCHAR(50) DEFAULT '';

SELECT COUNT(*) INTO _visite_prec
FROM VisitaDieta VD
WHERE VD.Cliente = NEW.Cliente
		and VD.SchedaAlimentazione = NEW.SchedaAlimentazione;
        
IF _visite_prec <> 0 THEN
	BEGIN
    
	SELECT DISTINCT VD1.Nutrizionista INTO _nutrizionista
    FROM VisitaDieta VD1
    WHERE VD1.SchedaAlimentazione = NEW.SchedaAlimentazione;
    
    IF NEW.Nutrizionista <> _nutrizionista THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Visita non inserita, il Nutrizionista selezionato non può modificare la TabDieta';
	END IF;
    
    END;
    
END IF;
    


END $$
DELIMITER ;

DROP TRIGGER IF EXISTS TriggerUsura;  -- Aumenta del 5% l'usura di un macchinario se utilizzato
DELIMITER $$					
CREATE TRIGGER TriggerUsura 
AFTER INSERT ON ConfigurazioniEffettive 
FOR EACH ROW
BEGIN 

DECLARE _usura INT DEFAULT 0;
DECLARE stringa VARCHAR(255) DEFAULT '';

UPDATE Apparecchiature
SET Usura = Usura + 5
WHERE CodAttrezzo = NEW.Macchinario;

SELECT AP.Usura INTO _usura
FROM Apparecchiature AP
WHERE AP.CodAttrezzo = NEW.Macchinario;

IF _usura >= 100 THEN 
BEGIN
	INSERT INTO Riparazione 
			( 	SELECT AP1.CodAttrezzo
				FROM Apparecchiature AP1
				WHERE AP1.CodAttrezzo = NEW.Macchinario
			);
END ;
END IF;

END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS SvuotaRiparazione; -- Procedure che svuota la tabella Riparazione
DELIMITER $$							
CREATE PROCEDURE SvuotaRiparazione()
BEGIN

DECLARE attrezzo_ VARCHAR(50) DEFAULT '';
DECLARE finito INT DEFAULT 0;

DECLARE cursore_riparazione CURSOR FOR
	SELECT CodAttrezzo
    FROM Riparazione;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito = 1;

OPEN cursore_riparazione;

scan: LOOP
FETCH cursore_riparazione INTO attrezzo_;
IF finito = 1 THEN 
	LEAVE scan;
END IF;

UPDATE Apparecchiature
SET Usura = 0
WHERE CodAttrezzo = attrezzo_;

END LOOP;
CLOSE cursore_riparazione;
TRUNCATE TABLE Riparazione;

END $$

DELIMITER ;

DROP EVENT IF EXISTS Svuota_Riparazioni; -- Evento che chiama la procedure ogni 2gg
DELIMITER $$
CREATE EVENT Svuota_Riparazioni
ON SCHEDULE EVERY 2 DAY DO
BEGIN

CALL SvuotaRiparazione();

END $$

DELIMITER ;

DROP TRIGGER IF EXISTS ControlloUsura; -- Vieta l'inserimento di una nuova configurazione se il macchinario è in riparazione

DELIMITER $$

CREATE TRIGGER ControlloUsura 
BEFORE INSERT ON configurazionieffettive
FOR EACH ROW
BEGIN

DECLARE usura_ INT DEFAULT 0;

SELECT AP.Usura INTO usura_
FROM Apparecchiature AP
WHERE AP.CodAttrezzo = NEW.Macchinario;

IF usura_ >= 100 THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Il macchinario è in riparazione'; -- Stampa un messaggio di errore
END IF;

END $$

DELIMITER ;

DROP TRIGGER IF EXISTS ControlloInserimentoCorso;
DELIMITER $$
CREATE TRIGGER ControlloInserimentoCorso
BEFORE INSERT ON CalendarioCorsi
FOR EACH ROW
BEGIN

SET @salacorso = (SELECT Sala -- ongi centro ha sale distinte in fatto di codice identificativo
				  FROM Corsi
				  WHERE CodCorso = NEW.CodCorso);

SET @centrofit = (select sa.Centro -- centro fitness
					from Corsi c inner join saleallenamento sa on c.sala = sa.codsala
					where c.codcorso = new.codcorso);
                  

	
 IF exists ( select*	-- impegnato altro corso
				from calendariocorsi cc NATURAL JOIN istruttorecorsi ic
                where cc.giorno = new.giorno
					and ic.istruttore in (select ic2.istruttore
												from istruttorecorsi ic2 
												where ic2.corso = new.codcorso)
				AND ( (NEW.orainizio BETWEEN cc.orainizio AND cc.orafine)
							OR
						  (NEW.orafine BETWEEN cc.orainizio AND cc.orafine)
                           OR
                           (NEW.orainizio <= cc.orainizio AND NEW.orafine >= cc.orafine)))

THEN 	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Istruttore impegnato in altro corso';
        
 elseif  exists ( select* -- lavora in altro centro
				from istruttorecorsi ic natural join turnazione t 
                where ic.istruttore in (select ic2.istruttore
												from istruttorecorsi ic2 
												where ic2.corso = new.codcorso)
				and t.giorno = new.giorno
                and ((new.orainizio between t.inizioturno and t.fineturno)
					or
                    (new.orafine between t.inizioturno and t.fineturno)
                    or
                    (new.orainizio <= t.InizioTurno and new.orafine >= t.FineTurno))
                and t.centro <> @centrofit)  -- lavora tutto il giorno in unaltro centro
                
					

THEN 	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Istruttore impegnato in altro centro';
        
ELSEIF EXISTS ( SELECT * 
			FROM calendariocorsi cc NATURAL JOIN corsi c
            WHERE cc.giorno = NEW.giorno
				AND c.sala = @salacorso
					AND ( (NEW.orainizio BETWEEN cc.orainizio AND cc.orafine)
							OR
						  (NEW.orafine BETWEEN cc.orainizio AND cc.orafine)
                           OR
                           (NEW.orainizio <= cc.orainizio AND NEW.orafine >= cc.orafine)))
THEN 	SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Sala occupata da un altro corso';

end if;


END $$
DELIMITER ;


DROP TRIGGER IF EXISTS Stato_Peso;

DELIMITER $$

CREATE TRIGGER Stato_Peso
BEFORE INSERT ON SchedaBase
FOR EACH ROW 
BEGIN

DECLARE _imc INT DEFAULT 0;
DECLARE _peso INT DEFAULT 0;
DECLARE _altezza INT DEFAULT 0;

SELECT NEW.Peso INTO _peso;

SELECT NEW.Altezza INTO _altezza;

SET _altezza = _altezza/100; 
SET _altezza = (_altezza)*(_altezza);
SET _imc = (_peso)/(_altezza);

IF _imc > 30 THEN

SET NEW.StatoPeso = 'Obeso';

END IF;

IF _imc BETWEEN 25 AND 29.99 THEN

SET NEW.StatoPeso = 'Sovrappeso';

END IF;

IF _imc BETWEEN 18.50 AND 24.99 THEN

SET NEW.StatoPeso = 'Regolare';

END IF;

IF _imc BETWEEN 17.50 AND 18.49 THEN

SET NEW.StatoPeso = 'Leggermente Sottopeso';

END IF;

IF _imc < 17.50 THEN

SET NEW.StatoPeso = 'Leggermente Sottopeso';

END IF;

END $$

DELIMITER ;

DROP TRIGGER IF EXISTS Partecipanti_Sfide; -- Controlla che non si iscrivano dopo la fine della sfida
DELIMITER $$
CREATE TRIGGER Partecipanti_Sfide
BEFORE INSERT ON PartecipantiSfida
FOR EACH ROW
BEGIN

DECLARE _datalimite DATE;
DECLARE giapresente INT DEFAULT 0;

SELECT DataFine INTO _datalimite
FROM Sfide
WHERE CodSfida = NEW.Sfida;

IF NEW.DataIscrizione > _datalimite THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La sfida è terminata, non è possibile iscriversi';
END IF;

END $$
DELIMITER ;

DROP TRIGGER IF EXISTS Tot_Psicofisico
DELIMITER $$
CREATE TRIGGER Tot_Psicofisico
AFTER INSERT ON ParametriPsicofisici
FOR EACH ROW
BEGIN

DECLARE _punteggiosessionetot INT DEFAULT 0;
DECLARE _quanti INT DEFAULT 0;
DECLARE _sommamotivazione INT DEFAULT 0;
DECLARE _sommafatica INT DEFAULT 0;
DECLARE _sommastress INT DEFAULT 0;

SELECT SUM(Motivazione) INTO _sommamotivazione
FROM ParametriPsicofisici
WHERE Utente = NEW.Utente
AND Sfida = NEW.Sfida;

SELECT SUM(Stress) INTO _sommastress
FROM ParametriPsicofisici
WHERE Utente = NEW.Utente
AND Sfida = NEW.Sfida;

SELECT SUM(Fatica) INTO _sommafatica
FROM ParametriPsicofisici
WHERE Utente = NEW.Utente
AND Sfida = NEW.Sfida;

SELECT COUNT(*) INTO _quanti
FROM ParametriPsicofisici
WHERE Utente = NEW.Utente
	AND Sfida = NEW.Sfida;
    
SET _quanti = _quanti + 1;
SET _sommamotivazione = _sommamotivazione + NEW.Motivazione;
SET _sommastress = _sommastress + NEW.Stress;
SET _sommafatica = _sommafatica + NEW.Fatica;

SET _punteggiosessionetot = (15*_quanti) + _sommamotivazione - _sommafatica - ( _sommastress/2);

UPDATE PartecipantiSfida
SET TotPsicofisico = (_punteggiosessionetot)/(_quanti)
WHERE Utente = NEW.Utente
	AND Sfida = NEW.Sfida;

END $$
DELIMITER ;

DROP TRIGGER IF EXISTS Imposta_NumCommenti;
DELIMITER $$
CREATE TRIGGER Imposta_NumCommenti
AFTER INSERT ON Commenti 
FOR EACH ROW
BEGIN 

DECLARE _utente VARCHAR(50) DEFAULT '';

SELECT Utente INTO _utente
FROM Post
WHERE CodPost = NEW.Post;

IF _utente <> NEW.Utente THEN

UPDATE Utenti
SET NumCommenti = NumCommenti + 1
WHERE Username = NEW.Utente;

END IF;


END $$
DELIMITER ;

DROP TRIGGER IF EXISTS Livello_credibilita; -- Aggiorna il LvCredibilità
DELIMITER $$
CREATE TRIGGER Livello_credibilita
AFTER INSERT ON Commenti 
FOR EACH ROW
BEGIN

DECLARE _utente VARCHAR(50) DEFAULT '';
DECLARE _sommagiudizi INT DEFAULT 0;
DECLARE numero_post INT DEFAULT 0;
DECLARE numero_commenti INT DEFAULT 0;
DECLARE lv_credibilita INT DEFAULT 0;


SELECT DISTINCT(P.Utente) INTO _utente
FROM Commenti C INNER JOIN Post P ON C.Post=P.CodPost
WHERE P.CodPost = NEW.Post;

SELECT SUM(C1.Giudizio) INTO _sommagiudizi
FROM Commenti C1 INNER JOIN Post P1 ON C1.Post=P1.CodPost
WHERE P1.Utente = _utente 
	AND C1.Utente <> _utente;

SELECT COUNT(*) INTO numero_post
FROM Post P
WHERE P.Utente = _utente;

SELECT COUNT(*) INTO numero_commenti
FROM Commenti C1 INNER JOIN Post P1 ON C1.Post=P1.CodPost
WHERE P1.Utente = _utente 
	AND C1.Utente <> _utente;
    
SET lv_credibilita = 100*((_sommagiudizi * numero_post * 2)/(numero_commenti * numero_commenti));

UPDATE Utenti
SET LvCredibilita = lv_credibilita
WHERE Username = _utente;

END $$
DELIMITER ;

DROP TRIGGER IF EXISTS AggiortaTotAttrezzi; -- Ridondanza operazione 8
DELIMITER $$
CREATE TRIGGER AggiortaTotAttrezzi
AFTER INSERT ON Apparecchiature
FOR EACH ROW
BEGIN

UPDATE SaleAllenamento Sa
SET Sa.totattrezzi = sa.totattrezzi + 1
WHERE Sa.codSala = new.sala;


END $$

DELIMITER ;

DROP TRIGGER IF EXISTS ApportoCalorico; -- Imposta la ridondanza per l'operazione 7
DELIMITER $$
CREATE TRIGGER ApportoCalorico
AFTER INSERT ON ComposizioneDieta
FOR EACH ROW
BEGIN

DECLARE _appcalorico INT DEFAULT 0;

SELECT AVG(p.apportocalorico) INTO _appcalorico
FROM ComposizioneDieta cd inner join pasto p on p.codpasto = cd.pasto
WHERE cd.schedaalimentazione = NEW.schedaalimentazione;

UPDATE SchedaAlimentazione sa
SET sa.apportogiornaliero = _appcalorico
WHERE sa.codscheda = new.schedaalimentazione;



END $$
DELIMITER ;

DROP TRIGGER IF EXISTS Aggiorna_Magazzino; -- Aggiorna la quantità del magazzino ogni volta che viene fatto un ordine
DELIMITER $$
CREATE TRIGGER Aggiorna_Magazzino
AFTER INSERT ON DettagliOrdineC
FOR EACH ROW
BEGIN 

DECLARE _magazzino VARCHAR(50) DEFAULT '';
DECLARE _quanti INT DEFAULT 0;

SELECT Magazzino INTO _magazzino
FROM OrdiniCliente
WHERE CodOrdine = NEW.Ordine;

SELECT Quantita INTO _quanti
FROM DettagliMagazzino
WHERE Integratore = NEW.Integratore
	AND Magazzino = _magazzino;
    
IF _quanti < NEW.Quantita THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Non ci sono abbastanza scatole nel magazzino';

END IF;

UPDATE DettagliMagazzino
SET Quantita = Quantita - NEW.Quantita
WHERE Integratore = NEW.Integratore
AND Magazzino = _magazzino;

SET _quanti = (
				SELECT Quantita
                FROM DettagliMagazzino
                WHERE Integratore = NEW.Integratore
					AND Magazzino = _magazzino
			  );
              
IF _quanti = 0 THEN 

DELETE FROM DettagliMagazzino
WHERE Integratore = NEW.Integratore
	AND Magazzino = _magazzino;

END IF;

END $$

DELIMITER ;

DROP TRIGGER IF EXISTS Controllo_Acquisti_Fornitore; -- CONTROLLO INTEGRATORE GIA PRESENTE O ORDINE EVASO
DELIMITER $$

CREATE TRIGGER Controllo_Acquisti_Fornitore
BEFORE INSERT ON DettagliOrdineF
FOR EACH ROW
BEGIN

DECLARE _stato VARCHAR(50) DEFAULT '';
DECLARE _centro VARCHAR(50) DEFAULT '';
DECLARE _magazzino VARCHAR(50) DEFAULT '';

SELECT Centro INTO _centro
FROM OrdiniFornitore
WHERE CodOrdine = NEW.Ordine;

SELECT CodMagazzino INTO _magazzino
FROM Magazzino 
WHERE Centro = _centro;

SELECT StatoOrdine INTO _stato
FROM OrdiniFornitore
WHERE CodOrdine = NEW.Ordine;

IF _stato = 'Evaso' THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Impossibile modificare il seguente ordine';
END IF;

IF _stato = 'Incompleto' THEN

	IF EXISTS ( 
				SELECT *
                FROM DettagliMagazzino
                WHERE Magazzino = _magazzino
					AND Integratore = NEW.Integratore
			  ) 
              
				THEN
                
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Integratore già presente!';
	END IF;

END IF;


END $$
DELIMITER ;
-- -------------- --
-- CHIAVI ESTERNE --
-- -------------- --

ALTER TABLE `SaleAllenamento` 
ADD FOREIGN KEY(`Centro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE CASCADE ON UPDATE RESTRICT, 
ADD FOREIGN KEY(`Responsabile`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE RESTRICT; 

ALTER TABLE `GiorniApertura` 
ADD FOREIGN KEY(`CodCentro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Apparecchiature` 
ADD FOREIGN KEY(`Sala`) REFERENCES `SaleAllenamento`(`CodSala`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Piscine` 
ADD FOREIGN KEY(`Responsabile`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Centro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `Dipendente` 
ADD FOREIGN KEY(`Supervisore`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SchedaBase` 
ADD FOREIGN KEY(`CodCliente`) REFERENCES `Cliente`(`CodFiscale`) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Medico`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE RESTRICT ON UPDATE CASCADE; 

ALTER TABLE `Contratto` 
ADD FOREIGN KEY(`Cliente`) REFERENCES `Cliente`(`CodFiscale`)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`Consulente`) REFERENCES `Dipendente`(`CodFiscale`)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Personalizzato` 
ADD FOREIGN KEY(`CodContratto`) REFERENCES `Contratto`(`CodContratto`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Rate` 
ADD FOREIGN KEY(`CodContratto`) REFERENCES `Contratto`(`CodContratto`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Muscoli` 
ADD FOREIGN KEY(`Contratto`) REFERENCES `Contratto`(`CodContratto`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `SediAccessibili` 
ADD FOREIGN KEY(`CodCentro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`CodContratto`) REFERENCES `Contratto`(`CodContratto`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `TabellaEsercizi` 
ADD FOREIGN KEY(`Tutor`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Cliente`) REFERENCES `Cliente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `Configurazione` 
ADD FOREIGN KEY(`CodTabella`) REFERENCES `TabellaEsercizi`(`CodTabella`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`CodTabella`) REFERENCES `AllenamentoCustom`(`CodTabella`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`CodEsercizio`) REFERENCES `Esercizio`(`CodEsercizio`) 
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`Macchinario`) REFERENCES `Apparecchiature`(`CodAttrezzo`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `CalendarioDieta` 
ADD FOREIGN KEY(`CodScheda`) REFERENCES `SchedaAlimentazione`(`CodScheda`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `VisitaDieta` 
ADD FOREIGN KEY(`Nutrizionista`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Cliente`) REFERENCES `Cliente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`SchedaAlimentazione`) REFERENCES `SchedaAlimentazione`(`CodScheda`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `ComposizioneDieta` 
ADD FOREIGN KEY(`Pasto`) REFERENCES `Pasto`(`CodPasto`) 
ON DELETE CASCADE ON UPDATE NO ACTION, 
ADD FOREIGN KEY(`SchedaAlimentazione`) REFERENCES `CalendarioDieta`(`CodScheda`) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Armadietto` 
ADD FOREIGN KEY(`Spogliatoio`) REFERENCES `Spogliatoi`(`CodSpogliatoio`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Spogliatoi` 
ADD FOREIGN KEY(`Centro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `AccessoCliente` 
ADD FOREIGN KEY(`Cliente`) REFERENCES `Cliente`(`CodFiscale`) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Centro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Armadietto`) REFERENCES `Armadietto`(`CodArmadietto`) 
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `Corsi` 
ADD FOREIGN KEY(`Sala`) REFERENCES `SaleAllenamento`(`CodSala`) 
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `CalendarioCorsi` 
ADD FOREIGN KEY(`CodCorso`) REFERENCES `Corsi`(`CodCorso`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `IscrizioneCorso` 
ADD FOREIGN KEY(`Corso`) REFERENCES `Corsi`(`CodCorso`) 
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`Cliente`) REFERENCES `Cliente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `IstruttoreCorsi` 
ADD FOREIGN KEY(`Corso`) REFERENCES `Corsi`(`CodCorso`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Istruttore`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE RESTRICT ON UPDATE CASCADE; 

ALTER TABLE `Turnazione` 
ADD FOREIGN KEY(`Dipendente`) REFERENCES `Dipendente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Centro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE `Monitoraggio` 
ADD FOREIGN KEY(`Esercizio`) REFERENCES `Configurazione`(`CodEsercizio`) 
ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD FOREIGN KEY(`SchedaAllenamento`) REFERENCES `Configurazione`(`CodTabella`) 
ON DELETE CASCADE ON UPDATE NO ACTION;


ALTER TABLE `ConfigurazioniEffettive` 
ADD FOREIGN KEY(`Esercizio`) REFERENCES `Monitoraggio`(`Esercizio`) 
ON DELETE CASCADE ON UPDATE NO ACTION, 
ADD FOREIGN KEY(`CodTabella`) REFERENCES `Monitoraggio`(`SchedaAllenamento`) 
ON DELETE CASCADE ON UPDATE NO ACTION,
ADD FOREIGN KEY(`Macchinario`) REFERENCES `Apparecchiature`(`CodAttrezzo`) 
ON DELETE CASCADE ON UPDATE NO ACTION; 

ALTER TABLE `OrdiniFornitore` 
ADD FOREIGN KEY(`Fornitore`) REFERENCES `Fornitore`(`CoDFornitore`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Centro`) REFERENCES `CentroFitness`(`CoDCentro`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `Magazzino` 
ADD FOREIGN KEY(`Centro`) REFERENCES `CentroFitness`(`CodCentro`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `OrdiniCliente` 
ADD FOREIGN KEY(`Magazzino`) REFERENCES `Magazzino`(`CodMagazzino`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Cliente`) REFERENCES `Cliente`(`CodFiscale`) 
ON DELETE RESTRICT ON UPDATE CASCADE; 

ALTER TABLE `VenditaIntegratori` 
ADD FOREIGN KEY(`Fornitore`) REFERENCES `Fornitore`(`CodFornitore`) 
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`Integratore`) REFERENCES `Integratori`(`Nome`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DettagliOrdineF` 
ADD FOREIGN KEY(`Ordine`) REFERENCES `OrdiniFornitore`(`CodOrdine`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Integratore`) REFERENCES `Integratori`(`Nome`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DettagliOrdineC` 
ADD FOREIGN KEY(`Ordine`) REFERENCES `OrdiniCliente`(`CodOrdine`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Integratore`) REFERENCES `Integratori`(`Nome`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DettagliMagazzino` 
ADD FOREIGN KEY(`Magazzino`) REFERENCES `Magazzino`(`CodMagazzino`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Integratore`) REFERENCES `Integratori`(`Nome`) 
ON DELETE CASCADE ON UPDATE CASCADE; 
-- 
ALTER TABLE `Utenti` 
ADD FOREIGN KEY(`Cliente`) REFERENCES `Cliente`(`CodFiscale`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Post` 
ADD FOREIGN KEY(`Utente`) REFERENCES `Utenti`(`Username`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Commenti` 
ADD FOREIGN KEY(`Utente`) REFERENCES `Utenti`(`Username`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Post`) REFERENCES `Post`(`CodPost`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `Media` 
ADD FOREIGN KEY(`Post`) REFERENCES `Post`(`CodPost`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Interessi` 
ADD FOREIGN KEY(`Utente`) REFERENCES `Utenti`(`Username`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DettagliCerchia` 
ADD FOREIGN KEY(`Cerchia`) REFERENCES `Cerchia`(`CodCerchia`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Interesse`) REFERENCES `Interessi`(`CodInteresse`) 
ON DELETE RESTRICT ON UPDATE CASCADE; 

ALTER TABLE `UtentiCerchia` 
ADD FOREIGN KEY(`Cerchia`) REFERENCES `Cerchia`(`CodCerchia`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Utente`) REFERENCES `Utenti`(`Username`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `Amicizie` 
ADD FOREIGN KEY(`UtenteRichiedente`) REFERENCES `Utenti`(`Username`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`UtenteRicevente`) REFERENCES `Utenti`(`Username`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `PartecipantiSfida` 
ADD FOREIGN KEY(`Utente`) REFERENCES `Utenti`(`Username`) 
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`Sfida`) REFERENCES `Sfide`(`CodSfida`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Sfide` 
ADD FOREIGN KEY(`CodSfida`) REFERENCES `Post`(`CodPost`) 
ON DELETE CASCADE ON UPDATE CASCADE, 
ADD FOREIGN KEY(`Vincitore`) REFERENCES `PartecipantiSfida`(`Utente`) 
ON DELETE CASCADE ON UPDATE NO ACTION,
ADD FOREIGN KEY(`SchedaAllenamento`) REFERENCES `AllenamentoCustom`(`CodTabella`) 
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`SchedaAlimentazione`) REFERENCES `AlimentazioneCustom`(`CodScheda`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `AllenamentoCustom` 
ADD FOREIGN KEY(`Partecipante`) REFERENCES `PartecipantiSfida`(`Utente`) 
ON DELETE CASCADE ON UPDATE CASCADE; 

ALTER TABLE `AlimentazioneCustom` 
ADD FOREIGN KEY(`Partecipante`) REFERENCES `PartecipantiSfida`(`Utente`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `CalendarioDietaC` 
ADD FOREIGN KEY(`SchedaAlimentazione`) REFERENCES `AlimentazioneCustom`(`CodScheda`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ParametriPsicofisici` 
ADD FOREIGN KEY(`Utente`) REFERENCES `PartecipantiSfida`(`Utente`) 
ON DELETE NO ACTION ON UPDATE NO ACTION, 
ADD FOREIGN KEY(`Sfida`) REFERENCES `PartecipantiSfida`(`Sfida`) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `DettagliDietaCustom` 
ADD FOREIGN KEY(`SchedaAlimentazione`) REFERENCES `CalendarioDietaC`(`SchedaAlimentazione`) 
ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY(`Pasto`) REFERENCES `PastiCustom`(`CodPasto`) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `Riparazione`  -- Aggiunta per gestire l'usura
ADD FOREIGN KEY(`CodAttrezzo`) REFERENCES `Attrezzature`(`CodAttrezzo`) 
ON DELETE NO ACTION ON UPDATE NO ACTION; 

INSERT INTO CentroFitness VALUES
('0001','Via di Danzica 29, Livorno','20','3312969124','450'), -- Livorno
('0002','Via dei Pensieri 02, Livorno','250','3333171923','300'),
('0003','Via Italia 12, Livorno','300','3341827154','500'),
('0004','Via Molise 45, Livorno','150','3473514234','200'),
('0005','Via di Scandicci 155, Firenze','300','3357182345','450'), -- Firenze
('0006','Via Grande 92, Firenze','250','3313517285','350'),
('0007','Via della Salvezza, Firenze','200','3332881912','300'),
('0008','Via Provinciale 291, Firenze','300','3321875151','450'),
('0009','Via Firenze 40, Roma','500','3371828913','650'), -- Roma
('0010','Via di Betlemme 81, Roma','200','3312391224','450'),
('0011','Via Vespucci 97, Roma','250','3381929483','400'),
('0012','Via Montebello 182, Roma','350','3317273454','500'),
('0013','Via Pietruzzo 29, Empoli','200','3393818273','300'), -- Empoli
('0014','Via di Popogna 192, Empoli','250','3328193321','400'),
('0015','Via Pentolame 123, Ferrara','200','3372638492','450'); -- Ferrara

INSERT INTO GiorniApertura VALUES 
('0001','LUN','09:00:0000','20:00:00'),
('0001','MAR','09:00:0000','20:00:00'),
('0001','MER','09:00:0000','20:00:00'),
('0001','GIO','09:00:0000','20:00:00'),
('0001','VEN','09:00:0000','19:00:00'),
('0001','SAB','09:00:0000','13:00:00'), -- Centro 0001
('0005','LUN','09:00:0000','20:00:00'),
('0005','MAR','09:00:0000','20:00:00'),
('0005','MER','09:00:0000','20:00:00'),
('0005','GIO','09:00:0000','20:00:00'),
('0005','VEN','09:00:0000','19:00:00'),
('0005','SAB','09:00:0000','13:00:00'), -- Centro 0005
('0009','LUN','09:00:0000','20:00:00'),
('0009','MAR','09:00:0000','20:00:00'),
('0009','MER','09:00:0000','20:00:00'),
('0009','GIO','09:00:0000','20:00:00'),
('0009','VEN','09:00:0000','19:00:00'),
('0009','SAB','09:00:0000','13:00:00'), -- Centro 0009
('0013','LUN','09:00:0000','20:00:00'),
('0013','MAR','09:00:0000','20:00:00'),
('0013','MER','09:00:0000','20:00:00'),
('0013','GIO','09:00:0000','20:00:00'),
('0013','VEN','09:00:0000','19:00:00'),
('0013','SAB','09:00:0000','13:00:00'), -- Centro 0013
('0015','LUN','09:00:0000','20:00:00'),
('0015','MAR','09:00:0000','20:00:00'),
('0015','MER','09:00:0000','20:00:00'),
('0015','GIO','09:00:0000','20:00:00'),
('0015','VEN','09:00:0000','19:00:00'),
('0015','SAB','09:00:0000','13:00:00'); -- Centro 0015

INSERT INTO SaleAllenamento VALUES 
('s101','Pesi','Silver','0','0001','ddd5'),
('s102','Spinning','Silver','0','0001','ddd5'),
('s103','Cardio Fitness','Gold','0','0001','ddd1'),
('s104','Pesi','Gold','0','0001','ddd1'), 
('s201','Pesi','Platinum','0','0001','ddd1'),
('s202','CardioFitness','Silver','0','0001','ddd5'),
('s203','Spinning','Silver','0','0001','ddd5'), -- Centro 0001
('s204','Pesi','Silver','0','0005','ddd4'),
('s301','Pesi','Platinum','0','0005','ddd2'),
('s302','Spinning','Silver','0','0005','ddd4'),
('s303','Cardio Fitness','Gold','0','0005','ddd2'),
('s304','Pesi','Silver','0','0005','ddd2'),
('s401','Cardio Fitness','Silver','0','0005','ddd2'), -- Centro 0005
('s402','Spinning','Silver','0','0009','aaa4'),
('s403','Cardio Fitness','Gold','0','0009','aaa6'),
('s404','Pesi','Silver','0','0009','aaa6'),
('s501','Pesi','Gold','0','0009','aaa6'),
('s502','Spinnnig','Gold','0','0009','aaa4'),
('s503','Cardio Fitness','Silver','0','0009','aaa6'), -- Centro 0009
('s504','Pesi','Silver','0','0013','ddd3'),
('s601','Cardio Fitness','Gold','0','0013','ddd3'), -- Centro 0013
('s602','Spinning','Silver','0','0015','ccc2'),
('s603','Cardio Fitness','Gold','0','0015','ccc2'),
('s604','Pesi','Silver','0','0015','ccc2'); -- Centro 0015

INSERT INTO Apparecchiature VALUES 
('10201','Cyclette','10','250','s102'),
('10202','Cyclette','10','250','s102'),
('10203','Cyclette','10','250','s102'),
('10204','Cyclette','10','250','s102'),
('10205','Cyclette','10','250','s102'),
('10206','Cyclette','10','250','s102'),
('10207','Cyclette','10','250','s102'),
('10208','Cyclette','10','250','s102'),
('10209','Cyclette','10','250','s102'),
('10210','Cyclette','10','250','s102'),
('20301','Cyclette','10','400','s203'),
('20302','Cyclette','10','400','s203'),
('20303','Cyclette','10','400','s203'),
('20304','Cyclette','10','400','s203'),
('20305','Cyclette','10','400','s203'),
('20306','Cyclette','10','400','s203'),
('20307','Cyclette','10','400','s203'),
('20308','Cyclette','10','400','s203'),
('20309','Cyclette','10','400','s203'),
('20310','Cyclette','10','400','s203'),
('30201','Cyclette','10','200','s302'),
('30202','Cyclette','10','200','s302'),
('30203','Cyclette','10','200','s302'),
('30204','Cyclette','10','200','s302'),
('30205','Cyclette','10','200','s302'),
('30206','Cyclette','10','200','s302'),
('30207','Cyclette','10','200','s302'),
('30208','Cyclette','10','200','s302'),
('30209','Cyclette','10','200','s302'),
('30210','Cyclette','10','200','s302'),
('40201','Cyclette','10','200','s402'),
('40202','Cyclette','10','300','s402'),
('40203','Cyclette','10','300','s402'),
('40204','Cyclette','10','300','s402'),
('40205','Cyclette','10','300','s402'),
('40206','Cyclette','10','300','s402'),
('40207','Cyclette','10','300','s402'),
('40208','Cyclette','10','300','s402'),
('40209','Cyclette','10','300','s402'),
('40210','Cyclette','10','300','s402'),
('50201','Cyclette','10','350','s502'),
('50202','Cyclette','10','350','s502'),
('50203','Cyclette','10','350','s502'),
('50204','Cyclette','10','350','s502'),
('50205','Cyclette','10','350','s502'),
('50206','Cyclette','10','350','s502'),
('50207','Cyclette','10','350','s502'),
('50208','Cyclette','10','350','s502'),
('50209','Cyclette','10','350','s502'),
('50210','Cyclette','10','350','s502'),
('60201','Cyclette','10','200','s602'),
('60202','Cyclette','10','200','s602'),
('60203','Cyclette','10','200','s602'),
('60204','Cyclette','10','200','s602'),
('60205','Cyclette','10','200','s602'),
('60206','Cyclette','10','200','s602'),
('60207','Cyclette','10','200','s602'),
('60208','Cyclette','10','200','s602'),
('60209','Cyclette','10','200','s602'),
('60210','Cyclette','10','200','s602'),
('10101','Tapis Roulant','10','100','s101'),
('10102','Tapis Roulant','10','100','s101'),
('10103','Cyclette','10','200','s101'),
('10104','Cyclette','10','200','s101'),
('10105','Panca','0','500','s101'),
('10106','Panca','0','500','s101'),
('10107','Leg Press','10','300','s101'),
('10108','Leg Press','10','300','s101'),
('20101','Tapis Roulant','10','200','s201'),
('20102','Tapis Roulant','10','200','s201'),
('20103','Cyclette','10','250','s201'),
('20104','Cyclette','10','250','s201'),
('20105','Panca','0','500','s201'),
('20106','Panca','0','500','s201'),
('20107','Leg Press','10','300','s201'),
('20108','Leg Press','95','300','s201'),
('30101','Tapis Roulant','10','200','s301'),
('30102','Tapis Roulant','10','200','s301'),
('30103','Cyclette','10','300','s301'),
('30104','Cyclette','10','300','s301'),
('30105','Panca','0','500','s301'),
('30106','Panca','0','500','s301'),
('30107','Leg Press','10','300','s301'),
('30108','Leg Press','10','300','s301'),
('40101','Tapis Roulant','10','200','s401'),
('40102','Tapis Roulant','10','200','s401'),
('40103','Cyclette','10','250','s401'),
('40104','Cyclette','10','250','s401'),
('40105','Panca','0','500','s401'),
('40106','Panca','0','500','s401'),
('40107','Leg Press','10','300','s401'),
('40108','Leg Press','10','300','s401'),
('50101','Tapis Roulant','10','200','s501'),
('50102','Tapis Roulant','10','200','s501'),
('50103','Cyclette','10','250','s501'),
('50104','Cyclette','10','250','s501'),
('50105','Panca','0','600','s501'),
('50106','Panca','0','600','s501'),
('50107','Leg Press','10','300','s501'),
('50108','Leg Press','10','300','s501'),
('60101','Tapis Roulant','10','200','s601'),
('60102','Tapis Roulant','10','200','s601'),
('60103','Cyclette','10','250','s601'),
('60104','Cyclette','10','350','s601'),
('60105','Panca','0','400','s601'),
('60106','Panca','0','400','s601'),
('60107','Leg Press','10','300','s601'),
('60108','Leg Press','10','300','s601'),
('10401','Tapis Roulant','10','200','s104'),
('10402','Tapis Roulant','10','200','s104'),
('10403','Tapis Roulant','10','200','s104'),
('10404','Cyclette','10','250','s104'),
('10405','Cyclette','10','250','s104'),
('10406','Cyclette','10','250','s104'),
('10407','Panca','0','400','s104'),
('10408','Panca','0','400','s104'),
('10409','Panca','0','500','s104'),
('10410','Leg Press','10','300','s104'),
('10411','Leg Press','10','350','s104'),
('10412','Leg Press','10','350','s104'),
('20401','Tapis Roulant','10','200','s204'),
('20402','Tapis Roulant','10','200','s204'),
('20403','Tapis Roulant','10','250','s204'),
('20404','Cyclette','10','300','s204'),
('20405','Cyclette','10','300','s204'),
('20406','Cyclette','10','350','s204'),
('20407','Panca','0','400','s204'),
('20408','Panca','0','450','s204'),
('20409','Panca','0','450','s204'),
('20410','Leg Press','10','350','s204'),
('20411','Leg Press','10','350','s204'),
('20412','Leg Press','10','400','s204'),
('30401','Tapis Roulant','10','200','s304'),
('30402','Tapis Roulant','10','250','s304'),
('30403','Tapis Roulant','10','250','s304'),
('30404','Cyclette','10','300','s304'),
('30405','Cyclette','10','350','s304'),
('30406','Cyclette','10','400','s304'),
('30407','Panca','0','500','s304'),
('30408','Panca','0','500','s304'),
('30409','Panca','0','400','s304'),
('30410','Leg Press','10','300','s304'),
('30411','Leg Press','10','300','s304'),
('30412','Leg Press','10','350','s304'),
('40401','Tapis Roulant','10','200','s404'),
('40402','Tapis Roulant','10','250','s404'),
('40403','Tapis Roulant','10','200','s404'),
('40404','Cyclette','10','200','s404'),
('40405','Cyclette','10','250','s404'),
('40406','Cyclette','10','250','s404'),
('40407','Panca','0','400','s404'),
('40408','Panca','0','400','s404'),
('40409','Panca','0','500','s404'),
('40410','Leg Press','10','300','s404'),
('40411','Leg Press','10','300','s404'),
('40412','Leg Press','10','350','s404'),
('50401','Tapis Roulant','10','200','s504'),
('50402','Tapis Roulant','10','250','s504'),
('50403','Tapis Roulant','10','250','s504'),
('50404','Cyclette','10','200','s504'),
('50405','Cyclette','10','200','s504'),
('50406','Cyclette','10','250','s504'),
('50407','Panca','0','400','s504'),
('50408','Panca','0','400','s504'),
('50409','Panca','0','500','s504'),
('50410','Leg Press','10','300','s504'),
('50411','Leg Press','10','300','s504'),
('50412','Leg Press','10','350','s504'),
('60401','Tapis Roulant','10','200','s604'),
('60402','Tapis Roulant','10','250','s604'),
('60403','Tapis Roulant','10','250','s604'),
('60404','Cyclette','10','350','s604'),
('60405','Cyclette','10','250','s604'),
('60406','Cyclette','10','250','s604'),
('60407','Panca','0','400','s604'),
('60408','Panca','0','400','s604'),
('60409','Panca','0','500','s604'),
('60410','Leg Press','10','300','s604'),
('60411','Leg Press','10','300','s604'),
('60412','Leg Press','10','350','s604');

INSERT INTO Piscine VALUES 
('p101','Platinum','200','0001','ddd5'),
('p201','Gold','100','0005','ddd2'),
('p301','Platinum','200','0005','ddd4'),
('p401','Platinum','200','0009','aaa4'),
('p601','Platinum','200','0015','ccc2'); 

INSERT INTO Dipendente VALUES  
('aaa1','Mario','Bianchi','Via Vespucci 97, Roma','1994-07-21','AS100','Roma','Consulente','aaa9'),--  Consulente
('aaa2','Sara','Baglioni','Via Carletto 12, Roma','1987-02-25','AS100','Roma','Istruttore','aaa9'),
('aaa3','Dario','Nazzareno','Via Tavernello 281, Roma','1990-07-21','AS100','Roma','Istruttore','aaa9'),
('aaa4','Laura','Rossi','Via Verdi 29, Roma','1973-01-31','AS100','Roma','Responsabile','aaa9'), -- Responsabile
('aaa5','Piero','Pirelli','Via Tarallo 42, Roma','1964-12-21','AS100','Roma','Direttore',NULL),
('aaa6','Sofia','Giorgi','Via Saponetta 21, Roma','1997-12-20','AS100','Roma','Responsabile','aaa9'), -- Responsabile
('aaa7','Gina','Verdini','Via Giapponese 32, Roma','1969-04-13','AS100','Roma','Istruttore','aaa9'),
('aaa8','Tommaso','Fioretti','Via del Tarlo 97, Firenze','1994-12-05','FI392','Firenze','Consulente','bbb3'), -- Consulente
('aaa9','Sandro','Ceccarini','Via Tartara 31, Roma','1975-09-12','AS100','Roma','Supervisore',NULL),
('bbb1','Fiorella','Celeste','Via Palazzini 87, Firenze','1994-07-21','FI392','Firenze','Istruttore','bbb3'),
('bbb2','Sandro','Calcina','Via Fabbricotti 20, Firenze','1986-05-30','FI392','Firenze','Direttore',NULL),
('bbb3','Maria','Dini','Via Cappuccino 32, Firenze','1995-10-05','FI392','Firenze','Supervisore',NULL),
('bbb4','Celio','Neri','Via Capanna 97, Livorno','1990-11-15','FI392','Livorno','Istruttore','bbb7'),
('bbb5','Rita','Rossi','Via Racchetta 11, Livorno','1989-11-01','LI300','Livorno','Consulente','bbb7'), -- Consulente
('bbb6','Carlo','Gialli','Via Pennarello 15, Livorno','1994-07-21','LI300','Livorno','Istruttore','bbb7'),
('bbb7','Gina','Baldi','Viale di Antignano 182, Livorno','1997-03-12','LI300','Livorno','Supervisore',NULL),
('bbb8','Sirio','Forell','Via Westeros 21, Livorno','1976-09-23','LI300','Livorno','Istruttore','bbb7'),
('bbb9','Ned','Stark','Via Altogiardino 19, Livorno','1964-07-21','LI300','Livorno','Direttore',NULL),
('ccc1','Rosalba','Verde','Via Marchetta 29, Ferrara','1994-07-21','FE321','Ferrara','Istruttore','ccc4'),
('ccc2','Carletto','Felice','Via Tartina 12, Ferrara','1986-05-30','FE321','Ferrara','Responsabile','ccc4'), -- Responsabile
('ccc3','Marta','Fiero','Via Cartella 83, Ferrara','1995-10-05','FE321','Ferrara','Istruttore','ccc4'),
('ccc4','Ash','Ketchum','Via Sarto 29, Ferrara','1990-11-15','FE321','Ferrara','Supervisore',NULL),
('ccc5','Maria','Rosati','Via Sacchetto 01, Empoli','1989-11-01','EM120','Empoli','Consulente','ccc8'), -- Consulente
('ccc6','Finetto','Tartaruga','Via Sanguinello 15, Empoli','1994-07-21','EM120','Empoli','Istruttore','ccc8'),
('ccc7','Tara','Cartuccia','Viale Tappetino 182, Empoli','1997-03-12','EM120','Empoli','Istruttore','ccc8'),
('ccc8','Mauro','Saluti','Via Calzamaglia 21, Empoli','1976-09-23','EM120','Empoli','Supervisore',NULL),
('ccc9','Dario','Cecchetti','Via Foresta 19, Empoli','1964-07-21','EM120','Empoli','Direttore',NULL),
('ddd1','Sara','Retino','Via Verdi 311, Livorno','1973-01-31','LI300','Livorno','Responsabile','bbb7'), -- Responsabile
('ddd2','Carlo','Tinello','Via del Torrone 11, Firenze','1993-12-21','FI392','Firenze','Responsabile','bbb3'), -- Responsabile
('ddd3','Samanta','Mirto','Via del Gatto 15, Empoli','1992-11-14','EM120','Empoli','Responsabile','ccc8'), -- Responsabile
('ddd4','Dino','Lugetti','Via Attaccapanni 281, Firenze','1973-03-17','FI392','Firenze','Responsabile','bbb3'), -- Responsabile
('ddd5','Tino','Marini','Via del Mare 07, Livorno','1989-01-31','LI300','Livorno','Responsabile','bbb7'),-- Responsabile
('ddd6','Marta','Tortini','Via della Nocciola 17, Livorno','1957-03-21','LI300','Livorno','Medico','bbb7'), -- Medico
('ddd7','Francesco','Salatino','Via del Pistacchio 12, Firenze','1967-02-13','FI392','Firenze','Medico','bbb3'), -- Medico
('ddd8','Sara','Finetti','Via del Cane 14, Empoli','1992-11-14','EM120','Empoli','Medico','ccc8'), -- Medico
('ddd9','Lino','Banfi','Via del Litorale 38, Roma','1963-10-30','AS100','Roma','Medico','aaa9'), -- Medico
('eee1','Ginevra','Triste','Via Tappino 11, Ferrara','1965-05-07','FE321','Ferrara','Medico','ccc4'), -- Medico
('eee2','Marisa','Cucchiara','Via Scodella 23, Firenze','1980-04-21','FI392','Firenze','Tutor','ccc4'),
('eee3','Kevin','Ciprioli','Via Bustina 87, Livorno','1976-03-30','LI300','Livorno','Tutor','bbb3'),
('eee4','Mario','Palladino','Via del Vento 41, Roma','1960-12-05','AS100','Roma','Tutor','ccc4'),
('eee5','Domenico','Zito','Via Arancino 03, Ferrara','1976-05-07','FE321','Ferrara','Tutor','ccc8'),
('eee6','Ulriche','Minestra','Via del Partigiano 73, Firenze','1984-12-11','FI392','Firenze','Nutrizionista','ccc8'),
('eee7','Amedeo','Preziosi','Via del Litorale 227, Livorno','1994-05-20','LI300','Livorno','Nutrizionista','bbb3'),
('eee8','Michael','Gazzarrini','Via del Ponte 01, Roma','1964-12-05','AS100','Roma','Nutrizionista','ccc4'),
('eee9','Roberta','Praticol','Via Lente 13, Ferrara','1975-08-12','FE321','Ferrara','Nutrizionista','ccc8');

INSERT INTO Cliente VALUES 
('00001','Mauro','Montesi','Via di Popogna 7, Livorno','1994-07-21','AS100','Roma'),
('00002','Dario','Merluzzo','Via Molise 21, Firenze','1998-12-05','AM340','Firenze'),
('00003','Kevin','Carponi','Via Vettovaglia 32, Empoli','1997-04-12','AR291','Roma'),
('00004','Sandra','Tegoli','Via delle Sedie 21, Ferrara','1992-09-01','FE381','Ferrara'),
('00005','Mario','Cartuccia','Via Martini 71, Livorno','1997-12-13','LI291','Livorno'),
('00006','Diego','Valenti','Via Archeologo 18, Livorno','1997-05-23','LI281','Livorno'),
('00007','Marta','Tempestini','Via del Fante 8, Livorno','1967-09-11','LI281','Livorno'),
('00008','Tommaso','Lugetti','Via Bulletti 42, Livorno','1997-11-29','LI291','Livorno'),
('00009','Marco','Magno','Via SanPietro 21, Empoli','1991-07-28','EM473','Empoli'),
('00010','Carletto','Pigafetta','Via Sandalo 12, Ferrara','1992-12-31','FE381','Ferrara'),
('00011','Dario','Moccia','Via Mirtillo 72, Firenze','1992-05-21','FI102','Firenze'),
('00012','Pietro','Smusi','Via Quaglia 27, Empoli','1998-07-23','EM473','Empoli'),
('00013','Maurizio','Moneta','Via Maestra 12, Livorno','1997-02-01','LI291','Livorno'),
('00014','Carlo','Marzapane','Via Mediterranea 8, Roma','1995-04-28','AS821','Roma'),
('00015','Piero','Urbano','Via Provinciale 23, Perugia','1973-03-24','PE232','Perugia'),
('00016','Davide','Morucci','Via Grande 7, Livorno','1997-05-27','LI291','Livorno'),
('00017','Tommaso','Giorgi','Via Vespucci 12, Treviso','1998-01-06','PE312','Perugia'),
('00018','Ciro','Immobile','Via Carpisa 12, Livorno','1997-02-01','AS100','Roma'),
('00019','Beatrice','Peluso','Via Roma 7, Livorno','1997-12-22','MI100','Milano'),
('00020','Giulia','Cartina','Via di Certaldo 18, Firenze','1983-07-21','MI100','Milano'),
('00021','Sofia','Gervasio','Via Molisana 182, Firenze','1984-11-21','FE281','Firenze'),
('00022','Emilia','Saggi','Via della Salvezza 137, Livorno','1999-04-28','MI100','Milano'),
('00023','Roberta','Pacini','Via Allibratore 31, Empoli','2000-05-29','EM391','Empoli'),
('00024','Max','Pezzali','Via Pitagora 43, Livorno','1972-05-12','EM391','Empoli'),
('00025','Delia','Pancetta','Via Tramezzini 75, Roma','1984-12-29','RO291','Roma');

INSERT INTO ClienteGiornaliero VALUES 
('ggg01','Gino','Tazzina','Via del Fante 11, Roma','1987-12-11','AS100','Roma'),
('ggg02','Clara','Rudimento','Via del Badile 21, Roma','1984-05-02','AS100','Roma'),
('ggg03','Maurizio','Montesi','Via Spagna 87, Livorno','1993-12-25','LI300','Livorno'),
('ggg04','Michael','Preziosi','Via del Tesoro, Livorno','1998-01-06','LI300','Livorno'),
('ggg05','Sauro','Migliori','Via Arachide 132, Livorno','1985-07-27','LI300','Livorno'),
('ggg06','Laura','Metro','Via Ferrarelle 45, Ferrara','1994-07-21','FE450','Ferrara');

INSERT INTO SchedaBase VALUES 
('00001','70','175','0','25','22','67','ddd6','2016-12-28'),
('00002','65','170','0','22','22','65','eee1','2016-12-05'),
('00003','60','155','0','27','21','67','ddd7','2016-11-14'),
('00004','65','170','0','25','32','66','ddd9','2016-09-08'),
('00005','60','170','0','24','21','68','ddd7','2016-01-21'),
('00006','70','180','0','23','27','64','eee1','2016-12-12'),
('00007','70','178','0','22','17','64','ddd9','2016-10-24'),
('00008','50','175','0','27','19','70','ddd7','2016-02-20'),
('00009','80','190','0','28','20','71','ddd9','2016-05-30'),
('00010','95','195','0','15','22','64','ddd8','2016-07-11'),
('00011','65','170','0','14','23','65','eee1','2016-10-24'),
('00012','60','180','0','17','26','63','ddd9','2016-11-17'),
('00013','55','165','0','18','19','60','ddd7','2016-12-03'),
('00014','80','175','0','20','17','65','eee1','2016-08-06'),
('00015','95','185','0','22','15','67','ddd7','2016-11-07'),
('00016','60','170','0','30','22','68','ddd9','2016-09-03'),
('00017','50','160','0','28','24','69','ddd7','2016-12-15'),
('00018','55','180','0','22','25','60','ddd8','2016-04-21'),
('00019','70','170','0','21','28','68','ddd8','2016-06-16'),
('00020','60','175','0','24','30','65','eee1','2016-07-28'),
('00021','75','185','0','19','31','64','ddd8','2016-09-23'),
('00022','80','180','0','13','28','66','eee1','2016-12-31'),
('00023','95','195','0','16','17','69','ddd9','2016-01-15'),
('00024','75','165','0','19','22','70','ddd7','2016-01-09'),
('00025','70','185','0','22','26','67','ddd8','2016-03-21');

INSERT INTO Contratto VALUES 
('c001','Silver','2017-08-13','2017-09-13','Ricreativo','120','00011','2017-08-10','ccc5'),
('c002','Silver','2017-03-15','2017-05-15','Dimagrimento','120','00001','2017-03-12','aaa1'),
('c003','Silver','2017-05-11','2017-08-11','Pot. Muscolare','120','00002','2017-05-08','aaa8'),
('c004','Silver','2017-07-30','2017-08-30','Dimagrimento','120','00003','2017-07-25','aaa1'),
('c005','Silver','2017-01-21','2017-03-21','Ricreativo','120','00004','2017-01-18','aaa8'),
('c006','Silver','2017-04-06','2017-05-06','Dimagrimento','120','00005','2017-04-02','bbb5'),
('c007','Silver','2017-08-11','2017-10-11','Pot. Muscolare','120','00006','2017-08-07','aaa8'),
('c008','Silver','2017-05-23','2017-06-23','Ricreativo','120','00007','2017-05-20','aaa8'),
('c009','Silver','2017-01-27','2017-04-27','Pot. Muscolare','120','00011','2017-01-24','aaa1'),
('c010','Silver','2017-08-11','2017-09-11','Dimagrimento','120','00012','2017-08-11','bbb5'),
('c011','Silver','2017-09-22','2017-12-22','Pot. Muscolare','120','00015','2017-09-20','aaa1'),
('c012','Silver','2017-10-15','2017-11-15','Dimagrimento','120','00018','2017-10-15','bbb5'),
('c013','Silver','2017-04-08','2017-06-08','Pot. Muscolare','120','00021','2017-04-06','aaa8'),--
('c014','Gold','2017-07-15','2017-08-15','Dimagrimento','180','00008','2017-07-15','bbb5'),
('c015','Gold','2017-09-22','2017-10-22','Pot. Muscolare','180','00009','2017-09-20','aaa1'),
('c016','Gold','2018-01-21','2018-02-21','Dimagrimento','180','00010','2018-01-18','ccc5'),
('c017','Gold','2017-03-19','2017-05-19','Pot. Muscolare','180','00013','2017-03-19','bbb5'),
('c018','Gold','2017-12-15','2018-01-15','Ricreativo','180','00015','2017-12-13','aaa1'),
('c019','Gold','2017-11-06','2017-12-06','Pot. Muscolare','180','00018','2017-11-04','aaa1'),
('c020','Gold','2017-06-30','2017-08-30','Pot. Muscolare','180','00016','2017-06-28','bbb5'),
('c021','Gold','2017-02-25','2017-03-25','Dimagrimento','180','00022','2017-02-25','ccc5'), --
('c022','Platinum','2017-05-15','2017-08-15','Dimagrimento','250','00017','2017-05-12','aaa1'),
('c023','Platinum','2017-07-11','2017-08-11','Pot. Muscolare','250','00021','2017-07-08','aaa8'),
('c024','Platinum','2017-08-30','2017-09-30','Dimagrimento','250','00023','2017-08-25','bbb5'),
('c025','Platinum','2017-11-21','2018-01-21','Ricreativo','250','00025','2017-11-18','aaa8'), --
('c026','Personalizzato','2017-03-23','2017-05-23','Ricreativo','220','00014','2017-03-20','aaa8'),
('c027','Personalizzato','2017-01-27','2017-03-27','Pot. Muscolare','250','00011','2017-01-24','aaa1'),
('c028','Personalizzato','2017-05-11','2017-07-11','Dimagrimento','270','00024','2017-05-11','bbb5'),
('c029','Personalizzato','2017-07-22','2017-10-22','Pot. Muscolare','190','00007','2017-07-20','aaa1'),
('c030','Personalizzato','2017-08-15','2017-10-15','Dimagrimento','240','00025','2017-08-15','bbb5'),
('c031','Personalizzato','2017-02-08','2017-04-08','Pot. Muscolare','330','00012','2017-02-06','aaa8'),--
('c032','Personalizzato','2017-05-15','2017-06-15','Dimagrimento','280','00017','2017-05-15','bbb5'),
('c033','Personalizzato','2017-07-22','2017-08-22','Pot. Muscolare','220','00009','2017-07-20','aaa1'),
('c034','Personalizzato','2018-01-21','2018-02-21','Dimagrimento','350','00002','2018-01-18','ccc5'), --
('c035','Personalizzato','2016-05-22','2017-07-22','Ricreativo','320','00001','2017-05-20','aaa8'),
('c036','Personalizzato','2017-03-27','2017-04-27','Pot. Muscolare','330','00005','2017-03-24','aaa1'),
('c037','Personalizzato','2017-01-11','2017-03-11','Dimagrimento','290','00007','2017-01-11','bbb5'),
('c038','Personalizzato','2017-04-22','2017-05-22','Pot. Muscolare','250','00012','2017-04-20','aaa1'),
('c039','Personalizzato','2017-07-15','2017-10-15','Dimagrimento','180','00015','2017-07-15','bbb5'),
('c040','Personalizzato','2017-03-13','2017-04-13','Pot. Muscolare','200','00016','2017-03-10','aaa8'),
('c041','Personalizzato','2017-09-15','2017-11-15','Dimagrimento','250','00006','2017-09-15','bbb5'),
('c042','Personalizzato','2017-07-22','2017-08-22','Pot. Muscolare','270','00013','2017-07-20','aaa1'),
('c043','Personalizzato','2018-03-21','2018-05-21','Dimagrimento','320','00014','2018-03-18','ccc5');

INSERT INTO Rate VALUES
('c043','2018-03-21','80','Pagato'),
('c043','2018-04-21','80','Pagato'),
('c043','2018-05-21','80','Non Pagato'),
('c043','2018-06-11','80','Non pagato'),
('c030','2017-08-15','60','Pagato'),
('c030','2017-09-15','60','Pagato'),
('c030','2017-10-15','60','Pagato'),
('c030','2017-11-15','60','Non pagato'),
('c024','2017-08-30','50','Pagato'),
('c024','2017-09-30','50','Pagato'),
('c024','2017-10-30','100','Non Pagato'),
('c024','2017-11-30','50','Non Pagato');

INSERT INTO Muscoli VALUES 
('mu001','Pettorali','Lieve','c003'),
('mu002','Bicipiti','Moderato','c003'),
('mu003','Gambe','Lieve','c019'),
('mu004','Dorsali','Moderato','c019'),
('mu005','Glutei','Moderato','c019'),
('mu006','Addominali','Intenso','c020'),
('mu007','Tricipiti','Moderato','c007'),
('mu008','Deltoidi','Moderato','c007'),
('mu009','Polpacci','Lieve','c009'),
('mu010','Bicipiti','Moderato','c009'),
('mu011','Gambe','Intenso','c013'),
('mu012','Avambraccio','Lieve','c013'),
('mu013','Dorsali','Moderato','c040'),
('mu014','Addominali','Lieve','c040');

INSERT INTO SediAccessibili VALUES
('0001','c026'),('0001','c031'),('0015','c036'),('0005','c041'),('0009','c007'),
('0005','c026'),('0005','c031'),('0013','c036'),('0015','c041'),('0013','c008'),
('0013','c026'),('0013','c031'),('0005','c037'),('0013','c042'),('0009','c009'),
('0001','c027'),('0013','c032'),('0001','c038'),('0001','c043'),('0005','c010'),
('0009','c027'),('0001','c032'),('0013','c038'),('0009','c043'),('0015','c011'),
('0009','c028'),('0013','c033'),('0015','c038'),('0009','c001'),('0009','c017'),
('0013','c029'),('0009','c033'),('0015','c039'),('0001','c002'),('0013','c012'),
('0005','c029'),('0005','c034'),('0001','c039'),('0005','c003'),('0015','c013'),
('0015','c029'),('0009','c035'),('0005','c040'),('0001','c004'),('0001','c014'),
('0015','c030'),('0013','c035'),('0009','c040'),('0005','c005'),('0005','c015'),
('0013','c030'),('0015','c035'),('0001','c041'),('0001','c006'),('0005','c016'),
('0009','c018'),('0013','c019'),('0013','c020'),('0009','c021'),('0005','c022'),
('0009','c023'),('0015','c024'),('0005','c025');

INSERT INTO Esercizio VALUES
('es001','Push up', '50'),
('es002', 'Pull up','34'),
('es003', 'Corsa', '60'),
('es004', 'Plank', '67'),
('es005', 'Front Lever', '32'),
('es006', 'Back Lever', '54'),
('es007', 'Planche', '93'),
('es008', 'Crunch', '23'),
('es009', 'Leg Raises', '43'),
('es010','Push up', '50'),
('es011', 'Pull up','34'),
('es012', 'Corsa', '60'),
('es013', 'Plank', '67'),
('es014', 'Front Lever', '32'),
('es015', 'Back Lever', '54'),
('es016', 'Crunch', '23'),
('es017', 'Leg Extencion', '52'),
('es018', 'Pressa Orizzontale', '45'),
('es019', 'Pectoral Machine', '31'),
('es020', 'Leg Curl', '23');

INSERT INTO TabellaEsercizi VALUES
('tab001','2017-09-22','2017-10-22','eee2','0001'),
('tab002','2018-01-21','2018-02-21','eee3','0002'),
('tab003','2017-03-19','2017-05-19','eee5','0003'),
('tab004','2017-12-15','2018-01-15','eee3','0004'),
('tab005','2017-11-06','2017-12-06','eee2','0005'),
('tab006','2017-06-30','2017-08-30','eee5','0006'),
('tab007','2017-02-25','2017-03-25','eee2','0007'),
('tab008','2017-05-15','2017-08-15','eee4','0008'),
('tab009','2017-07-11','2017-08-11','eee3','0009'),
('tab010','2017-08-30','2017-09-30','eee4','0010'),
('tab011','2017-11-21','2018-01-21','eee5','0011'),
('tab012','2017-03-23','2017-05-23','eee2','0012'),
('tab013','2017-01-27','2017-03-27','eee3','0013'),
('tab014','2017-05-11','2017-07-11','eee2','0014'),
('tab015','2017-07-22','2017-10-22','eee4','0015'),
('tab016','2017-08-15','2017-10-15','eee5','0016'),
('tab017','2017-02-08','2017-04-08','eee2','0017'),
('tab018','2017-05-15','2017-06-15','eee3','0018'),
('tab019','2017-07-22','2017-08-22','eee3','0019'),
('tab020','2018-01-21','2018-02-21','eee5','0020'),
('tab021','2016-05-22','2017-07-22','eee3','0021'),
('tab022','2017-03-27','2017-04-27','eee5','0022'),
('tab023','2017-01-11','2017-03-11','eee4','0023'),
('tab024','2017-04-22','2017-05-22','eee4','0024'),
('tab025','2017-07-15','2017-10-15','eee2','0025'),
('tab026','2017-03-13','2017-04-13','eee3','0001');

INSERT INTO Configurazione VALUES
('tab001','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('tab001','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('tab001','es006','LUN','40104',NULL,'30',NULL,'15','2','30'),
('tab001','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('tab001','es012','MER','40106',NULL,NULL,NULL,'15','4','60'),
('tab001','es013','MER','40107',NULL,'30',NULL,'15','2','30'),
('tab001','es014','MER','40108',NULL,NULL,NULL,'15','4','60'),
('tab001','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('tab001','es016','VEN','50102',NULL,NULL,'40','15','3','50'),
('tab002','es003','MAR','50103','30','30',NULL,'15','3','40'),
('tab002','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('tab002','es007','MAR','50105','30','30',NULL,'15','3','40'),
('tab002','es009','MAR','50106',NULL,NULL,'40','15','3','50'),
('tab002','es008','GIO','50107','30','30',NULL,'15','3','40'),
('tab002','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('tab002','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('tab002','es015','SAB','60102','30','30',NULL,'15','3','40'),
('tab002','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('tab002','es017','SAB','60104','30',NULL,NULL,'15','3','60'),--
('tab003','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab003','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab003','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab003','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab003','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab003','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab003','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab003','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab003','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab004','es003','MAR','50103','30','30',NULL,'15','3','40'),
('tab004','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('tab004','es009','MAR','50105','30','30',NULL,'15','3','40'),
('tab004','es007','MAR','50106',NULL,NULL,'40','15','3','50'),
('tab004','es008','GIO','50107','30','30',NULL,'15','3','40'),
('tab004','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('tab004','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('tab004','es015','SAB','60102','30','30',NULL,'15','3','40'),
('tab004','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('tab004','es017','SAB','60104','30',NULL,NULL,'15','3','60'),--
('tab005','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab005','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab005','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab005','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab005','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab005','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab005','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab005','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab005','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab006','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('tab006','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('tab006','es006','LUN','40104',NULL,'30',NULL,'15','2','30'),
('tab006','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('tab006','es012','MER','40106',NULL,NULL,NULL,'15','4','60'),
('tab006','es013','MER','40107',NULL,'30',NULL,'15','2','30'),
('tab006','es014','MER','40108',NULL,NULL,NULL,'15','4','60'),
('tab006','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('tab006','es016','VEN','50102',NULL,NULL,'40','15','3','50'),--
('tab007','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab007','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab007','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab007','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab007','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab007','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab007','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab007','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab007','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab008','es003','MAR','50103','30','30',NULL,'15','3','40'),
('tab008','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('tab008','es009','MAR','50105','30','30',NULL,'15','3','40'),
('tab008','es007','MAR','50106',NULL,NULL,'40','15','3','50'),
('tab008','es008','GIO','50107','30','30',NULL,'15','3','40'),
('tab008','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('tab008','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('tab008','es015','SAB','60102','30','30',NULL,'15','3','40'),
('tab008','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('tab008','es017','SAB','60104','30',NULL,NULL,'15','3','60'),--
('tab009','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('tab009','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('tab009','es006','LUN','40104',NULL,'30',NULL,'15','2','30'),
('tab009','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('tab009','es012','MER','40106',NULL,NULL,NULL,'15','4','60'),
('tab009','es013','MER','40107',NULL,'30',NULL,'15','2','30'),
('tab009','es014','MER','40108',NULL,NULL,NULL,'15','4','60'),
('tab009','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('tab009','es016','VEN','50102',NULL,NULL,'40','15','3','50'),
('tab010','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab010','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab010','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab010','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab010','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab010','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab010','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab010','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab010','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab011','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab011','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab011','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab011','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab011','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab011','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab011','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab011','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab011','es020','SAB','10406','30','30',NULL,'15','3','40'),-- 
('tab012','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab012','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab012','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab012','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab012','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab012','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab012','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab012','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab012','es020','SAB','10406','30','30',NULL,'15','3','40'), -- -------------
('tab013','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('tab013','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('tab013','es006','LUN','40104',NULL,'30',NULL,'15','2','30'),
('tab013','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('tab013','es012','MER','40106',NULL,NULL,NULL,'15','4','60'),
('tab013','es013','MER','40107',NULL,'30',NULL,'15','2','30'),
('tab013','es014','MER','40108',NULL,NULL,NULL,'15','4','60'),
('tab013','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('tab013','es016','VEN','50102',NULL,NULL,'40','15','3','50'),
('tab014','es003','MAR','50103','30','30',NULL,'15','3','40'),
('tab014','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('tab014','es009','MAR','50105','30','30',NULL,'15','3','40'),
('tab014','es007','MAR','50106',NULL,NULL,'40','15','3','50'),
('tab014','es008','GIO','50107','30','30',NULL,'15','3','40'),
('tab014','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('tab014','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('tab014','es015','SAB','60102','30','30',NULL,'15','3','40'),
('tab014','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('tab014','es017','SAB','60104','30',NULL,NULL,'15','3','60'),--
('tab015','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab015','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab015','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab015','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab015','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab015','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab015','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab015','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab015','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab016','es003','MAR','50103','30','30',NULL,'15','3','40'),
('tab016','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('tab016','es009','MAR','50105','30','30',NULL,'15','3','40'),
('tab016','es007','MAR','50106',NULL,NULL,'40','15','3','50'),
('tab016','es008','GIO','50107','30','30',NULL,'15','3','40'),
('tab016','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('tab016','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('tab016','es015','SAB','60102','30','30',NULL,'15','3','40'),
('tab016','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('tab016','es017','SAB','60104','30',NULL,NULL,'15','3','60'),--
('tab017','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab017','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab017','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab017','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab017','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab017','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab017','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab017','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab017','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab018','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('tab018','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('tab018','es006','LUN','40104',NULL,'30',NULL,'15','2','30'),
('tab018','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('tab018','es012','MER','40106',NULL,NULL,NULL,'15','4','60'),
('tab018','es013','MER','40107',NULL,'30',NULL,'15','2','30'),
('tab018','es014','MER','40108',NULL,NULL,NULL,'15','4','60'),
('tab018','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('tab018','es016','VEN','50102',NULL,NULL,'40','15','3','50'),--
('tab019','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab019','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab019','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab019','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab019','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab019','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab019','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab019','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab019','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab020','es003','MAR','50103','30','30',NULL,'15','3','40'),
('tab020','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('tab020','es009','MAR','50105','30','30',NULL,'15','3','40'),
('tab020','es007','MAR','50106',NULL,NULL,'40','15','3','50'),
('tab020','es008','GIO','50107','30','30',NULL,'15','3','40'),
('tab020','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('tab020','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('tab020','es015','SAB','60102','30','30',NULL,'15','3','40'),
('tab020','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('tab020','es017','SAB','60104','30',NULL,NULL,'15','3','60'),--
('tab021','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('tab021','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('tab021','es006','LUN','40104',NULL,'30',NULL,'15','2','30'),
('tab021','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('tab021','es012','MER','40106',NULL,NULL,NULL,'15','4','60'),
('tab021','es013','MER','40107',NULL,'30',NULL,'15','2','30'),
('tab021','es014','MER','40108',NULL,NULL,NULL,'15','4','60'),
('tab021','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('tab021','es016','VEN','50102',NULL,NULL,'40','15','3','50'),
('tab022','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab022','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab022','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab022','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab022','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab022','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab022','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab022','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab022','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab023','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab023','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab023','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab023','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab023','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab023','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab023','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab023','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab023','es020','SAB','10406','30','30',NULL,'15','3','40'),-- 
('tab024','es018','MER','60105',NULL,'30',NULL,'15','2','30'),
('tab024','es003','MER','60106','30',NULL,NULL,'15','3','60'),
('tab024','es001','MER','60107','30','30',NULL,'15','3','40'),
('tab024','es005','MER','60108',NULL,NULL,'40','15','3','50'),
('tab024','es004','SAB','10401','30','30',NULL,'15','3','40'),
('tab024','es002','SAB','10402','30',NULL,NULL,'15','3','60'),
('tab024','es012','SAB','10403',NULL,NULL,NULL,'15','4','60'),
('tab024','es013','SAB','10404',NULL,'30',NULL,'15','2','30'),
('tab024','es020','SAB','10406','30','30',NULL,'15','3','40'),--
('tab025','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('tab025','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('tab025','es006','LUN','40104',NULL,'30',NULL,'15','2','30'),
('tab025','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('tab025','es012','MER','40106',NULL,NULL,NULL,'15','4','60'),
('tab025','es013','MER','40107',NULL,'30',NULL,'15','2','30'),
('tab025','es014','MER','40108',NULL,NULL,NULL,'15','4','60'),
('tab025','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('tab025','es016','VEN','50102',NULL,NULL,'40','15','3','50'),
('tab026','es003','MAR','50103','30','30',NULL,'15','3','40'),
('tab026','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('tab026','es007','MAR','50105','30','30',NULL,'15','3','40'),
('tab026','es009','MAR','50106',NULL,NULL,'40','15','3','50'),
('tab026','es008','GIO','50107','30','30',NULL,'15','3','40'),
('tab026','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('tab026','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('tab026','es015','SAB','60102','30','30',NULL,'15','3','40'),
('tab026','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('tab026','es017','SAB','60104','30',NULL,NULL,'15','3','60');

INSERT INTO SchedaAlimentazione VALUES -- Calcolare con un'update l'apporto giornaliero (operazioni)
('ali001','2017-09-27','2017-11-27','0','Dimagrimento'),
('ali002','2018-01-21','2018-02-21','0','Acquisire Massa Muscolare'),
('ali003','2017-03-19','2017-05-19','0','Diminuzione Massa Grassa'),
('ali004','2017-12-15','2018-01-15','0','Dimagrimento'),
('ali005','2017-11-06','2017-12-06','0','Diminuzione Massa Grassa'),
('ali006','2017-06-30','2017-08-30','0','Dimagrimento'),
('ali007','2017-02-25','2017-03-25','0','Acquisire Massa Muscolare'),
('ali008','2017-05-15','2017-08-15','0','Acquisire Massa Muscolare'),
('ali009','2017-07-11','2017-08-11','0','Dimagrimento'),
('ali010','2017-08-30','2017-09-30','0','Dimagrimento'),
('ali011','2017-11-21','2018-01-21','0','Acquisire Massa Muscolare'),
('ali012','2017-03-23','2017-05-23','0','Diminuzione Massa Grassa'),
('ali013','2017-01-27','2017-03-27','0','Acquisire Massa Muscolare'),
('ali014','2017-05-11','2017-07-11','0','Diminuzione Massa Grassa'),
('ali015','2017-07-22','2017-10-22','0','Acquisire Massa Muscolare'),
('ali016','2017-08-15','2017-10-15','0','Acquisire Massa Muscolare'),
('ali017','2017-02-08','2017-04-08','0','Dimagrimento'),
('ali018','2017-05-15','2017-06-15','0','Dimagrimento'),
('ali019','2017-07-22','2017-08-22','0','Acquisire Massa Muscolare'),
('ali020','2018-01-21','2018-02-21','0','Diminuzione Massa Grassa'),
('ali021','2016-05-22','2017-07-22','0','Acquisire Massa Muscolare'),
('ali022','2017-03-27','2017-04-27','0','Dimagrimento'),
('ali023','2017-01-11','2017-03-11','0','Diminuzione Massa Grassa'),
('ali024','2017-04-22','2017-05-22','0','Acquisire Massa Muscolare'),
('ali025','2017-07-15','2017-10-15','0','Diminuzione Massa Grassa'),
('ali026','2017-03-13','2017-04-13','0','Acquisire Massa Muscolare'),
('ali027','2018-01-28','2018-02-28','0','Dimagrimento'),
('ali028','2017-08-25','2017-10-25','0','Acquisire Massa Muscolare'),
('ali029','2017-06-17','2017-08-17','0','Dimagrimento'),
('ali030','2017-12-11','2018-02-11','0','Dimagrimento');

INSERT INTO Pasto VALUES
('pp001','150','Pasta al pomodoro'),
('pp002','210','Pasta al pesto'),
('pp003','250','Risotto ai funghi'),
('pp004','150','Minestrone di verdure'),
('pp005','120','Semolino'),
('pp006','150','Minestra in brodo'),
('pp007','250','Tortellini al ragu'),
('pp008','220','Ravioli al pomodoro'),
('pp009','300','Gnocchi al gorgonzola'),
('pp010','230','Farfalline alle noci'),
('pp011','450','Bistecca di maiale'),
('pp012','500','Bistecca di vitella'),
('pp013','250','Petto di pollo alla piastra'),
('pp014','300','Bracioline alla salvia'),
('pp015','250','Insalata Nizzarda'),
('pp016','340','Pollo arrosto'),
('pp017','320','Arrosticini di tacchino'),
('pp018','230','Panino al prosciutto'),
('pp019','500','Pizza'),
('pp020','150','Latte e biscotti'),
('pp021','150','Latte e cereali'),
('pp022','230','Pane e nutella'),
('pp023','130','Caffè e Mela'),
('pp024','270','Pane, Burro e Marmellata');

INSERT INTO CalendarioDieta VALUES
('ali001','LUN','3'),('ali001','MAR','3'),('ali001','MER','3'),('ali001','GIO','3'),('ali001','VEN','3'),('ali001','SAB','3'),('ali001','DOM','2'),
('ali002','LUN','3'),('ali002','MAR','3'),('ali002','MER','3'),('ali002','GIO','3'),('ali002','VEN','3'),('ali002','SAB','3'),('ali002','DOM','2'),
('ali003','LUN','3'),('ali003','MAR','3'),('ali003','MER','3'),('ali003','GIO','3'),('ali003','VEN','3'),('ali003','SAB','3'),('ali003','DOM','2'),
('ali004','LUN','3'),('ali004','MAR','3'),('ali004','MER','3'),('ali004','GIO','3'),('ali004','VEN','3'),('ali004','SAB','3'),('ali004','DOM','2'),
('ali005','LUN','3'),('ali005','MAR','3'),('ali005','MER','3'),('ali005','GIO','3'),('ali005','VEN','3'),('ali005','SAB','3'),('ali005','DOM','2'),
('ali006','LUN','3'),('ali006','MAR','3'),('ali006','MER','3'),('ali006','GIO','3'),('ali006','VEN','3'),('ali006','SAB','3'),('ali006','DOM','2'),
('ali007','LUN','3'),('ali007','MAR','3'),('ali007','MER','3'),('ali007','GIO','3'),('ali007','VEN','3'),('ali007','SAB','3'),('ali007','DOM','2'),
('ali008','LUN','3'),('ali008','MAR','3'),('ali008','MER','3'),('ali008','GIO','3'),('ali008','VEN','3'),('ali008','SAB','3'),('ali008','DOM','2'),
('ali009','LUN','3'),('ali009','MAR','3'),('ali009','MER','3'),('ali009','GIO','3'),('ali009','VEN','3'),('ali009','SAB','3'),('ali009','DOM','2'),
('ali010','LUN','3'),('ali010','MAR','3'),('ali010','MER','3'),('ali010','GIO','3'),('ali010','VEN','3'),('ali010','SAB','3'),('ali010','DOM','2'),
('ali011','LUN','3'),('ali011','MAR','3'),('ali011','MER','3'),('ali011','GIO','3'),('ali011','VEN','3'),('ali011','SAB','3'),('ali011','DOM','2'),
('ali012','LUN','3'),('ali012','MAR','3'),('ali012','MER','3'),('ali012','GIO','3'),('ali012','VEN','3'),('ali012','SAB','3'),('ali012','DOM','2'),
('ali013','LUN','3'),('ali013','MAR','3'),('ali013','MER','3'),('ali013','GIO','3'),('ali013','VEN','3'),('ali013','SAB','3'),('ali013','DOM','2'),
('ali014','LUN','3'),('ali014','MAR','3'),('ali014','MER','3'),('ali014','GIO','3'),('ali014','VEN','3'),('ali014','SAB','3'),('ali014','DOM','2'),
('ali015','LUN','3'),('ali015','MAR','3'),('ali015','MER','3'),('ali015','GIO','3'),('ali015','VEN','3'),('ali015','SAB','3'),('ali015','DOM','2'),
('ali016','LUN','3'),('ali016','MAR','3'),('ali016','MER','3'),('ali016','GIO','3'),('ali016','VEN','3'),('ali016','SAB','3'),('ali016','DOM','2'),
('ali017','LUN','3'),('ali017','MAR','3'),('ali017','MER','3'),('ali017','GIO','3'),('ali017','VEN','3'),('ali017','SAB','3'),('ali017','DOM','2'),
('ali018','LUN','3'),('ali018','MAR','3'),('ali018','MER','3'),('ali018','GIO','3'),('ali018','VEN','3'),('ali018','SAB','3'),('ali018','DOM','2'),
('ali019','LUN','3'),('ali019','MAR','3'),('ali019','MER','3'),('ali019','GIO','3'),('ali019','VEN','3'),('ali019','SAB','3'),('ali019','DOM','2'),
('ali020','LUN','3'),('ali020','MAR','3'),('ali020','MER','3'),('ali020','GIO','3'),('ali020','VEN','3'),('ali020','SAB','3'),('ali020','DOM','2'),
('ali021','LUN','3'),('ali021','MAR','3'),('ali021','MER','3'),('ali021','GIO','3'),('ali021','VEN','3'),('ali021','SAB','3'),('ali021','DOM','2'),
('ali022','LUN','3'),('ali022','MAR','3'),('ali022','MER','3'),('ali022','GIO','3'),('ali022','VEN','3'),('ali022','SAB','3'),('ali022','DOM','2'),
('ali023','LUN','3'),('ali023','MAR','3'),('ali023','MER','3'),('ali023','GIO','3'),('ali023','VEN','3'),('ali023','SAB','3'),('ali023','DOM','2'),
('ali024','LUN','3'),('ali024','MAR','3'),('ali024','MER','3'),('ali024','GIO','3'),('ali024','VEN','3'),('ali024','SAB','3'),('ali024','DOM','2'),
('ali025','LUN','3'),('ali025','MAR','3'),('ali025','MER','3'),('ali025','GIO','3'),('ali025','VEN','3'),('ali025','SAB','3'),('ali025','DOM','2'),
('ali026','LUN','3'),('ali026','MAR','3'),('ali026','MER','3'),('ali026','GIO','3'),('ali026','VEN','3'),('ali026','SAB','3'),('ali026','DOM','2'),
('ali027','LUN','3'),('ali027','MAR','3'),('ali027','MER','3'),('ali027','GIO','3'),('ali027','VEN','3'),('ali027','SAB','3'),('ali027','DOM','2'),
('ali028','LUN','3'),('ali028','MAR','3'),('ali028','MER','3'),('ali028','GIO','3'),('ali028','VEN','3'),('ali028','SAB','3'),('ali028','DOM','2'),
('ali029','LUN','3'),('ali029','MAR','3'),('ali029','MER','3'),('ali029','GIO','3'),('ali029','VEN','3'),('ali029','SAB','3'),('ali029','DOM','2'),
('ali030','LUN','3'),('ali030','MAR','3'),('ali030','MER','3'),('ali030','GIO','3'),('ali030','VEN','3'),('ali030','SAB','3'),('ali030','DOM','2');

INSERT INTO VisitaDieta VALUES
('eee6','00025','ali001','2017-09-22'),('eee7','00024','ali002','2018-01-19'),
('eee8','00023','ali003','2017-03-17'),('eee9','00022','ali004','2017-12-13'),
('eee8','00021','ali005','2017-11-04'),('eee7','00020','ali006','2017-06-28'),
('eee6','00019','ali007','2017-02-23'),('eee7','00018','ali008','2017-05-13'),
('eee8','00017','ali009','2017-07-09'),('eee9','00016','ali010','2017-08-28'),
('eee8','00015','ali011','2017-11-19'),('eee7','00014','ali012','2017-03-22'),
('eee6','00013','ali013','2017-01-25'),('eee7','00012','ali014','2017-05-09'),
('eee8','00011','ali015','2017-07-20'),('eee9','00010','ali016','2017-08-13'),
('eee8','00009','ali017','2017-02-06'),('eee7','00008','ali018','2017-05-13'),
('eee6','00007','ali019','2017-07-20'),('eee7','00006','ali020','2018-01-19'),
('eee8','00005','ali021','2016-05-20'),('eee9','00004','ali022','2017-03-25'),
('eee8','00003','ali023','2017-01-09'),('eee7','00002','ali024','2017-04-20'),
('eee6','00001','ali025','2017-07-13'),('eee7','00012','ali026','2017-03-11'),
('eee8','00015','ali027','2018-01-26'),('eee9','00016','ali028','2017-08-23'),
('eee8','00018','ali029','2017-06-13'),('eee7','00021','ali030','2017-12-08');

INSERT INTO ComposizioneDieta VALUES 
('pp020','ali001','LUN','Colazione'),('pp004','ali001','LUN','Pranzo'),('pp005','ali001','LUN','Cena'),('pp014','ali001','LUN','Cena'),
('pp021','ali001','MAR','Colazione'),('pp003','ali001','MAR','Pranzo'),('pp009','ali001','MAR','Cena'),('pp013','ali001','MAR','Cena'),
('pp022','ali001','MER','Colazione'),('pp007','ali001','MER','Pranzo'),('pp006','ali001','MER','Cena'),('pp018','ali001','MER','Cena'),
('pp023','ali001','GIO','Colazione'),('pp005','ali001','GIO','Pranzo'),('pp003','ali001','GIO','Cena'),('pp017','ali001','GIO','Cena'),
('pp024','ali001','VEN','Colazione'),('pp006','ali001','VEN','Pranzo'),('pp001','ali001','VEN','Cena'),('pp012','ali001','VEN','Cena'),
('pp021','ali001','SAB','Colazione'),('pp008','ali001','SAB','Pranzo'),('pp004','ali001','SAB','Cena'),('pp018','ali001','SAB','Cena'),
('pp023','ali001','DOM','Colazione'),('pp009','ali001','DOM','Cena'),('pp011','ali001','DOM','Cena'), -- ali001
('pp021','ali005','LUN','Colazione'),('pp003','ali005','LUN','Pranzo'),('pp007','ali005','LUN','Cena'),('pp014','ali005','LUN','Cena'),
('pp020','ali005','MAR','Colazione'),('pp004','ali005','MAR','Pranzo'),('pp008','ali005','MAR','Cena'),('pp017','ali005','MAR','Cena'),
('pp023','ali005','MER','Colazione'),('pp005','ali005','MER','Pranzo'),('pp009','ali005','MER','Cena'),('pp012','ali005','MER','Cena'),
('pp024','ali005','GIO','Colazione'),('pp006','ali005','GIO','Pranzo'),('pp002','ali005','GIO','Cena'),('pp013','ali005','GIO','Cena'),
('pp022','ali005','VEN','Colazione'),('pp007','ali005','VEN','Pranzo'),('pp003','ali005','VEN','Cena'),('pp019','ali005','VEN','Cena'),
('pp022','ali005','SAB','Colazione'),('pp008','ali005','SAB','Pranzo'),('pp004','ali005','SAB','Cena'),('pp017','ali005','SAB','Cena'),
('pp023','ali005','DOM','Colazione'),('pp001','ali005','DOM','Cena'),('pp015','ali005','DOM','Cena'), -- ali005
('pp022','ali030','LUN','Colazione'),('pp008','ali030','LUN','Pranzo'),('pp007','ali030','LUN','Cena'),('pp012','ali030','LUN','Cena'),
('pp023','ali030','MAR','Colazione'),('pp007','ali030','MAR','Pranzo'),('pp004','ali030','MAR','Cena'),('pp016','ali030','MAR','Cena'),
('pp024','ali030','MER','Colazione'),('pp008','ali030','MER','Pranzo'),('pp002','ali030','MER','Cena'),('pp017','ali030','MER','Cena'),
('pp021','ali030','GIO','Colazione'),('pp009','ali030','GIO','Pranzo'),('pp001','ali030','GIO','Cena'),('pp019','ali030','GIO','Cena'),
('pp020','ali030','VEN','Colazione'),('pp003','ali030','VEN','Pranzo'),('pp007','ali030','VEN','Cena'),('pp018','ali030','VEN','Cena'),
('pp021','ali030','SAB','Colazione'),('pp004','ali030','SAB','Pranzo'),('pp008','ali030','SAB','Cena'),('pp012','ali030','SAB','Cena'),
('pp024','ali030','DOM','Colazione'),('pp005','ali030','DOM','Cena'),('pp012','ali030','DOM','Cena'), -- ali030
('pp024','ali015','LUN','Colazione'),('pp005','ali015','LUN','Pranzo'),('pp006','ali015','LUN','Cena'),('pp017','ali015','LUN','Cena'),
('pp022','ali015','MAR','Colazione'),('pp004','ali015','MAR','Pranzo'),('pp008','ali015','MAR','Cena'),('pp018','ali015','MAR','Cena'),
('pp021','ali015','MER','Colazione'),('pp003','ali015','MER','Pranzo'),('pp005','ali015','MER','Cena'),('pp019','ali015','MER','Cena'),
('pp020','ali015','GIO','Colazione'),('pp002','ali015','GIO','Pranzo'),('pp004','ali015','GIO','Cena'),('pp011','ali015','GIO','Cena'),
('pp021','ali015','VEN','Colazione'),('pp001','ali015','VEN','Pranzo'),('pp002','ali015','VEN','Cena'),('pp012','ali015','VEN','Cena'),
('pp022','ali015','SAB','Colazione'),('pp006','ali015','SAB','Pranzo'),('pp005','ali015','SAB','Cena'),('pp017','ali015','SAB','Cena'),
('pp023','ali015','DOM','Colazione'),('pp007','ali015','DOM','Cena'),('pp017','ali015','DOM','Cena'), -- ali015
('pp022','ali020','LUN','Colazione'),('pp002','ali020','LUN','Pranzo'),('pp005','ali020','LUN','Cena'),('pp011','ali020','LUN','Cena'),
('pp021','ali020','MAR','Colazione'),('pp005','ali020','MAR','Pranzo'),('pp006','ali020','MAR','Cena'),('pp013','ali020','MAR','Cena'),
('pp020','ali020','MER','Colazione'),('pp006','ali020','MER','Pranzo'),('pp004','ali020','MER','Cena'),('pp014','ali020','MER','Cena'),
('pp022','ali020','GIO','Colazione'),('pp008','ali020','GIO','Pranzo'),('pp002','ali020','GIO','Cena'),('pp015','ali020','GIO','Cena'),
('pp023','ali020','VEN','Colazione'),('pp009','ali020','VEN','Pranzo'),('pp003','ali020','VEN','Cena'),('pp013','ali020','VEN','Cena'),
('pp024','ali020','SAB','Colazione'),('pp004','ali020','SAB','Pranzo'),('pp007','ali020','SAB','Cena'),('pp011','ali020','SAB','Cena'),
('pp021','ali020','DOM','Colazione'),('pp003','ali020','DOM','Cena'),('pp011','ali020','DOM','Cena'); -- ali020

INSERT INTO Spogliatoi VALUES -- 0001 0005 0009 0013 0015
('spg01','10','0001','nord'),
('spg05','10','0005','sud'),
('spg09','10','0009','est'),
('spg13','10','0013','nord'),
('spg15','10','0015','ovest');

INSERT INTO Armadietto(`CodArmadietto`,`Combinazione`,`Stato`,`Spogliatoio`) VALUES -- GESTIRE LA COMBINAZIONE AL MOMENTO DELL'ASSEGNAMENTO DI UN ARMADIETTO AD UN CLIENTE
('arm001','0000','Libero','spg01'),('arm002','0000','Libero','spg01'),
('arm003','0000','Libero','spg01'),('arm004','0000','Libero','spg01'),('arm005','0000','Libero','spg01'),
('arm006','0000','Libero','spg05'),('arm007','0000','Libero','spg05'),('arm008','0000','Libero','spg05'),
('arm009','0000','Libero','spg05'),('arm010','0000','Libero','spg05'),
('arm011','0000','Libero','spg09'),('arm012','0000','Libero','spg09'),('arm013','0000','Libero','spg09'),
('arm014','0000','Libero','spg09'),('arm015','0000','Libero','spg09'),
('arm016','0000','Libero','spg13'),('arm017','0000','Libero','spg13'),('arm018','0000','Libero','spg13'),
('arm019','0000','Libero','spg13'),('arm020','0000','Libero','spg13'),
('arm021','0000','Libero','spg15'),('arm022','0000','Libero','spg15'),('arm023','0000','Libero','spg15'),
('arm024','0000','Libero','spg15'),('arm025','0000','Libero','spg15');

INSERT INTO AccessoCliente VALUES 
('00001','2018-01-12','12:00:0000','13:00:0000','0001','arm001',NULL),
('00004','2018-02-02','11:00:0000','12:00:0000','0005','arm006',NULL),
('00012','2018-01-19','15:00:0000','17:00:0000','0009','arm011',NULL),
('00021','2018-01-17','16:00:0000','18:00:0000','0013','arm017',NULL),
('00024','2018-01-19','11:00:0000','12:30:0000','0015','arm021',NULL),
('00020','2018-01-08','14:00:0000','15:00:0000','0013','arm016',NULL),
('00017','2018-01-12','15:00:0000','17:00:0000','0001','arm002',NULL),
('00005','2018-01-13','11:00:0000','12:00:0000','0005','arm008',NULL),
('00001','2018-01-17','10:00:0000','11:00:0000','0009','arm012',NULL),
('00021','2018-01-09','12:00:0000','13:00:0000','0001','arm003',NULL), --
('00022','2018-02-12','13:00:0000','18:00:0000','0001','arm003',NULL),
('00024','2018-02-12','16:00:0000','19:00:0000','0001','arm004',NULL),
('00025','2018-02-12','13:00:0000','17:00:0000','0001','arm005',NULL),
('00011','2018-02-12','12:00:0000','14:00:0000','0001','arm006',NULL),
('00021','2018-02-12','14:00:0000','17:00:0000','0001','arm007',NULL),
('00018','2018-02-12','09:00:0000','13:00:0000','0001','arm008',NULL),
('00006','2018-02-12','10:00:0000','12:00:0000','0001','arm009',NULL),
('00008','2018-02-12','12:00:0000','13:00:0000','0001','arm010',NULL);

INSERT INTO Corsi VALUES
('cor001','Body Sculpt','2017-09-01','2018-09-01','Intermedio','30','s103'),
('cor002','Zumba','2017-09-01','2018-09-01','Principiante','50','s103'),
('cor003','Funzionale','2017-09-01','2018-09-01','Avanzato','30','s303'),
('cor004','Pilates','2017-09-01','2018-09-01','Principiante','30','s303'),
('cor005','Spinning','2017-09-01','2018-09-01','Intermedio','40','s402'),
('cor006','Body Sculpt','2017-09-01','2018-09-01','Intermedio','50','s202'),
('cor007','Zumba','2017-09-01','2018-09-01','Principiante','30','s303'),
('cor008','Funzionale','2017-09-01','2018-09-01','Avanzato','30','s202'),
('cor009','Pilates','2017-09-01','2018-09-01','Principiante','50','s202'),
('cor010','Spinning','2017-09-01','2018-09-01','Intermedio','30','s402');

INSERT INTO CalendarioCorsi VALUES -- trigger che impedisce l'inserimento di un corso se è in una stanza gia occupata da un altro corso
('cor001','LUN','17:00:0000','18:00:0000'),('cor001','MER','17:00:0000','18:00:0000'),
('cor002','MAR','10:00:0000','12:00:0000'),('cor002','GIO','10:00:0000','12:00:0000'),
('cor003','MER','18:00:0000','19:00:0000'),
('cor004','VEN','10:00:0000','11:00:0000'),('cor004','SAB','10:00:0000','11:00:0000'),
('cor005','LUN','12:00:0000','13:00:0000'),('cor005','GIO','12:00:0000','13:00:0000'),
('cor006','MER','10:00:0000','11:00:0000'),('cor006','VEN','09:00:0000','10:00:0000'),
('cor007','MAR','16:00:0000','17:00:0000'),('cor007','MER','16:00:0000','17:00:0000'),
('cor008','LUN','12:00:0000','13:00:0000'),('cor008','VEN','12:00:0000','13:00:0000'),
('cor009','MER','17:00:0000','18:00:0000'),
('cor010','MAR','12:00:0000','13:00:0000'),('cor010','VEN','09:00:0000','10:00:0000');

INSERT INTO IscrizioneCorso VALUES
('cor001','00001'),('cor001','00005'),('cor001','00024'),('cor001','00012'),('cor001','00021'),
('cor001','00015'),('cor001','00017'),('cor001','00008'),
('cor002','00011'),('cor002','00023'),('cor002','00013'),('cor002','00007'),('cor002','00009'),('cor002','00024'),
('cor002','00014'),('cor002','00003'),('cor002','00004'),('cor002','00015'),('cor002','00021'),
('cor002','00012'),('cor003','00011'),('cor003','00017'),('cor003','00019'),('cor003','00022'),
('cor003','00009'),('cor003','00006'),('cor003','00005'),('cor003','00003'),('cor003','00012'),
('cor004','00012'),('cor004','00017'),('cor004','00001'),('cor004','00011'),('cor004','00009'),('cor004','00014'),('cor004','00003'),
('cor004','00015'),('cor004','00021'),('cor004','00024'),('cor004','00025'),('cor004','00019'),
('cor005','00001'),('cor005','00005'),('cor005','00024'),('cor005','00012'),('cor005','00021'),
('cor005','00015'),('cor005','00017'),('cor005','00008'),('cor005','00003'),('cor005','00002'),('cor005','00011'),
('cor006','00011'),('cor006','00013'),('cor006','00015'),('cor006','00017'),('cor006','00019'),
('cor006','00021'),('cor006','00023'),('cor006','00025'),('cor006','00001'),('cor006','00003'),
('cor006','00007'),('cor007','00002'),('cor007','00004'),('cor007','00006'),('cor007','00008'),('cor007','00009'),('cor007','00012'),
('cor008','00003'),('cor008','00005'),('cor008','00007'),('cor008','00009'),('cor008','00019'),
('cor009','00001'),('cor009','00005'),('cor009','00014'),('cor009','00012'),('cor009','00023'),('cor009','00025'),
('cor010','00012'),('cor010','00004');

INSERT INTO IstruttoreCorsi VALUES
('aaa2','cor001'),('bbb1','cor003'),('aaa7','cor006'),('aaa2','cor008'),
('aaa7','cor001'),('ccc1','cor004'),('bbb4','cor006'),('aaa3','cor009'), 
('aaa3','cor002'),('bbb6','cor004'),('bbb6','cor007'),('bbb4','cor009'), 
('bbb6','cor003'),('aaa3','cor005'),('ccc1','cor008'),('ccc3','cor010');

INSERT INTO Turnazione VALUES 
('aaa2','0001','LUN','17:00:0000','18:00:0000'),('aaa2','0001','MER','17:00:0000','18:00:0000'),
('aaa2','0001','LUN','12:00:0000','13:00:0000'),('aaa2','0001','VEN','12:00:0000','13:00:0000'),
('aaa3','0001','MAR','10:00:0000','12:00:0000'),('aaa3','0001','GIO','10:00:0000','12:00:0000'),
('aaa3','0009','LUN','12:00:0000','13:00:0000'),('aaa3','0009','GIO','12:00:0000','13:00:0000'),
('aaa3','0001','MER','17:00:0000','18:00:0000'),
('aaa7','0001','LUN','17:00:0000','18:00:0000'),('aaa7','0001','MER','17:00:0000','18:00:0000'),
('aaa7','0001','MER','10:00:0000','11:00:0000'),('aaa7','0001','VEN','09:00:0000','10:00:0000'),
('bbb1','0005','MER','18:00:0000','19:00:0000'),
('bbb4','0001','MER','10:00:0000','11:00:0000'),('bbb4','0001','VEN','09:00:0000','10:00:0000'),
('bbb4','0001','MER','17:00:0000','18:00:0000'),
('bbb6','0005','MER','18:00:0000','19:00:0000'),('ddd5','0013','SAB','11:00:0000','13:00:0000'),
('bbb6','0005','VEN','10:00:0000','11:00:0000'),('bbb6','0005','SAB','10:00:0000','11:00:0000'),
('bbb6','0005','MAR','16:00:0000','17:00:0000'),('bbb6','0005','MER','16:00:0000','17:00:0000'),
('ccc1','0005','VEN','10:00:0000','11:00:0000'),('ccc1','0005','SAB','10:00:0000','11:00:0000'),
('ccc1','0001','LUN','12:00:0000','13:00:0000'),('ccc1','0001','VEN','12:00:0000','13:00:0000'),
('ccc3','0009','MAR','12:00:0000','13:00:0000'),('ccc3','0009','VEN','09:00:0000','10:00:0000'),
('ddd5','0013','LUN','14:00:0000','19:00:0000'),('ddd5','0013','VEN','14:00:0000','19:00:0000'),
('eee9','0015','MER','14:00:0000','18:00:0000'),('eee9','0015','SAB','09:00:0000','13:00:0000');

INSERT INTO Monitoraggio VALUES
('tab001','es002','LUN','11:23:0000','11:30:0000','11','3','30','6'),
('tab001','es005','LUN','11:34:0000','11:41:0000','18','2','43','8'),
('tab001','es006','LUN','11:43:0000','11:48:0000','14','2','45','8'),
('tab001','es011','MER','18:04:0000','18:09:0000','15','3','60','10'),
('tab001','es012','MER','18:12:0000','18:18:0000','20','4','90','6'),
('tab001','es013','MER','18:22:0000','18:26:0000','12','2','40','8'),
('tab001','es014','MER','18:28:0000','18:34:0000','15','3','50','9'),
('tab001','es015','VEN','17:32:0000','18:38:0000','15','3','50','10'),
('tab001','es016','VEN','17:42:0000','18:45:0000','20','2','20','5'),
('tab005','es018','MER','11:23:0000','11:30:0000','12','2','30','9'),
('tab005','es003','MER','11:34:0000','11:41:0000','15','2','60','8'),
('tab005','es001','MER','11:43:0000','11:48:0000','15','3','40','10'),
('tab005','es005','MER','11:52:0000','11:56:0000','10','2','30','6'),
('tab005','es004','SAB','18:04:0000','18:09:0000','12','3','40','7'),
('tab005','es002','SAB','18:12:0000','18:18:0000','10','2','60','8'),
('tab005','es012','SAB','18:22:0000','18:26:0000','15','3','60','5'),
('tab005','es013','SAB','18:28:0000','18:34:0000','15','2','20','8'),
('tab005','es020','SAB','18:36:0000','18:41:0000','15','2','55','7');

INSERT INTO ConfigurazioniEffettive VALUES
('tab001','es002','LUN','40102','20',NULL,NULL),
('tab001','es005','LUN','40103',NULL,NULL,'20'),
('tab001','es006','LUN','40104',NULL,'35',NULL),
('tab001','es011','MER','40105','35',NULL,NULL),
('tab001','es012','MER','40106',NULL,NULL,NULL),
('tab001','es013','MER','40107',NULL,'60',NULL),
('tab001','es014','MER','40108',NULL,NULL,NULL),
('tab001','es015','VEN','50101',NULL,NULL,'25'),
('tab001','es016','VEN','50102',NULL,NULL,'30'),
('tab005','es018','MER','60105',NULL,'50',NULL),
('tab005','es003','MER','60106','35',NULL,NULL),
('tab005','es001','MER','60107','30','35',NULL),
('tab005','es005','MER','60108',NULL,NULL,'20'),
('tab005','es004','SAB','10401','35','45',NULL),
('tab005','es002','SAB','10402','25',NULL,NULL),
('tab005','es012','SAB','10403',NULL,NULL,NULL),
('tab005','es013','SAB','10404',NULL,'30',NULL),
('tab005','es020','SAB','10406','25','30',NULL);

INSERT INTO Integratori VALUES
( 'Malto Dextrin', 'polvere', '1000', 'Proteine', '31', '18'),('Creatin Powder', 'polvere', '1200', 'Creatina', '43', '12'),
('Glut BBC', 'compresse', '40', 'Glutammina', '23', '12'),('MGK VIS', 'polvere', '1000', 'Magnesio', '33', '18'),
('Marlin 323', 'liquido', '250', 'Omega 3', '45', '8'),('Epalin C', 'compresse' , '20', 'Vitamina C', '60', '20'),
('Taurine Tablets', 'barrette', '20', 'Taurina', '50', '10');

INSERT INTO Fornitore VALUES
('F01', 'Fitness4', 'via caduti del lavoro 5, Napoli', '0583225678', 'spa', '2586'),
('F02', 'Amazon', 'Piazza Nazionale 1, Roma', '06692655', 'srl', '0305'),
('F03', 'Subito', 'Via Maggiore 35, Novara', '09568932', 'srl', '2509'),
('F04', 'MarketPlace', 'Via del Pino 3, Vicenza', '0357946', 'spa', '4709'),
('F05', 'Pagomeno', 'via del vigna 5, Livorno','0368921', 'srl', '5681');

INSERT INTO DettagliOrdineF VALUES
('a031', 'Glut BBC', '20'),('a031', 'Marlin 323', '18'),('a023', 'Taurine Tablets', '18'),('a023', 'Epalin C', '30'),
('g078', 'MGK VIS', '30'),('g078', 'Malto Dextrin', '11'), ('a325', 'Creatin Powder', '40'),('a325', 'Epalin C' ,'23'),
('j980', 'Malto Dextrin' , '13'), ('j980','MGK VIS', '21'), ('a150', 'Glut BBC', '34'), ('a150','Taurine Tablets', '34'),
('p945', 'Creatin Powder', '30'),('p945', 'Marlin 323', '30'), ('s323' , 'Epalin C', '23'), ('s323', 'Glut BBC', '40'),
('b458', 'Malto Dextrin', '21'),('b458', 'Glut BBC' , '18'), ('l023', 'Marlin 323', '40'), ('l023', 'Creatin Powder', '23'),
('g567', 'Glut BBC', '18'), ('g567', 'Marlin 323', '20'), ('n689', 'MGK VIS', '50'), ('n689', 'Epalin C', '33'),
('k078', 'Malto Dextrin', '21'), ('k078', 'Taurine Tablets', '29'),('a455', 'Epalin C', '4'), ('a455', 'Glut BBC', '30'),
('v980', 'Marlin 323', '30'), ('v980', 'Epalin C', '40'), ('h809', 'Glut BBc', '20'),
('q134', 'Malto Dextrin', '10'), ('q134', 'Taurine Tablets', '20'), ('x444', 'MGK VIS', '10'),
('n780', 'Marlin 323', '13'), ('w235', 'Taurine Tablets', '19'), ('m985', 'Glut BBC', '20');

INSERT INTO OrdiniFornitore VALUES
('a031', '2017-11-23', '2017-11-01', 'consegnato', 'F03', 'evaso', '0001'),
('a023', '2017-12-15', NULL ,'non spedito', 'F05', 'incompleto', '0001'),
('g078', '2017-09-11', '2017-10-01', 'consegnato', 'F01', 'evaso', '0001'),
('a325', '2018-01-23', NULL, 'non spedito', 'F05', 'incompleto', '0001'),
('j980', '2018-01-02', '2018-02-01', 'consegnato', 'F02', 'evaso', '0001'),
('a150', '2017-07-23', '2017-08-01', 'consegnato', 'F02', 'evaso', '0005'),
('p945', '2017-12-01', NULL, 'non spedito', 'F03', 'incompleto', '0005'),
('s323', '2018-01-11', '2018-02-08', 'consegnato', 'F01', 'evaso', '0005'),
('b458', '2018-01-23', NULL, 'non spedito', 'F04', 'incompleto', '0005'),
('l023', '2017-12-02', '2017-12-29', 'consegnato', 'F02', 'evaso', '0005'),
('g567', '2017-11-15', '2017-11-20', 'consegnato', 'F01', 'evaso', '0009'),
('n689', '2018-02-07', NULL, 'non spedito', 'F04', 'incompleto', '0009'),
('k078', '2017-12-11', '2018-02-01', 'consegnato', 'F01', 'evaso', '0009'),
('a455', '2018-01-23', NULL, 'non spedito', 'F05', 'incompleto', '0009'),
('v980', '2018-01-02', '2018-02-01', 'consegnato', 'F02', 'evaso', '0009'),
('h809', '2017-03-15', '2017-04-20', 'consegnato', 'F02', 'evaso', '0013'),
('q134', '2017-11-07', NULL ,'non spedito', 'F02', 'incompleto', '0013'),
('x444', '2017-11-11', '2018-01-01', 'consegnato', 'F04', 'evaso', '0013'),
('l098', '2018-01-01', NULL, 'non spedito', 'F05', 'incompleto', '0013'),
('y679', '2018-01-20', '2018-01-31', 'consegnato', 'F03', 'evaso', '0013'),
('n780', '2017-06-15', '2017-08-20', 'consegnato', 'F05', 'evaso', '0015'),
('w235', '2017-12-07', NULL,'non spedito', 'F04', 'incompleto', '0015'),
('m985', '2017-12-25', '2018-02-02', 'consegnato', 'F03', 'evaso', '0015'),
('r332', '2018-02-09', NULL, 'non spedito', 'F01', 'incompleto', '0015'),
('v212', '2018-01-05', '2018-02-08', 'consegnato', 'F02', 'evaso', '0015');



INSERT INTO VenditaIntegratori VALUES
('F01', 'Malto Dextrin', '10'),('F01', 'Creatin Powder', '12'),('F01', 'Glut BBC', '14'),
('F01', 'MGK VIS', '9'),('F01', 'Marlin 323', '11'),('F01', 'Epalin C', '18'),('F01', 'Taurine Tablets', '20'),
('F02', 'Malto Dextrin', '15'),('F02', 'Creatin Powder', '7'),('F02', 'Glut BBC', '9'),
('F02', 'MGK VIS', '13'),('F02', 'Marlin 323', '11'),('F02', 'Epalin C', '14'),('F02', 'Taurine Tablets', '18'),
('F03', 'Malto Dextrin', '12'),('F03', 'Creatin Powder', '12'),('F03', 'Glut BBC', '9'),
('F03', 'MGK VIS', '7'),('F03', 'Marlin 323', '19'),('F03', 'Epalin C', '10'),('F03', 'Taurine Tablets', '17'),
('F04', 'Malto Dextrin', '8'),('F04', 'Creatin Powder', '14'),('F04', 'Glut BBC', '10'),
('F04', 'MGK VIS', '12'),('F04', 'Marlin 323', '15'),('F04', 'Epalin C', '14'),('F04', 'Taurine Tablets', '21'),
('F05', 'Malto Dextrin', '11'),('F05', 'Creatin Powder', '18'),('F05', 'Glut BBC', '13'),
('F05', 'MGK VIS', '10'),('F05', 'Marlin 323', '15'),('F05', 'Epalin C', '13'),('F05', 'Taurine Tablets', '18');

INSERT INTO Magazzino VALUES
('M1','400', '150', '0001'),
('M5','400', '150', '0005'),
('M9','400', '150', '0009'),
('M13','400', '150', '0013'),
('M15','400', '150', '0015');

INSERT INTO DettagliMagazzino(`Magazzino`, `Integratore`,`Quantita`, `Prezzo`, `DataScadenza`) VALUES 
('M1', 'Malto Dextrin', '20', '13','2018-05-21'),
('M1', 'Creatin Powder', '14', '15','2018-12-21'),
('M1', 'Glut BBC', '17', '12','2018-07-01'),
('M1', 'MGK VIS', '20', '11','2018-08-11'),
('M1', 'Marlin 323', '18', '18','2018-04-24'),
('M1', 'Epalin C', '18', '15','2018-02-14'),
('M1', 'Taurine Tablets', '20', '20','2018-03-05'),
('M5', 'Malto Dextrin', '22', '11','2018-04-16'),
('M5', 'Creatin Powder', '14', '15','2018-09-13'),
('M5', 'Glut BBC', '16', '14','2018-11-26'),
('M5', 'MGK VIS', '15', '10','2018-12-03'),
('M5', 'Marlin 323', '19', '19','2018-04-11'),
('M5', 'Epalin C', '17', '16','2018-02-15'),
('M5', 'Taurine Tablets', '22', '21','2018-11-12'),
('M9', 'Malto Dextrin', '23', '13','2018-04-22'),
('M9', 'Creatin Powder', '19', '13','2018-08-06'),
('M9', 'Glut BBC', '19', '17','2018-11-07'),
('M9', 'MGK VIS', '25', '17','2018-12-04'),
('M9', 'Marlin 323', '19', '10','2018-10-09'),
('M9', 'Epalin C', '30', '11','2018-07-23'),
('M9', 'Taurine Tablets', '24', '24','2018-09-04'),
('M13', 'Malto Dextrin', '23', '13','2018-11-13'),
('M13', 'Creatin Powder', '19', '16','2018-04-28'),
('M13', 'Glut BBC', '20', '15','2018-03-11'),
('M13', 'MGK VIS', '27', '14','2018-02-13'),
('M13', 'Marlin 323', '18', '19','2018-05-21'),
('M13', 'Epalin C', '18', '19','2018-12-13'),
('M13', 'Taurine Tablets', '22', '18','2018-02-18'),
('M15', 'Malto Dextrin', '25', '19','2018-12-12'),
('M15', 'Creatin Powder', '34', '15','2018-07-09'),
('M15', 'Glut BBC', '17', '14','2018-07-13'),
('M15', 'MGK VIS', '26', '18','2018-03-02'),
('M15', 'Marlin 323', '10', '15','2018-10-22'),
('M15', 'Epalin C', '12', '18','2018-02-16'),
('M15', 'Taurine Tablets', '23', '20','2018-01-21');

INSERT INTO OrdiniCliente VALUES
('oc100', 'M1', '2017-11-02', '2017-11-04','00021'),
('oc101', 'M1', '2017-09-02', '2017-09-04','00001'),
('oc102', 'M9', '2017-03-02', '2017-04-04','00006'),
('oc103', 'M5', '2017-12-02', '2017-12-04','00009'),
('oc104', 'M5', '2017-12-02', '2017-12-09','00011'),
('oc105', 'M1', '2017-10-02', '2017-11-04','00015'),
('oc106', 'M13', '2017-07-02', '2017-11-04','00021'),
('oc107', 'M1', '2017-01-02', '2017-01-04','00003'),
('oc108', 'M15', '2017-05-02', '2017-05-14','00016'),
('oc109', 'M9', '2018-11-02', '2017-12-04','00023'),
('oc110', 'M15', '2018-01-22', '2018-01-30','00020'),
('oc111', 'M13', '2018-02-2', '2018-02-07','00002'),
('oc112', 'M13', '2018-01-29', '2018-01-30','00014'),
('oc113', 'M9', '2018-01-02', '2017-02-04','00017'),
('oc114', 'M5', '2018-01-02', '2017-01-08','00019'),
('oc115', 'M9', '2018-01-05', '2018-01-07','00007'),
('oc116', 'M1', '2017-02-02', '2017-11-04','00008'),
('oc117', 'M13', '2017-12-07', '2017-12-19','00018'),
('oc118', 'M15', '2017-08-02', '2017-11-04','00013'),
('oc119', 'M15', '2017-09-06', '2017-10-04','00011');

INSERT INTO DettagliOrdineC VALUES
('oc100', 'Marlin 323', '3'),('oc101', 'MGk VIS', '1'),
('oc102', 'Malto Dextrin', '3'),('oc103', 'Creatin Powder', '3'),
('oc104', 'Marlin 323', '3'),('oc105', 'Malto Dextrin', '3'),
('oc106', 'Epalin C', '3'),('oc107', 'Marlin 323', '3'),
('oc108', 'Taurine Tablets', '3'),('oc109', 'Creatin Powder', '3'),
('oc110', 'Marlin 323', '3'),('oc111', 'Epalin C', '3'),
('oc112', 'Malto Dextrin', '3'),('oc113', 'Marlin 323', '3'),
('oc114', 'Glut BBC', '3'),('oc115', 'Creatin Powder', '3'),
('oc116', 'Marlin 323', '3'),('oc117', 'Epalin C', '3'),
('oc118', 'Taurine Tablets', '3'),('oc119', 'Glut BBC', '3');
--
INSERT INTO Utenti VALUES -- LV.CREDIBILITA'
('Utente01','0','0','psw01','00001'),
('Utente02','0','0','psw02','00002'),
('Utente03','0','0','psw03','00003'),
('Utente04','0','0','psw04','00004'),
('Utente05','0','0','psw05','00005'),
('Utente06','0','0','psw06','00006'),
('Utente07','0','0','psw07','00007'),
('Utente08','0','0','psw08','00008'),
('Utente09','0','0','psw09','00009'),
('Utente10','0','0','psw10','00010'),
('Utente11','0','0','psw11','00011'),
('Utente12','0','0','psw12','00012'),
('Utente13','0','0','psw13','00013'),
('Utente14','0','0','psw14','00014'),
('Utente15','0','0','psw15','00015'),
('Utente16','0','0','psw16','00016'),
('Utente17','0','0','psw17','00017'),
('Utente18','0','0','psw18','00018'),
('Utente19','0','0','psw19','00019'),
('Utente20','0','0','psw20','00020'),
('Utente21','0','0','psw21','00021'),
('Utente22','0','0','psw22','00022'),
('Utente23','0','0','psw23','00023'),
('Utente24','0','0','psw24','00024'),
('Utente25','0','0','psw25','00025');

INSERT INTO Post VALUES
('post01','Alimentazione','Ciao, Mi consigliereste una dieta per dimagrire nel minor tempo possibile?','Utente21','2017-12-03','11:23:0000'),
('post02','Sfide','Siete in grado di battere la mia sfida? +40kg di panca in sole due settimane!','Utente01','2017-07-15','01:12:0000'),
('post03','Macchinari e Attrezzature','Ciao mi sapreste dire come vi trovate con il Leg Press? Buon Anno a tutti comunque!','Utente07','2018-01-02','13:14:0000'),
('post04','Sfide','Avete 3 mesi per completare questa sfida da oggi, dimagrite del 5% la vostra massa grassa! Coraggio!','Utente09','2017-04-29','13:04:0000'),
('post05','Sfide','Percorrere 20km in una settimana, chi accetta la mia sfida?','Utente12','2017-03-01','09:47:0000');

INSERT INTO Commenti VALUES
('com01','2','No','Utente13','2017-12-03','17:32:0000','post01'),
('com02','5','Dieta Scarsdale, e dura solo 14 giorni!','Utente23','2017-12-03','12:34:0000','post01'),
('com03','4','Prova la dieta Atkins, è iperproteica!','Utente19','2017-12-03','14:12:0000','post01'),
('com04','3','Ultimamente consigliano la dieta Zona, dacci una occhiata :)','Utente15','2017-12-03','14:22:0000','post01'),
('com05','3','La cosa migliore è mangiare poco di tutto, secondo me','Utente11','2017-12-04','11:33:0000','post01'),
('com06','2','Invece di cercare diete, vieni piu volte ad allenarti!','Utente05','2017-12-04','14:23:0000','post01'),
('com07','5','Ahahah bella questa, mi sa che proverò!','Utente07','2017-07-15','06:34:0000','post02'),
('com08','4','Ma sei fortissimo :OO','Utente23','2017-07-15','08:13:0000','post02'),
('com09','3','Chi è cosi pazzo da accettare? :S','Utente04','2017-07-15','08:17:0000','post02'),
('com10','3','Menomale ogni tanto pubblicano sfide interessanti','Utente12','2017-07-15','09:23:0000','post02'),
('com11','4','Non ci sono sfide difficili per me :)','Utente21','2017-07-16','15:27:0000','post02'),
('com12','3','Tentar non nuoce','Utente15','2017-07-15','19:13:0000','post02'),
('com13','4','Molto bene, permette di allenare 3 muscoli delle gambe contemporanemante','Utente14','2018-01-02','13:19:0000','post03'),
('com14','3','Preferisco la pressa :P','Utente17','2018-01-02','14:03:0000','post03'),
('com15','5','Benissimo, provala assolutamente','Utente25','2018-01-02','14:35:0000','post03'),
('com16','3','Deludente..','Utente13','2018-01-02','14:47:0000','post03'),
('com17','4','Molto buona, peccato non sia regolabile anche la inclinazione','Utente01','2018-01-02','14:54:0000','post03'),
('com18','3','Se dimagrisco ancora scompaio :O A questo giro salto!','Utente04','2017-04-29','13:04:0000','post04'),
('com19','3','Bene, mi sa che posterò anche una scheda alimentazione da usare per la sfida!','Utente12','2017-04-29','13:21:0000','post04'),
('com20','4','Sfida Accettata ;)','Utente21','2017-04-29','14:24:0000','post04'),
('com21','5','Cosa è la massa grassa? ahahah','Utente06','2017-04-29','15:12:0000','post04'),
('com22','3','Posterai anche una scheda allenamento da seguire?','Utente15','2017-04-29','15:37:0000','post04'),
('com23','2','Mi dispiace ma a questo giro passo..','Utente13','2017-04-29','13:42:0000','post04'),
('com24','4','10 minuti di Tapis Rouland non basteranno mi sa xD','Utente17','2017-03-01','09:51:0000','post05'),
('com25','4','Challenge Accepted!','Utente25','2017-03-01','10:24:0000','post05'),
('com26','3','Ho già una sfida in corso, mi dispiace :(','Utente21','2017-03-01','11:21:0000','post05'),
('com27','3','Divertente come sfida, forse non cosi difficile..','Utente03','2017-03-01','12:43:0000','post05'),
('com28','2','Non adoro correre però :S','Utente13','2017-03-01','12:32:0000','post05');

INSERT INTO Media VALUES
('https://link.com/2iad19d329/url.it','post01'),
('https://link.com/2e21ed89212/url.it','post03');

INSERT INTO Interessi VALUES
('int01','Nuoto','Utente01'),('int02','Calcio','Utente03'),
('int03','Basket','Utente21'),('int04','Tennis','Utente21'),
('int05','Pesca','Utente07'),('int06','Cartoni Animati','Utente12'),
('int07','Pokemon','Utente11'),('int08','Muscoli','Utente04'),
('int09','Sport','Utente24'),('int10','Nuoto','Utente03'),
('int11','Calcio','Utente17'),('int12','Pressa','Utente18'),
('int13','Tennis','Utente05'),('int14','Baseball','Utente02'),
('int15','Juve','Utente04'),('int16','Birra','Utente12'),
('int17','Shopping','Utente13'),('int18','Rally','Utente25'),
('int19','Pesca','Utente09'),('int20','Basket','Utente01'),
('int21','Calcio','Utente16'),('int22','Birra','Utente04'),
('int23','Juve','Utente12'),('int24','Cartoni Animati','Utente11'),
('int25','Pokemon','Utente12'),('int26','Sport','Utente18'),
('int27','Muscoli','Utente18'),('int28','Muscoli','Utente24');

INSERT INTO Cerchia VALUES
('cer01','Amanti Nuoto1'),('cer02','Amanti Calcio1'),
('cer03','Amanti Basket1'),('cer04','Amanti Tennis1'),
('cer05','Amanti Pesca1'),('cer06','Amanti Cartoni Animati'),
('cer07','Amanti Pokemon'),('cer08','Amanti Muscoli'),
('cer09','Amanti Sport'),('cer10','Amanti Nuoto2'),
('cer11','Amanti Calcio2'),('cer12','Amanti Pressa'),
('cer13','Amanti Tennis2'),('cer14','Amanti Baseball'),
('cer15','Amanti Juve '),('cer16','Amanti Birra'),
('cer17','Amanti Shopping'),('cer18','Amanti Rally'),
('cer19','Amanti Pesca2'),('cer20','Amanti Basket2'),
('cer21','Amanti Calcio3'),('cer22','Amanti Calcio e Nuoto1'),
('cer23','Amanti Juve e Birra'),('cer24','Amanti Cartoni Animati e Pokemon'),
('cer25','Amanti Pressa e Muscoli'),('cer26','Amanti Sport e Muscoli'),
('cer27','Amanti Calcio e Nuoto2');

INSERT INTO DettagliCerchia VALUES
('cer01','int01'),('cer02','int02'),('cer03','int03'),
('cer04','int04'),('cer05','int05'),('cer06','int06'),
('cer07','int07'),('cer08','int08'),('cer09','int09'),
('cer10','int10'),('cer11','int11'),('cer12','int12'),
('cer13','int13'),('cer14','int14'),('cer15','int15'),
('cer16','int16'),('cer17','int17'),('cer18','int18'),
('cer19','int19'),('cer20','int20'),('cer21','int21'),
('cer22','int01'),('cer22','int02'),('cer23','int15'),
('cer23','int16'),('cer24','int06'),('cer24','int07'),
('cer25','int12'),('cer25','int08'),('cer26','int08'),
('cer26','int09'),('cer27','int10'),('cer27','int11');

INSERT INTO UtentiCerchia VALUES
('cer01','Utente01'),('cer02','Utente03'),
('cer03','Utente21'),('cer04','Utente21'),
('cer05','Utente07'),('cer06','Utente12'),
('cer07','Utente11'),('cer08','Utente04'),
('cer09','Utente24'),('cer10','Utente03'),
('cer11','Utente17'),('cer12','Utente18'),
('cer13','Utente05'),('cer14','Utente02'),
('cer15','Utente04'),('cer16','Utente12'),
('cer17','Utente13'),('cer18','Utente25'),
('cer19','Utente09'),('cer20','Utente01'),
('cer21','Utente16'),('cer22','Utente03'),
('cer23','Utente12'),('cer23','Utente04'),
('cer24','Utente11'),('cer24','Utente12'),
('cer25','Utente18'),('cer26','Utente18'),
('cer26','Utente24'),('cer27','Utente03');

INSERT INTO Sfide VALUES
('post02', 'Potenziamento Muscolare', '2017-07-15', '2017-07-30', NULL,'t3', 'al15'),
('post04', 'Dimagrimento', '2017-04-29', '2017-07-29',NULL,'t30', 'al22'),
('post05', 'Distanza Percorsa', '2017-03-01', '2017-03-08',NULL,'t33', 'al33');

INSERT INTO PartecipantiSfida VALUES -- aggiorna totpsico.
( 'post02' , 'utente01', '0', '2017-07-15'),('post02','utente08','0','2017-07-16'),
( 'post02' , 'utente14', '0', '2017-07-16'),('post02','utente17','0','2017-07-19'),
( 'post02' , 'utente07', '0', '2017-07-17'),('post02','utente02','0','2017-07-20'),
( 'post02' , 'utente19', '0', '2017-07-21'),('post02','utente21','0','2017-07-20'),

( 'post04' , 'utente09', '0', '2017-04-29'),('post04','utente01', '0','2017-05-01'),
( 'post04' , 'utente07', '0', '2017-05-02'),('post04','utente13', '0','2017-05-02'),
( 'post04' , 'utente18', '0', '2017-05-04'),('post04','utente24', '0','2017-05-06'),
( 'post04' , 'utente21', '0', '2017-05-07'),('post04','utente03', '0','2017-05-03'),

( 'post05' , 'utente12', '0', '2017-03-01'),( 'post05' , 'utente22', '0', '2017-03-02'),
( 'post05' , 'utente06', '0', '2017-03-04'),( 'post05' , 'utente08', '0', '2017-03-04'),
( 'post05' , 'utente19', '0', '2017-03-05'),( 'post05' , 'utente11', '0', '2017-03-07'),
( 'post05' , 'utente05', '0', '2017-03-06'),( 'post05' , 'utente10', '0', '2017-03-04');

INSERT INTO ParametriPsicofisici VALUES
('Utente01','post02','2017-07-15','8','8','5'),
('Utente01','post02','2017-07-17','5','3','6'),
('Utente01','post02','2017-07-21','7','6','3'),
('Utente01','post02','2017-07-24','9','5','8'),
('Utente01','post02','2017-07-27','3','9','7'),--
('Utente02','post02','2017-07-20','9','3','4'),
('Utente02','post02','2017-07-22','8','9','7'),
('Utente02','post02','2017-07-25','4','8','8'),
('Utente02','post02','2017-07-27','3','7','4'),
('Utente07','post02','2017-07-17','3','4','9'),--
('Utente07','post02','2017-07-20','7','8','7'),
('Utente07','post02','2017-07-21','8','9','1'),
('Utente07','post02','2017-07-23','5','7','8'),
('Utente07','post02','2017-07-27','6','5','2'),--
('Utente08','post02','2017-07-16','4','2','2'), -- 16
('Utente08','post02','2017-07-19','6','3','1'), -- 17
('Utente08','post02','2017-07-21','9','5','7'), -- 15,5
('Utente08','post02','2017-07-22','4','7','4'),--  10
('Utente08','post02','2017-07-28','2','4','1'),-- 12,5
('Utente14','post02','2017-07-16','7','2','5'),
('Utente14','post02','2017-07-20','4','7','3'),
('Utente14','post02','2017-07-24','5','8','7'),
('Utente14','post02','2017-07-26','6','9','2'),--
('Utente17','post02','2017-07-19','6','3','3'),
('Utente17','post02','2017-07-22','8','6','2'),
('Utente17','post02','2017-07-23','9','7','5'),
('Utente17','post02','2017-07-24','4','8','4'),
('Utente17','post02','2017-07-28','7','9','8'),--
('Utente19','post02','2017-07-21','5','6','3'),
('Utente19','post02','2017-07-26','4','5','2'),
('Utente19','post02','2017-07-27','8','7','2'),
('Utente19','post02','2017-07-29','9','8','4'),
('Utente19','post02','2017-07-30','4','3','6'),--
('Utente21','post02','2017-07-20','4','7','6'),
('Utente21','post02','2017-07-24','4','8','8'),
('Utente21','post02','2017-07-27','8','3','9'),--
('Utente01','post04','2017-05-01','7','5','8'),
('Utente01','post04','2017-05-05','5','4','6'),
('Utente01','post04','2017-05-12','3','3','5'),
('Utente01','post04','2017-05-15','4','2','3'),
('Utente01','post04','2017-05-22','7','5','2'),
('Utente01','post04','2017-05-27','9','8','4'),
('Utente01','post04','2017-06-03','3','7','7'),--
('Utente03','post04','2017-05-03','4','4','3'),
('Utente03','post04','2017-05-07','5','5','2'),
('Utente03','post04','2017-05-12','7','7','1'),
('Utente03','post04','2017-05-18','8','9','9'),
('Utente03','post04','2017-05-24','1','8','4'),
('Utente03','post04','2017-05-30','4','6','5'),
('Utente07','post04','2017-05-02','8','3','5'),--
('Utente07','post04','2017-05-08','6','4','2'),
('Utente07','post04','2017-05-12','5','7','3'),
('Utente07','post04','2017-05-15','4','8','1'),
('Utente07','post04','2017-05-17','3','3','7'),
('Utente07','post04','2017-05-23','7','7','4'),
('Utente07','post04','2017-05-24','9','5','5'),
('Utente09','post04','2017-04-29','6','3','7'),--
('Utente09','post04','2017-05-29','8','7','5'),
('Utente09','post04','2017-05-04','9','5','3'),
('Utente09','post04','2017-05-07','7','3','7'),
('Utente09','post04','2017-05-09','4','4','5'),
('Utente09','post04','2017-05-13','5','7','6'),
('Utente09','post04','2017-05-17','7','6','3'), --
('Utente13','post04','2017-05-02','9','8','5'),
('Utente13','post04','2017-05-05','7','7','4'),
('Utente13','post04','2017-05-07','8','8','3'),
('Utente13','post04','2017-05-10','7','5','7'),
('Utente13','post04','2017-05-13','6','4','6'), --
('Utente18','post04','2017-05-04','4','7','2'),
('Utente18','post04','2017-05-08','5','5','3'),
('Utente18','post04','2017-05-12','7','3','4'),
('Utente18','post04','2017-05-15','8','5','5'),
('Utente18','post04','2017-05-17','9','4','7'),
('Utente18','post04','2017-05-21','5','7','8'), --
('Utente21','post04','2017-05-07','4','4','2'),
('Utente21','post04','2017-05-12','5','6','8'),
('Utente21','post04','2017-05-25','3','4','7'),
('Utente21','post04','2017-05-30','7','7','2'), --
('Utente24','post04','2017-05-06','6','3','4'),
('Utente24','post04','2017-05-10','3','8','2'),
('Utente24','post04','2017-05-12','2','9','4'),
('Utente24','post04','2017-05-16','8','3','5'),
('Utente24','post04','2017-05-18','7','4','7'), -- 
('Utente05','post05','2017-03-06','8','2','3'),
('Utente05','post05','2017-03-07','7','3','2'),
('Utente05','post05','2017-03-08','5','4','7'), --
('Utente06','post05','2017-03-04','8','5','2'),
('Utente06','post05','2017-03-06','4','9','3'),
('Utente06','post05','2017-03-08','2','8','4'), --
('Utente08','post05','2017-03-04','5','6','2'),
('Utente08','post05','2017-03-06','3','8','7'),
('Utente10','post05','2017-03-04','7','2','1'),
('Utente10','post05','2017-03-05','5','4','6'),
('Utente10','post05','2017-03-07','8','7','7'),
('Utente11','post05','2017-03-07','9','6','8'),
('Utente11','post05','2017-03-08','9','5','9'),
('Utente12','post05','2017-03-01','2','7','3'),
('Utente12','post05','2017-03-05','8','3','4'),
('Utente12','post05','2017-03-07','6','7','8'),
('Utente19','post05','2017-03-05','8','4','5'),
('Utente19','post05','2017-03-07','6','7','7'),
('Utente22','post05','2017-03-02','7','9','8');

INSERT INTO AllenamentoCustom values
('t14', 'utente01'),
('t06', 'utente17'),--
('t03', 'utente19'),--
('t05', 'utente09'),--
('t10', 'utente13'),
('t30', 'utente24'),
('t21', 'utente12'),
('t80', 'utente05'),
('t33', 'utente10');

INSERT INTO Configurazione VALUES
('t14','es002','LUN','40102','30',NULL,NULL,'15','3','60'),
('t14','es005','LUN','40103',NULL,NULL,'40','15','3','50'),
('t14','es006','LUN','40104',NULL,'30',NULL,'17','2','30'),
('t14','es011','MER','40105','30',NULL,NULL,'15','3','60'),
('t14','es012','MER','40106',NULL,NULL,NULL,'10','4','60'),
('t14','es013','MER','40107',NULL,'30',NULL,'10','2','30'),
('t14','es014','MER','40108',NULL,NULL,NULL,'12','4','60'),
('t14','es015','VEN','50101',NULL,NULL,'40','15','3','50'),
('t14','es016','VEN','50102',NULL,NULL,'40','20','3','50'),
('t06','es010','LUN','40102','30',NULL,NULL,'21','3','60'),
('t06','es012','LUN','40103',NULL,NULL,'40','21','3','50'),
('t06','es020','LUN','40104',NULL,'30',NULL,'17','2','30'),
('t06','es017','MER','40105','30',NULL,NULL,'16','3','60'),
('t06','es011','MER','40106',NULL,NULL,NULL,'14','4','60'),
('t06','es019','MER','40107',NULL,'30',NULL,'13','2','30'),
('t06','es004','MER','40108',NULL,NULL,NULL,'12','4','60'),
('t06','es007','VEN','50101',NULL,NULL,'40','11','3','50'),
('t06','es012','VEN','50102',NULL,NULL,'23','10','3','50'),--
('t03','es009','LUN','40102','30',NULL,NULL,'21','3','60'),
('t03','es014','LUN','40103',NULL,NULL,'40','21','3','50'),
('t03','es020','LUN','40104',NULL,'30',NULL,'17','2','30'),
('t03','es011','MER','40105','30',NULL,NULL,'16','3','60'),
('t03','es018','MER','40106',NULL,NULL,NULL,'14','4','60'),
('t03','es013','MER','40107',NULL,'30',NULL,'13','2','30'),
('t03','es006','MER','40108',NULL,NULL,NULL,'12','4','60'),
('t03','es011','VEN','50101',NULL,NULL,'40','11','3','50'),
('t03','es014','VEN','50102',NULL,NULL,'23','10','3','50'),
('t05','es003','MAR','50103','30','30',NULL,'15','3','40'),
('t05','es005','MAR','50104',NULL,NULL,'40','15','3','50'),
('t05','es009','MAR','50105','30','30',NULL,'15','3','40'),
('t05','es007','MAR','50106',NULL,NULL,'40','15','3','50'),
('t05','es008','GIO','50107','30','30',NULL,'15','3','40'),
('t05','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('t05','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('t05','es015','SAB','60102','30','30',NULL,'15','3','40'),
('t05','es020','SAB','60103',NULL,'30',NULL,'15','2','30'),
('t05','es017','SAB','60104','30',NULL,NULL,'15','3','60'),--
('t10','es012','MAR','50103','30','30',NULL,'15','3','40'),
('t10','es014','MAR','50104',NULL,NULL,'40','15','3','50'),
('t10','es015','MAR','50105','30','30',NULL,'15','3','40'),
('t10','es016','MAR','50106',NULL,NULL,'40','15','3','50'),
('t10','es009','GIO','50107','30','30',NULL,'17','3','40'),
('t10','es004','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('t10','es011','GIO','60101',NULL,'30',NULL,'20','2','30'),
('t10','es019','SAB','60102','30','30',NULL,'15','3','40'),
('t10','es020','SAB','60103',NULL,'30',NULL,'16','2','30'),
('t10','es011','SAB','60104','30',NULL,NULL,'15','3','60'),--
('t30','es015','MAR','50103','30','30',NULL,'21','3','40'),
('t30','es020','MAR','50104',NULL,NULL,'40','15','3','50'),
('t30','es017','MAR','50105','30','30',NULL,'13','3','40'),
('t30','es012','MAR','50106',NULL,NULL,'40','30','3','50'),
('t30','es006','GIO','50107','30','30',NULL,'15','3','40'),
('t30','es007','GIO','50108',NULL,NULL,NULL,'10','4','60'),
('t30','es008','GIO','60101',NULL,'30',NULL,'10','2','30'),
('t30','es001','SAB','60102','30','30',NULL,'10','3','40'),
('t30','es002','SAB','60103',NULL,'30',NULL,'20','2','30'),
('t30','es005','SAB','60104','30',NULL,NULL,'20','3','60'),--
('t21','es008','GIO','50107','30','30',NULL,'15','3','40'),
('t21','es011','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('t21','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('t21','es011','VEN','50101',NULL,NULL,'40','11','3','50'),
('t21','es014','VEN','50102',NULL,NULL,'23','10','3','50'),
('t21','es019','SAB','60102','30','30',NULL,'15','3','40'),
('t21','es020','SAB','60103',NULL,'30',NULL,'16','2','30'),
('t21','es011','SAB','60104','30',NULL,NULL,'15','3','60'),--
('t80','es009','GIO','50107','30','30',NULL,'15','3','40'),
('t80','es012','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('t80','es013','GIO','60101',NULL,'30',NULL,'15','2','30'),
('t80','es014','VEN','50101',NULL,NULL,'40','11','3','50'),
('t80','es017','VEN','50102',NULL,NULL,'23','10','3','50'),
('t80','es020','SAB','60102','30','30',NULL,'15','3','40'),
('t80','es013','SAB','60103',NULL,'30',NULL,'16','2','30'),
('t80','es014','SAB','60104','30',NULL,NULL,'15','3','60'),--
('t33','es016','GIO','50107','30','30',NULL,'15','3','40'),
('t33','es014','GIO','50108',NULL,NULL,NULL,'15','4','60'),
('t33','es012','GIO','60101',NULL,'30',NULL,'15','2','30'),
('t33','es010','VEN','50101',NULL,NULL,'40','11','3','50'),
('t33','es007','VEN','50102',NULL,NULL,'23','10','3','50'),
('t33','es005','SAB','60102','30','30',NULL,'15','3','40'),
('t33','es020','SAB','60103',NULL,'30',NULL,'16','2','30'),
('t33','es017','SAB','60104','30',NULL,NULL,'15','3','60');

INSERT INTO PastiCustom VALUES
('pc001','150','Pasta alla carbonara'),
('pc002','210','Pasta al pesto rosso'),
('pc003','250','Risotto al radicchio'),
('pc004','150','Minestrone di lenticchie'),
('pc005','120','Pasta cacio e pepe'),
('pc006','150','Tortellini in brodo'),
('pc007','250','Pennette al ragu'),
('pc008','220','Gnocchi al pomodoro'),
('pc009','300','Risotto allo scoglio'),
('pc010','230','Farfalline alle noci'),
('pc011','450','Bistecca di maiale'),
('pc012','500','Bistecca di vitella'),
('pc013','250','Petto di pollo alla piastra'),
('pc014','300','Bracioline alla salvia'),
('pc015','250','Insalata Nizzarda'),
('pc016','340','Pollo arrosto'),
('pc017','320','Arrosticini di tacchino'),
('pc018','230','Panino al prosciutto'),
('pc019','500','Pizza'),
('pc020','150','Latte e biscotti'),
('pc021','150','Latte e cereali'),
('pc022','230','Pane e nutella'),
('pc023','130','Caffè e Mela'),
('pc024','270','Pane, Burro e Marmellata');

INSERT INTO AlimentazioneCustom VALUES
 ('al3' , 'utente01'),
 ('al12', 'utente08'),
 ('al15', 'utente02'),
 ('al31', 'utente09'),
 ('al22', 'utente21'),
 ('al55', 'utente03'),
 ('al33', 'utente12'),
 ('al56', 'utente08'),
 ('al70', 'utente11');
 
 INSERT INTO CalendarioDietaC VALUES
('al3', 'lun', '3') , ('al3', 'mar','3'),('al3','mer','3'),('al3','gio','3'),('al3','ven','3'),('al3','sab','3'),('al3','dom','2'),
('al12', 'lun', '3'), ('al12', 'mar','3'),('al12','mer','3'),('al12','gio','3'),('al12','ven','3'),('al12','sab','3'),('al12','dom','2'),
('al15', 'lun', '3'), ('al15', 'mar','3'),('al15','mer','3'),('al15','gio','3'),('al15','ven','3'),('al15','sab','3'),('al15','dom','2'),
   
('al31', 'lun', '3'), ('al31', 'mar','3'),('al31','mer','3'),('al31','gio','3'),('al31','ven','3'),('al31','sab','3'),('al31','dom','2'),
('al22', 'lun', '3'), ('al22', 'mar','3'),('al22','mer','3'),('al22','gio','3'),('al22','ven','3'),('al22','sab','3'),('al22','dom','2'),
('al55', 'lun', '3'), ('al55', 'mar','3'),('al55','mer','3'),('al55','gio','3'),('al55','ven','3'),('al55','sab','3'),('al55','dom','2'),
      
('al33', 'lun', '3'), ('al33', 'mar','3'),('al33','mer','3'),('al33','gio','3'),('al33','ven','3'),('al33','sab','3'),('al33','dom','2'),
('al56', 'lun', '3'), ('al56', 'mar','3'),('al56','mer','3'),('al56','gio','3'),('al56','ven','3'),('al56','sab','3'),('al56','dom','2'),
('al70', 'lun', '3'), ('al70', 'mar','3'),('al70','mer','3'),('al70','gio','3'),('al70','ven','3'),('al70','sab','3'),('al70','dom','2');
 
INSERT INTO DettagliDietaCustom VALUES
('pc023','al3','LUN','Colazione'),('pc001','al3','LUN','Pranzo'),('pc005','al3','LUN','Cena'),('pc014','al3','LUN','Cena'),
('pc020','al3','MAR','Colazione'),('pc003','al3','MAR','Pranzo'),('pc008','al3','MAR','Cena'),('pc013','al3','MAR','Cena'),
('pc022','al3','MER','Colazione'),('pc007','al3','MER','Pranzo'),('pc006','al3','MER','Cena'),('pc011','al3','MER','Cena'),
('pc021','al3','GIO','Colazione'),('pc010','al3','GIO','Pranzo'),('pc003','al3','GIO','Cena'),('pc017','al3','GIO','Cena'),
('pc020','al3','VEN','Colazione'),('pc006','al3','VEN','Pranzo'),('pc002','al3','VEN','Cena'),('pc019','al3','VEN','Cena'),
('pc020','al3','SAB','Colazione'),('pc007','al3','SAB','Pranzo'),('pc008','al3','SAB','Cena'),('pc015','al3','SAB','Cena'),
('pc021','al3','DOM','Colazione'),('pc003','al3','DOM','Cena'),('pc011','al3','DOM','Cena'), 
('pc023','al31','LUN','Colazione'),('pc003','al31','LUN','Pranzo'),('pc009','al31','LUN','Cena'),('pc014','al31','LUN','Cena'),
('pc024','al31','MAR','Colazione'),('pc005','al31','MAR','Pranzo'),('pc006','al31','MAR','Cena'),('pc016','al31','MAR','Cena'),
('pc020','al31','MER','Colazione'),('pc007','al31','MER','Pranzo'),('pc009','al31','MER','Cena'),('pc012','al31','MER','Cena'),
('pc022','al31','GIO','Colazione'),('pc007','al31','GIO','Pranzo'),('pc006','al31','GIO','Cena'),('pc018','al31','GIO','Cena'),
('pc022','al31','VEN','Colazione'),('pc003','al31','VEN','Pranzo'),('pc007','al31','VEN','Cena'),('pc014','al31','VEN','Cena'),
('pc024','al31','SAB','Colazione'),('pc010','al31','SAB','Pranzo'),('pc009','al31','SAB','Cena'),('pc019','al31','SAB','Cena'),
('pc021','al31','DOM','Colazione'),('pc004','al31','DOM','Cena'),('pc015','al31','DOM','Cena'), 
('pc022','al33','LUN','Colazione'),('pc008','al33','LUN','Pranzo'),('pc005','al33','LUN','Cena'),('pc013','al33','LUN','Cena'),
('pc023','al33','MAR','Colazione'),('pc009','al33','MAR','Pranzo'),('pc002','al33','MAR','Cena'),('pc015','al33','MAR','Cena'),
('pc024','al33','MER','Colazione'),('pc010','al33','MER','Pranzo'),('pc009','al33','MER','Cena'),('pc017','al33','MER','Cena'),
('pc022','al33','GIO','Colazione'),('pc004','al33','GIO','Pranzo'),('pc007','al33','GIO','Cena'),('pc015','al33','GIO','Cena'),
('pc024','al33','VEN','Colazione'),('pc003','al33','VEN','Pranzo'),('pc008','al33','VEN','Cena'),('pc017','al33','VEN','Cena'),
('pc022','al33','SAB','Colazione'),('pc002','al33','SAB','Pranzo'),('pc004','al33','SAB','Cena'),('pc011','al33','SAB','Cena'),
('pc023','al33','DOM','Colazione'),('pc001','al33','DOM','Cena'),('pc012','al33','DOM','Cena');

-- ---------- --
-- OPERAZIONI --
-- ---------- --

-- OPERAZIONE 1 -- Dato un utente restituire il numero di commenti pubblicati da esso su post relativi ad altri utenti.
/*
DROP TRIGGER IF EXISTS Imposta_NumCommenti; -- Trigger che aggiorna la ridondanza
DELIMITER $$
CREATE TRIGGER Imposta_NumCommenti
AFTER INSERT ON Commenti 
FOR EACH ROW
BEGIN 

DECLARE _utente VARCHAR(50) DEFAULT '';

SELECT Utente INTO _utente
FROM Post
WHERE CodPost = NEW.Post;

IF _utente <> NEW.Utente THEN

UPDATE Utenti
SET NumCommenti = NumCommenti + 1
WHERE Username = NEW.Utente;

END IF;


END $$
DELIMITER ;
*/

DROP PROCEDURE IF EXISTS Stampa_NumCommenti; 
DELIMITER $$
CREATE PROCEDURE Stampa_NumCommenti(IN _utente VARCHAR(50))
BEGIN

SELECT NumCommenti
FROM Utenti
WHERE Username = _utente;

END $$
DELIMITER ;

-- CALL Stampa_NumCommenti('Utente21');

-- OPERAZIONE 2 -- Dato il codice di un post relativo ad una sfida, stampare il codice del 	vincitore

DROP PROCEDURE IF EXISTS Setta_Vincitore; -- Aggiornamento Vincitore 
DELIMITER $$
CREATE PROCEDURE Setta_Vincitore(IN _codicesfida VARCHAR(50))
BEGIN

DECLARE _scopo VARCHAR(50) DEFAULT '';
DECLARE _utente VARCHAR(50) DEFAULT '';
DECLARE _vincitore VARCHAR(50) DEFAULT NULL;
DECLARE punteggio_finale INT DEFAULT 0;
DECLARE punteggio_ INT DEFAULT 0;
DECLARE numero_sessioni INT DEFAULT 0;
DECLARE totale_psicofisico INT DEFAULT 0;
DECLARE durata INT DEFAULT 0;
DECLARE finito INT DEFAULT 0;
DECLARE data_inizio DATE;
DECLARE data_fine DATE;

DECLARE cursore_utenti CURSOR FOR
	SELECT Utente 
    FROM PartecipantiSfida
    WHERE Sfida = _codicesfida;
    
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito = 1;

SELECT Scopo INTO _scopo
FROM Sfide
WHERE CodSfida = _codicesfida;

IF (_scopo = 'Potenziamento Muscolare' OR _scopo = 'Dimagrimento') THEN
BEGIN

OPEN cursore_utenti;

scan: LOOP

FETCH cursore_utenti INTO _utente;

IF finito = 1 THEN
	LEAVE scan;
END IF;

SELECT COUNT(*) INTO numero_sessioni
FROM ParametriPsicofisici
WHERE Utente = _utente
	AND Sfida = _codicesfida;
    
SELECT TotPsicofisico INTO totale_psicofisico
FROM PartecipantiSfida
WHERE Utente = _utente
	AND Sfida = _codicesfida;
    
SELECT MIN(Data) INTO data_inizio
FROM ParametriPsicofisici
WHERE Utente = _utente
	AND Sfida = _codicesfida;
    
SELECT MAX(Data) INTO data_fine
FROM ParametriPsicofisici
WHERE Utente = _utente
	AND Sfida = _codicesfida;

SELECT DATEDIFF(data_inizio,data_fine) INTO durata;

SET punteggio_ = 10*(numero_sessioni/durata) + totale_psicofisico;

IF punteggio_ > punteggio_finale THEN 
	SET punteggio_finale = punteggio_;
	SET _vincitore = _utente;
END IF;

END LOOP;

CLOSE cursore_utenti;

UPDATE Sfide
SET Vincitore = _vincitore
WHERE CodSfida = _codicesfida;

END ;
END IF;

IF _scopo = 'Distanza Percorsa' THEN
BEGIN

OPEN cursore_utenti;

scan: LOOP

FETCH cursore_utenti INTO _utente;

IF finito = 1 THEN
	LEAVE scan;
END IF;

SELECT COUNT(*) INTO numero_sessioni
FROM ParametriPsicofisici
WHERE Utente = _utente
	AND Sfida = _codicesfida;
    
SELECT TotPsicofisico INTO totale_psicofisico
FROM PartecipantiSfida
WHERE Utente = _utente
	AND Sfida = _codicesfida;

SET punteggio_ = 10/(numero_sessioni) + totale_psicofisico;

IF punteggio_ > punteggio_finale THEN 
	SET punteggio_finale = punteggio_;
	SET _vincitore = _utente;
END IF;

END LOOP;

CLOSE cursore_utenti;

UPDATE Sfide
SET Vincitore = _vincitore
WHERE CodSfida = _codicesfida;

END ;
END IF;

END $$
DELIMITER ;

DROP EVENT IF EXISTS Settaggio_Vincitori; -- EVENT CHE GESTISCE LA RIDONDANZA
DELIMITER $$
CREATE EVENT Settaggio_Vincitori
ON SCHEDULE EVERY 1 DAY DO
BEGIN

DECLARE _sfida VARCHAR(50) DEFAULT '';
DECLARE finito INT DEFAULT 0;

DECLARE cursore_sfide CURSOR FOR
	SELECT CodSfida
    FROM Sfide
    WHERE DataFine = CURRENT_DATE ;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito = 1;
    
OPEN cursore_sfide;
    
scan: LOOP

FETCH cursore_sfide INTO _sfida;
IF finito = 1 THEN
	LEAVE scan;
END IF;

CALL SettaVincitore ( _sfida);

END LOOP;

CLOSE cursore_sfide;


END $$
DELIMITER ;

/*
CALL Setta_Vincitore ('post02');
CALL Setta_Vincitore ('post04');
CALL Setta_Vincitore ('post05');*/

DROP PROCEDURE IF EXISTS Stampa_Vincitore; -- Stampa il vincitore
DELIMITER $$
CREATE PROCEDURE Stampa_Vincitore(IN _codicesfida VARCHAR(50))
BEGIN

SELECT Vincitore
FROM Sfide 
WHERE CodSfida = _codicesfida;


END $$
DELIMITER ;

-- CALL Stampa_Vincitore('post02');

-- OPERAZIONE 3 -- Dato il codice di un centro fitness, restituire per ogni integratore 
-- contenuto nel magazzino il numero di scatole e il totale di scatole presenti nel magazzino

DROP PROCEDURE IF EXISTS Operazione3;
DELIMITER $$
CREATE PROCEDURE Operazione3( IN Centro_Fitness VARCHAR(50)) 
BEGIN

IF Centro_Fitness NOT IN (SELECT CodCentro
							FROM centrofitness)
THEN SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Errore, Centro Fitness non trovato';
END IF;

SET @magazzino = ( SELECT CodMagazzino
					FROM Magazzino
                    WHERE Centro = Centro_Fitness);

SELECT DM.Integratore, DM.Quantita, (SELECT SUM(DM1.Quantita)
									FROM DettagliMagazzino DM1
									WHERE DM1.Magazzino = @magazzino) as TotScatoleMagazzino
FROM DettagliMagazzino DM
WHERE DM.Magazzino = @magazzino
GROUP BY DM.Integratore;
END $$
DELIMITER ;

-- call Operazione3('0001'); 

--  OPERAZIONE 4 -- Dato il codice di un centro fitness, restituire il corso più frequentato tenuto in esso e il Nome e Cognome di chi tiene il corso.
-- In caso di EX-EQUO restituirne uno
DROP PROCEDURE IF EXISTS Stampa_CorsoMaxFreq;
DELIMITER $$
CREATE PROCEDURE Stampa_CorsoMaxFreq(IN _codicecentro VARCHAR(50))
BEGIN

DECLARE _corso VARCHAR(50) DEFAULT '';
DECLARE _partecipanti INT DEFAULT 0;
DECLARE _totpartecipanti INT DEFAULT 0;
DECLARE _corsofinale VARCHAR(50) DEFAULT '';
DECLARE finito INT DEFAULT 0;

DECLARE cursore_corsi CURSOR FOR
	SELECT C.CodCorso
	FROM SaleAllenamento SA  INNER JOIN Corsi C ON SA.CodSala = C.Sala
	WHERE SA.Centro = _codicecentro ; 

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito =1 ;

OPEN cursore_corsi;
scan: LOOP
FETCH cursore_corsi INTO _corso;
IF finito = 1 THEN
	LEAVE scan;
END IF;

SELECT COUNT(*) INTO _partecipanti
FROM IscrizioneCorso
WHERE Corso = _corso;

IF _partecipanti > _totpartecipanti THEN
	SET _totpartecipanti = _partecipanti;
    SET _corsofinale = _corso;
END IF;

END LOOP;
CLOSE cursore_corsi;

SELECT Corso,Nome,Cognome
FROM IstruttoreCorsi INNER JOIN Dipendente ON Istruttore=CodFiscale
WHERE Corso = _corsofinale;


END $$
DELIMITER ;

-- CALL Stampa_CorsoMaxFreq('0001');

-- OPERAZIONE 5 --
/* Dato il codice fiscale di un cliente, restituire il codice del contratto	 	
più costoso sottoscritto da esso; se questo è un contratto multisede,
elencare 	anche il numero di sedi alle quali il cliente aveva accesso.*/

-- IN CASO DI EX EQUO NON RESTITUISCE NIENTE --

DROP TABLE IF EXISTS Oper5;
CREATE TABLE Oper5(
CodContratto VARCHAR(50),
tipo VARCHAR(50),
CostoTot int,
primary key(CodContratto))
engine=innodb default charset=latin1;

DROP PROCEDURE IF EXISTS Operazione5;
DELIMITER $$
CREATE PROCEDURE Operazione5( IN Codice_Fiscale VARCHAR(50)) 
BEGIN

DECLARE _contratto VARCHAR(50) DEFAULT '';
DECLARE _tipo VARCHAR(50) DEFAULT '';

TRUNCATE TABLE Oper5;

IF Codice_Fiscale not in (SELECT CodFiscale
							FROM Cliente)
THEN SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Cliente, non presente';
END IF;

INSERT INTO Oper5(
SELECT c.codcontratto, c.tipologia, (c.costomensile/30 * DATEDIFF(c.datafine, c.datainizio)) AS SPESA
FROM Contratto c
WHERE c.cliente = Codice_Fiscale);

SELECT o.codcontratto, o.tipo into _contratto, _tipo
FROM Oper5 O
WHERE O.CostoTot = ( SELECT max(o1.Costotot)
						FROM Oper5 o1);
                        
IF _contratto = '' THEN 
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Il Cliente non ha mai stipulato un contratto con costo maggiore rispetto a tutti gli altri';
END IF;

IF _tipo = 'Personalizzato' THEN
	begin
	SELECT sa.codcontratto as Contratto, sa.codcentro as SediAccessibili
    FROM SediAccessibili sa
    WHERE sa.codcontratto = _contratto;
    end;
elseif _tipo <> 'Personalizzato' THEN
	SELECT _contratto as Contratto;
    
 END IF;
 
END $$
DELIMITER ;

-- CALL Operazione5 ('00004'); -- Caso non multisede
-- CALL Operazione5 ('00005'); -- Caso multisede

-- OPERAZIONE 6 --
/*Appena un cliente entra nel Centro Fitness, assegnargli un 	
armadietto e stampare il numero di armadietti successivamente disponibili */

DROP TRIGGER IF EXISTS Assegna_Armadietto;
DELIMITER $$
CREATE TRIGGER Assegna_Armadietto
BEFORE INSERT ON AccessoCliente
FOR EACH ROW
BEGIN

DECLARE _armadietto VARCHAR(50) DEFAULT '';

SELECT CodArmadietto INTO _armadietto
FROM Armadietto
WHERE Stato = 'Libero'
AND Spogliatoio IN (
	SELECT CodSpogliatoio
    FROM Spogliatoi
    WHERE Centro = NEW.Centro
    )
LIMIT 1;

IF _armadietto = '' THEN 
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Armadietti disponibili terminati';
END IF;

SET NEW.Armadietto = _armadietto;

UPDATE Armadietto
SET Combinazione = CONCAT('psw_', _armadietto) 
WHERE CodArmadietto = _armadietto;

UPDATE Armadietto
SET Stato = 'Occupato'
WHERE CodArmadietto = _armadietto;

UPDATE Armadietto
SET OrarioOccupazione = NEW.OraIngresso
WHERE CodArmadietto = _armadietto;


END $$
DELIMITER ;

DROP EVENT IF EXISTS libera_armadietti;
DELIMITER $$
CREATE EVENT libera_armadietti
ON SCHEDULE EVERY 1 HOUR DO
BEGIN

DECLARE finito INT DEFAULT 0;
DECLARE _armadietto VARCHAR(50) DEFAULT '';
DECLARE _orario TIME;


DECLARE cursore_armadietti CURSOR FOR
	SELECT CodArmadietto,OrarioOccupazione
	FROM Armadietto
	WHERE Stato = 'Occupato';

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito = 1;

OPEN cursore_armadietti;

scan: LOOP
FETCH cursore_armadietti INTO _armadietto, _orario;

IF finito = 1 THEN
	LEAVE scan;
END IF;

IF CURRENT_TIME > ADDTIME(_orario,'05:00:0000') THEN
BEGIN

	UPDATE Armadietto
    SET Stato = 'Libero'
    WHERE CodArmadietto = _armadietto;
    
    UPDATE Armadietto
    SET Combinazione = '0000'
    WHERE CodArmadietto = _armadietto;
    
    UPDATE Armadietto
    SET OrarioOccupazione = NULL
    WHERE CodArmadietto = _armadietto;
    
    
END;
END IF;

END LOOP;

END $$
DELIMITER ;

/*INSERT INTO AccessoCliente VALUES 
('00029','2018-01-09','12:00:0000','13:00:0000','0005','nessuno',NULL);

SELECT *
FROM AccessoCliente
WHERE Cliente = '00029';

SELECT *
FROM Armadietto;
*/

-- OPERAZIONE 7 --
/*Dato il codice fiscale di un nutrizionista, restituire la dieta con il 	
minor apporto calorico giornaliero prescritta da quel nutrizionista*/

/*
DROP TRIGGER IF EXISTS ApportoCalorico; -- TRIGGER INSERITO SOPRA
DELIMITER $$
CREATE TRIGGER ApportoCalorico
AFTER INSERT ON ComposizioneDieta
FOR EACH ROW
BEGIN

DECLARE _appcalorico INT DEFAULT 0;

SELECT AVG(p.apportocalorico) INTO _appcalorico
FROM ComposizioneDieta cd inner join pasto p on p.codpasto = cd.pasto
WHERE cd.schedaalimentazione = NEW.schedaalimentazione;

UPDATE SchedaAlimentazione sa
SET sa.apportogiornaliero = _appcalorico
WHERE sa.codscheda = new.schedaalimentazione;

END$$
DELIMITER ;*/

DROP PROCEDURE IF EXISTS Operazione7;
DELIMITER $$
CREATE PROCEDURE Operazione7(IN Nutrizionista VARCHAR(50))
BEGIN

SELECT sa.codscheda, sa.apportogiornaliero
FROM visitadieta vd INNER JOIN schedaalimentazione sa ON sa.codscheda = vd.schedaalimentazione
WHERE vd.nutrizionista = Nutrizionista
	AND sa.apportogiornaliero < ALL (		SELECT sa1.apportogiornaliero
											FROM visitadieta vd1 INNER JOIN schedaalimentazione sa1 
													ON sa1.codscheda = vd1.schedaalimentazione
											WHERE vd1.nutrizionista = Nutrizionista
													 AND vd1.schedaalimentazione <> sa.codscheda
                                                    );
END $$
DELIMITER ;

/*
DELETE FROM VisitaDieta -- DELETE DI SUPPORTO
WHERE nutrizionista = 'eee7'
    AND (schedaalimentazione = 'ali002'
    OR schedaalimentazione = 'ali006'
    OR schedaalimentazione = 'ali008'
    OR schedaalimentazione = 'ali012'
    OR schedaalimentazione = 'ali014'
    OR schedaalimentazione = 'ali018'
    OR schedaalimentazione = 'ali024'
    OR schedaalimentazione = 'ali026'
    OR schedaalimentazione = 'ali028');

-- call operazione7('eee7');

INSERT INTO visitadieta 
VALUES ('eee7','00024','ali002','2018-01-19'),
('eee7','00020','ali006','2017-06-28'),('eee7','00018','ali008','2017-05-13'),('eee7','00014','ali012','2017-03-22'),
('eee7','00008','ali018','2017-05-13'),('eee7','00002','ali024','2017-04-20'),('eee7','00012','ali026','2017-03-11');

*/

-- OPERAZIONE 8 --
/*Dato un centro fitness, inserire un nuovo macchinario nella sala di
allenamento contenente il minor numero di macchinari. 
A parità di numero di attrezzature, inserire nella sala con rank più basso.*/

/*
DROP TRIGGER IF EXISTS AggiortaTotAttrezzi; -- TRIGGER AGGIUNTO SOPRA
DELIMITER $$
CREATE TRIGGER AggiortaTotAttrezzi
AFTER INSERT ON Apparecchiature
FOR EACH ROW
BEGIN

UPDATE SaleAllenamento Sa
SET Sa.totattrezzi = sa.totattrezzi + 1
WHERE Sa.codSala = new.sala;


END $$

DELIMITER ;*/

DROP PROCEDURE IF EXISTS Operazione8;
DELIMITER $$
CREATE PROCEDURE Operazione8(IN CentroFit VARCHAR(50), IN CodMacchinario VARCHAR(50), IN Macchinario VARCHAR(50), IN Usura int, IN AppCalorico int)
BEGIN

DECLARE _Sala VARCHAR(50) DEFAULT '';
DECLARE _Rank VARCHAR(50) DEFAULT '';
DECLARE finito INT DEFAULT 0;

DECLARE Cursore_Sale CURSOR FOR (
SELECT sa.codsala, sa.rank
FROM SaleAllenamento sa
WHERE sa.centro = CentroFit
	AND sa.TotAttrezzi <= All ( SELECT sa1.TotAttrezzi
							FROM SaleAllenamento sa1 
                            WHERE sa1.centro = CentroFit
									and sa1.codsala <> sa.codsala)
ORDER BY ( 
			CASE 
            WHEN (sa.rank = 'Silver') THEN 0
				WHEN (sa.rank = 'Gold') THEN 1
					WHEN (sa.rank = 'Platinum') THEN 2
			END), sa.rank);
                                   
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito = 1;

OPEN Cursore_Sale;

scan: LOOP
    
    IF finito = 1 THEN
		LEAVE scan;
	END IF;
    
    FETCH Cursore_Sale into _Sala, _Rank;
	
    IF _Rank = 'Silver' THEN
		INSERT INTO Apparecchiature
        VALUES( CodMacchinario,  Macchinario,  Usura ,  AppCalorico, _Sala);
		SELECT CONCAT('Attrezzo ', CodMacchinario, ' inserito nella sala ', _Sala) as CodSala;
	LEAVE scan;
	END IF;
    
	IF _Rank = 'Gold' THEN
		INSERT INTO Apparecchiature
        VALUES( CodMacchinario,  Macchinario,  Usura ,  AppCalorico, _Sala);
		SELECT CONCAT('Attrezzo ', CodMacchinario, ' inserito nella sala ', _Sala) as CodSala;
	LEAVE scan;
	END IF;
    
    IF _Rank = 'Platinum' THEN
		INSERT INTO Apparecchiature
        VALUES( CodMacchinario,  Macchinario,  Usura ,  AppCalorico, _Sala);
		SELECT CONCAT('Attrezzo ', CodMacchinario, ' inserito nella sala ', _Sala) as CodSala;
	LEAVE scan;
	END IF;
    
    
    
    END LOOP;
    
    
    CLOSE Cursore_Sale;

    
END $$
DELIMITER ;

 CALL Operazione8('0001','90002','Cyclette','10','250');

-- -------------- --
-- AREA ANALYTICS -- 
-- -------------- --

-- REPORTING-- 

-- 1-> Corsi con pochi frequentanti --

DROP PROCEDURE IF EXISTS controllo_frequentanti_corsi;
DELIMITER $$
CREATE PROCEDURE controllo_frequentanti_corsi()
BEGIN

SELECT Corso, 100*(COUNT(*)/C.MaxPartecipanti) AS Percentuale
FROM IscrizioneCorso IC INNER JOIN Corsi C ON IC.Corso=C.CodCorso
GROUP BY IC.Corso;

END $$
DELIMITER ;

-- CALL controllo_frequentanti_corsi();

-- 2 -> Fasce orarie scarsamente frequentate --

DROP PROCEDURE IF EXISTS controllo_fasce_orarie;
DELIMITER $$
CREATE PROCEDURE controllo_fasce_orarie(IN _codicecentro VARCHAR(50), IN _giorno VARCHAR(50))
BEGIN 

DECLARE ora_apertura TIME;
DECLARE ora_chiusura TIME;
DECLARE num_giorno INT;
DECLARE max_partecipanti INT DEFAULT 0;

SELECT TotPersone INTO max_partecipanti
FROM CentroFitness
WHERE CodCentro = _codicecentro;

SELECT OrarioApertura INTO ora_apertura
FROM GiorniApertura
WHERE CodCentro = _codicecentro
	AND Giorno = _giorno;
    
SELECT OrarioChiusura INTO ora_chiusura
FROM GiorniApertura
WHERE CodCentro = _codicecentro
	AND Giorno = _giorno;
    
CASE
WHEN _giorno = 'LUN' THEN 
	SET num_giorno = 1;
WHEN _giorno = 'MAR' THEN 
	SET num_giorno = 2;
WHEN _giorno = 'MER' THEN 
	SET num_giorno = 3;
WHEN _giorno = 'GIO' THEN 
	SET num_giorno = 4;
WHEN _giorno = 'VEN' THEN 
	SET num_giorno = 5;
WHEN _giorno = 'SAB' THEN 
	SET num_giorno = 6;
WHEN _giorno = 'DOM' THEN 
	SET num_giorno = 0;
END CASE; 
    
DROP TEMPORARY TABLE IF EXISTS Supporto;

CREATE TEMPORARY TABLE `Supporto` ( 
`FasciaOraria` VARCHAR(255) NOT NULL,
`Percentuale`	REAL NOT NULL DEFAULT 0,
PRIMARY KEY (`FasciaOraria`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

scan: LOOP 

INSERT INTO Supporto(`FasciaOraria`)(
SELECT CONCAT(ora_apertura,'-',ADDTIME(ora_apertura, '01:00:0000'))
);

UPDATE Supporto
SET Percentuale = (
					SELECT 100*(COUNT(*)/max_partecipanti)
					FROM AccessoCliente
					WHERE DATE_FORMAT(Data,'%w') = num_giorno 
						AND Centro = _codicecentro
                        AND (( OraIngresso <= ora_apertura AND OraUscita >= ADDTIME(ora_apertura, '01:00:0000'))
                        OR ( OraIngresso <= ora_apertura AND OraUscita < ADDTIME(ora_apertura, '01:00:0000'))
                        OR ( OraIngresso <= ADDTIME(ora_apertura, '01:00:0000') AND OraUscita > ADDTIME(ora_apertura, '01:00:0000')))
				  )
WHERE FasciaOraria = CONCAT(ora_apertura,'-',ADDTIME(ora_apertura, '01:00:0000'));

SET ora_apertura = ADDTIME(ora_apertura, '01:00:0000');

IF ora_apertura = ora_chiusura THEN
	LEAVE scan;
END IF;

END LOOP;

SELECT *
FROM Supporto;


END $$
DELIMITER ;

-- CALL controllo_fasce_orarie('0001','LUN');

/* ROTAZIONE MAGAZINO */

-- 1-> Controllo vendite integratori per quel centro

DROP PROCEDURE IF EXISTS ReportScadenze;
DELIMITER $$
CREATE PROCEDURE ReportScadenze(IN Centro VARCHAR(50))
BEGIN

SET @magazzino = ( SELECT m.codmagazzino 
                                                                               FROM Magazzino m
                    WHERE m.Centro = Centro);

SELECT dm.integratore,dm.quantita, DATEDIFF(dm.datascadenza, CURRENT_DATE()) AS GiorniAllaScadenza
FROM DettagliMagazzino dm 
WHERE dm.magazzino = @magazzino
GROUP BY dm.integratore;

END$$
DELIMITER ;

-- call ReportScadenze('0005');

-- Vendita scontata per scadenza

DROP PROCEDURE IF EXISTS VenditaIntegratoriScadenza;
DELIMITER $$
CREATE PROCEDURE VenditaIntegratoriScadenza(IN Centro VARCHAR(50))
BEGIN 

DECLARE finito int DEFAULT 0;
DECLARE magazz VARCHAR(50) DEFAULT '';
DECLARE _integ VARCHAR(50) DEFAULT '';
DECLARE _prezzo int DEFAULT 0;
DECLARE _prezzoscon int DEFAULT 0;
DECLARE _giorni int DEFAULT 0;



DECLARE cursore CURSOR FOR
SELECT  DISTINCT dm.integratore,dm.prezzo
FROM DettagliMagazzino dm
WHERE dm.magazzino = magazz
                AND DATEDIFF(dm.datascadenza, CURRENT_DATE()) BETWEEN 0 AND 31;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finito = 1;


SET magazz = ( SELECT m.codmagazzino 
					FROM Magazzino m
                    WHERE m.Centro = Centro);

DROP TEMPORARY TABLE IF EXISTS Promozioni;
CREATE TEMPORARY TABLE Promozioni(
Integratore VARCHAR(50),
PrezzoIntero INT,
PrezzoPromozione INT,
PRIMARY KEY(Integratore))
ENGINE=INNODB DEFAULT CHARSET=latin1;

TRUNCATE TABLE Promozioni;

OPEN cursore;

scan : LOOP
                IF finito = 1 THEN
					LEAVE scan;
                END IF;
    
    FETCH cursore INTO _integ, _prezzo;
    
    IF _integ = '' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Non ci sono promozioni attualmente disponibili nel centro selezionato';
    LEAVE scan;
    END IF;
    
    BEGIN
    SET _prezzoscon = _prezzo - ( _prezzo * 0.25); -- Sconto 25 %
    REPLACE INTO Promozioni
    VALUES(_integ, _prezzo, _prezzoscon);
    END;
    
    END LOOP;
    
CLOSE cursore;

SELECT*
FROM Promozioni;

END $$
DELIMITER ;

-- CALL VenditaIntegratoriScadenza('0009'); -- NON CI SONO PROMO
-- CALL VenditaIntegratoriScadenza('0013'); -- PROMOZIONI

DROP EVENT IF EXISTS GestioneSconti;
DELIMITER $$
CREATE EVENT GestioneSconti
ON SCHEDULE EVERY 1 WEEK
STARTS '2018-02-13 23:59:00'
DO

BEGIN 


UPDATE dettaglimagazzino 
SET prezzo = prezzo - (prezzo*0.25)
WHERE DATEDIFF(datascadenza, CURRENT_DATE()) BETWEEN 0 AND 31
                AND Scontato = 'NO';
    
UPDATE dettaglimagazzino 
SET Scontato = 'SI'
WHERE DATEDIFF(datascadenza, CURRENT_DATE()) BETWEEN 0 AND 31;

END;





