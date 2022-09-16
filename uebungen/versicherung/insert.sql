alter session set nls_date_format = 'DD-MM-YYYY HH24:MI:SS';

INSERT INTO v_vertragsort
(ABSCHLUSSID,ORT,DATUM)
VALUES
(1,'LONDON','17-03-2001')
/
INSERT INTO v_vertragsort
(ABSCHLUSSID,ORT,DATUM)
VALUES
(2,'WIEN','23-05-2001')
/
INSERT INTO v_vertragsort
(ABSCHLUSSID,ORT,DATUM)
VALUES
(3,'PARIS','04-08-2001')
/
INSERT INTO v_vertragsort
(ABSCHLUSSID,ORT,DATUM)
VALUES
(4,'ROM','28-08-2001')
/

INSERT INTO v_vertreter
(VERTRETERID,NNAME,PLZ,ORT)
VALUES
(1,'Maier',9920,'ROM')
/
INSERT INTO v_vertreter
(VERTRETERID,NNAME,PLZ,ORT)
VALUES
(2,'Müller',5550,'LONDON')
/
INSERT INTO v_vertreter
(VERTRETERID,NNAME,PLZ,ORT)
VALUES
(3,'Huber',440,'WIEN')
/
INSERT INTO v_vertreter
(VERTRETERID,NNAME,PLZ,ORT)
VALUES
(4,'Bauer',6660,'PARIS')
/

INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(1,'Vertrag1Haus','JA',NULL,NULL,'1')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(2,'Vertrag2Auto','NEIN',NULL,NULL,'2')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(3,'Vertrag3Auto','NEIN',NULL,NULL,'2')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(4,'Vertrag4Auto','JA','Vertrag1Haus','02-01-1990','1')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(5,'Vertrag5Auto','NEIN','Vertrag1Haus','15-07-1990','2')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(6,'Vertrag6Lebens','JA','Vertrag1Haus','12-03-1991','3')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(7,'Vertrag7Lebens','JA','Vertrag1Haus','22-08-1992','4')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(8,'Vertrag8Lebens','JA','Vertrag4Auto','30-03-1993','1')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(9,'Vertrag5AutoNE','JA','Vertrag4Auto','04-12-1993','2')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(10,'Vertrag9Lebens','JA','Vertrag1Haus','09-02-1993','3')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(11,'Vertrag10Lebens','NEIN','Vertrag7Lebens','24-07-1994','4')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(12,'Vertrag11Lebens','NEIN','Vertrag4Auto','12-08-1995','4')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(13,'Vertrag12Lebens','JA','Vertrag5AutoNE','03-04-1996','4')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(14,'Vertrag13Lebens','JA','Vertrag5AutoNE','25-12-1996','2')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(15,'Vertrag14Lebens','JA','Vertrag7Lebens','21-07-1996','2')
/
INSERT INTO v_vertrag
(vertragsid,folgevertrag,nochgueltig,vorgaengervertrag,abschlussdatum,vertreterid)
VALUES
(16,'Vertrag15Lebens','JA','Vertrag12Lebens','11-10-1998','3')
/
INSERT INTO v_vertragsabschluss
(VERTRAGSID,ABSCHLUSSID,VERTRAGSGROESSE_EURO)
VALUES
(11,1,500)
/
INSERT INTO v_vertragsabschluss
(VERTRAGSID,ABSCHLUSSID,VERTRAGSGROESSE_EURO)
VALUES
(15,1,1000)
/
INSERT INTO v_vertragsabschluss
(VERTRAGSID,ABSCHLUSSID,VERTRAGSGROESSE_EURO)
VALUES
(12,3,300)
/
INSERT INTO v_vertragsabschluss
(VERTRAGSID,ABSCHLUSSID,VERTRAGSGROESSE_EURO)
VALUES
(11,3,600)
/
INSERT INTO v_vertragsabschluss
(VERTRAGSID,ABSCHLUSSID,VERTRAGSGROESSE_EURO)
VALUES
(13,4,1000)
/
INSERT INTO v_vertragsabschluss
(VERTRAGSID,ABSCHLUSSID,VERTRAGSGROESSE_EURO)
VALUES
(14,4,300)
/