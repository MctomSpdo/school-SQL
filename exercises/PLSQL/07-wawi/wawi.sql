-- WAWI.SQL
-- SQL-script f�r 4.Test der 4BHD

-- set linesize 120;

ALTER SESSION SET NLS_LANGUAGE = 'american';
alter session set nls_numeric_characters = '.,';

/*drop table wawi_preisliste;
drop table wawi_rechnungsposition;
drop table wawi_rechnungskopf;
drop table wawi_artikel;
drop table wawi_artikel_gruppe;
DROP TABLE wawi_kunde;
drop table wawi_kunde_gruppe;*/

CREATE TABLE wawi_kunde_gruppe(
  kundengruppeID NUMBER(5),
  Bezeichnung  VARCHAR2(30),
  CONSTRAINT pk_wawi_kunde_gruppe PRIMARY KEY(kundengruppeID)
  );
INSERT INTO wawi_kunde_gruppe VALUES (1,'Einzelkunde');
INSERT INTO wawi_kunde_gruppe VALUES (2,'Grosskunde');


CREATE TABLE wawi_kunde(
  kundenID NUMBER(5),
  kundengruppeID NUMBER(5),
  VName     VARCHAR2(30),
  NName     VARCHAR2(30),
  Adresse   VARCHAR2(30),
  CONSTRAINT pk_wawi_kunde PRIMARY KEY(kundenID),
  CONSTRAINT fk_kundengruppeID
     FOREIGN KEY (kundengruppeID )
     REFERENCES wawi_kunde_gruppe(kundengruppeID)
  );

INSERT INTO wawi_kunde VALUES (1,1,'Johannes','Tumfart','Ziegeleistr. 47');
INSERT INTO wawi_kunde VALUES (2,1,'Peter','Bieber','Hugo-Wolfstr. 56');
INSERT INTO wawi_kunde VALUES (3,2,'Andrea','Huber','Hauptplatz 1');

CREATE TABLE wawi_artikel_gruppe(
  artikelgruppeID NUMBER(5),
  Bezeichnung  VARCHAR2(30),
  CONSTRAINT wawi_artikel_gruppe PRIMARY KEY(artikelgruppeID)
  );
INSERT INTO wawi_artikel_gruppe VALUES (1,'Eisen');
INSERT INTO wawi_artikel_gruppe VALUES (2,'Holz');
INSERT INTO wawi_artikel_gruppe VALUES (3,'Sonstiges');


CREATE TABLE wawi_artikel(
  artikelID NUMBER(5),
  artikelgruppeID NUMBER(5),
  Bezeichnung VARCHAR2(30),
  Preis    number(5,2),
  CONSTRAINT pk_artikelID  PRIMARY KEY(artikelID),
  CONSTRAINT fk_artikelgruppeID
  FOREIGN KEY (artikelgruppeID)
  REFERENCES wawi_artikel_gruppe(artikelgruppeID)
  );

INSERT INTO wawi_artikel VALUES (11,1,'Schraube 2x4',11);
INSERT INTO wawi_artikel VALUES (22,1,'Mutter 6x3',12);
INSERT INTO wawi_artikel VALUES (13,2,'Platte 4x2',13);
INSERT INTO wawi_artikel VALUES (14,3,'Platte 8x3',11);


CREATE TABLE wawi_rechnungskopf(
  rechnungskopfID NUMBER(5),
  kundenID NUMBER(5),
  CONSTRAINT pk_rechnungskopfID PRIMARY KEY(rechnungskopfID),
  CONSTRAINT fk_kundenID
  FOREIGN KEY (kundenID)
  REFERENCES wawi_kunde(kundenID)
  );
  INSERT INTO wawi_rechnungskopf VALUES (1,1);

CREATE TABLE wawi_rechnungsposition(
  rechnungskopfID NUMBER(5),
  rechnungspositionsID NUMBER(5),
  artikelID NUMBER(5),
  menge NUMBER(5),
  CONSTRAINT pk_wawi_artikeln PRIMARY KEY(rechnungskopfID,rechnungspositionsID),
  CONSTRAINT fk_rechnungskopfID
  FOREIGN KEY (rechnungskopfID)
  REFERENCES wawi_rechnungskopf(rechnungskopfID),
  CONSTRAINT fk_wawi_artikel
  FOREIGN KEY (artikelID)
  REFERENCES wawi_artikel(artikelID)
  );
INSERT INTO wawi_rechnungsposition VALUES (1,1,11,4);
INSERT INTO wawi_rechnungsposition VALUES (1,2,22,5);
INSERT INTO wawi_rechnungsposition VALUES (1,3,13,6);
INSERT INTO wawi_rechnungsposition VALUES (1,4,14,2);

CREATE TABLE wawi_preisliste(
  artikelgruppeID NUMBER(5),
  kundengruppeID NUMBER(5),
  rabatt  NUMBER(5),
  CONSTRAINT pk_wawi_preisliste PRIMARY KEY(artikelgruppeID,kundengruppeID),
  CONSTRAINT fk_artikelgruppenID
  FOREIGN KEY (artikelgruppeID )
  REFERENCES wawi_artikel_gruppe(artikelgruppeID),
  CONSTRAINT fk_kundengruppenID
  FOREIGN KEY (kundengruppeID)
  REFERENCES wawi_kunde_gruppe(kundengruppeID)
  );


INSERT INTO wawi_preisliste VALUES (1,1,7);
INSERT INTO wawi_preisliste VALUES (2,1,8);



COMMIT;