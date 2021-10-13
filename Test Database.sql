-- ---- --
-- TEST --
-- ---- --

-- Controllo Usura -- 

-- Utilizzo un nuovo macchinario -> L'usura del macchinario utilizzato aumenta del 5% -- 
INSERT INTO ConfigurazioniEffettive VALUES
('tab008','es020','SAB','20108','25','30',NULL); 

DELETE FROM ConfigurazioniEffettive 
WHERE CodTabella = 'tab008';

-- l'usura di 20108 va al 100% e quindi finisce in Riparazione

SELECT *
FROM Apparecchiature;

SELECT *
FROM Riparazione;

-- Testo il secondo trigger provando ad usare nuovamente il macchinario con usura a 100%

INSERT INTO ConfigurazioniEffettive VALUES
('tab009','es020','LUN','20108','25','30',NULL); -- Restituirà un errore

SELECT *
FROM ConfigurazioniEffettive
WHERE CodTabella = 'tab009'; -- Controllo che effettivamente non abbia inserito niente

-- Chiamo la procedure che svuota Riparazione e imposta l'usura di tutti i macchinari al suo interno allo 0%

CALL SvuotaRiparazione();

-- Controllo Stato Peso --

INSERT INTO SchedaBase VALUES
('00026','140','120','0','25','22','67','ddd6','2016-12-28');

DELETE FROM SchedaBase
WHERE CodCliente = '00026';

SELECT *
FROM SchedaBase;

-- Controllo orari superiori alle 8 ore --

INSERT INTO Turnazione VALUES -- TEST INSERIMENTO DI UN ORARIO CON PIU DI 8 ORE IN INPUT
('ggg1','0001','LUN','09:00:00','18:00:00');

INSERT INTO Turnazione VALUES -- TEST INSERIMENTO DI UN ORARIO CON 8 ORE PRECISE
('ggg1','0001','LUN','09:00:00','17:00:00');

DELETE FROM Turnazione -- DELETE DI SUPPORTO
WHERE Dipendente = 'ggg1';

INSERT INTO Turnazione VALUES -- TEST INSERIMENTO DI UN ORARIO DATA UNA TURNAZIONE SENZA COLLISIONE
('aaa2','0001','MER','09:00:00','17:00:00');

INSERT INTO Turnazione VALUES -- INSERIMENTO 8 ORE PRECISE CON COLLISIONE INTERNA
('aaa2','0001','LUN','09:00:00','16:00:00');

DELETE FROM Turnazione -- DELETE DI SUPPORTO
WHERE Dipendente = 'aaa2'
AND InizioTurno = '09:00:00'
AND FineTurno = '16:00:00';

INSERT INTO Turnazione VALUES -- INSERIMENTO DI SUPPORTO
('ggg1','0001','LUN','10:00:00','12:00:00');

INSERT INTO Turnazione VALUES -- TEST COLLISIONE SX ORARI SOVRAPPOSTI
('ggg1','0001','LUN','11:00:00','18:00:00');

-- TEST MaxPartecipanti in un corso --

INSERT INTO Corsi VALUES -- INSERIMENTO DI SUPPORTO
('cor012','Spinning','2017-09-01','2018-09-01','Intermedio','2','s402');

DELETE FROM Corsi -- DELETE DI SUPPORTO
WHERE CodCorso = 'cor012';

INSERT INTO IscrizioneCorso VALUES -- INSERIMENTO DI SUPPORTO
('cor012','00001'),('cor012','00005');

DELETE FROM IscrizioneCorso -- DELETE DI SUPPORTO
WHERE Corso = 'cor012';

INSERT INTO IscrizioneCorso VALUES -- Inserimento raggiunto il Max numero
('cor012','00002');

-- TEST INSERIMENTO VISITA SCHEDA GIA' ESISTENTE CON NUTRIZIONISTA DIVERSO --

INSERT into VisitaDieta values
('eee2','00018','ali029',current_date());

-- TEST TRIGGER CONTROLLO INSERIMENTO CORSO --

insert into Calendariocorsi -- dipendente altro corso
values('cor003','VEN','10:00:0000','11:00:0000');

insert into Calendariocorsi -- orario incompatibile
values('cor004','mar','18:00:0000','20:00:0000');

insert into Calendariocorsi  -- sala occupata
values('cor002','LUN','17:00:0000','18:00:0000');
 
insert into Calendariocorsi  -- giorno libero
values('cor008','GIO','17:00:0000','18:00:0000');
 
insert into Calendariocorsi -- istruttore impegnato altro centro
values('cor004','ven','18:00:0000','20:00:0000');

-- TEST INSERIMENTO PARTECIPANTE A SFIDA TERMINATA --

insert into Sfide values -- INSERIMENTO DI SUPPORTO
('post09', 'Distanza Percorsa', '2017-03-01', '2017-03-08',NULL,'t33', 'al33');

DELETE FROM Sfide  -- DELETE DI SUPPORTO
WHERE CodSfida = 'post09';

INSERT INTO PartecipantiSfida VALUES -- INSERIMENTO A SFIDA TERMINATA
( 'post09' , 'utente01', '0', '2017-07-15');

-- CONTROLLO MAGAZZINO --

INSERT INTO DettagliOrdineC VALUES -- TEST INSERIMENTO NUOVO ORDINE -> VEDI MODIFICA MAGAZZINO
('oc100', 'MGk VIS', '4');

INSERT INTO DettagliOrdineC VALUES -- TEST INSERIMENTO ORDINE CON QUANTITA' NON SUFFICIENTE
('oc116', 'MGk VIS', '15');

/*
SELECT *
FROM DettagliMagazzino
WHERE Magazzino = 'M1';

DELETE FROM DettagliOrdineC 
WHERE Ordine = 'oc100' 
	AND Integratore = 'Mgk VIS';
    
*/

-- CONTROLLO ORDINIFORNITORE --

INSERT INTO DettagliOrdineF VALUES -- INSERIMENTO IN UN ORDINE EVASO
('a031', 'Marlin 323', '20');

INSERT INTO DettagliOrdineF VALUES -- INSERIMENTO IN UN ORDINE INCOMPLETO MA CON INTEGRATORE GIA PRESENTE
('a023', 'Marlin 323', '20');
