drop table kunde;
drop table artikel;
drop table gutschein;
drop table bestellung;
drop table bestellpos;

create table kunde(
 kundennr integer not null,
 vorname varchar2(50),
 nachname varchar2(50) NOT NULL,
 strasse varchar2(30) NOT NULL,
 hausnr varchar2(10),
 plz varchar2(10) NOT NULL,
 ort varchar2(50) NOT NULL,
 land char(2)  default ('AT') not null
);

create table artikel(
 artikelnr integer not null,
 bezeichnung varchar2(200) not null,
 ekpreis number(9,2) not null,
 vkpreis number(9,2) not null,
 umsatzsteuer number(2)  default 20 not null
);

create table gutschein(
 gutscheinNr integer not null,
 bezeichnung varchar2(50) not null,
 rabatt number(2)
);

create table bestellung(
 bestellnr integer not null,
 kundennr integer not null,
 gutscheinnr integer,
 bestelldatum date not null,
 status char(1) default 'O'
);

create table bestellpos(
 bestellnr integer not null,
 artikelnr integer not null,
 anzahl integer default 1 not null 
);
 


insert into kunde values (1, 'Max', 'Muster', 'Mustergasse', '10', '4020', 'Linz','AT');
insert into kunde values (2, 'Johann', 'Mayr', 'Franckstrasse', '2', '4020', 'Linz', 'AT');
insert into kunde values (3, 'Susi', 'Semmel', 'B�ckergasse', '4', '4600', 'Wels', 'AT');
insert into kunde values (4, 'Dieter', 'Bohlen', 'DSDS-Weg', '1', '10010', 'Berlin', 'DE');

insert into artikel values (1001, 'Smartphone SG6', 250, 419.99, 20);
insert into artikel values (1002, 'Pensionistenhandy PH3', 110, 239.99, 20);
insert into artikel values (2001, 'Handy Cover Co1', 2, 19.99, 20);
insert into artikel values (2002, 'Handy Cover StarWars', 5, 24.99, 20);
insert into artikel values (2003, 'Display Schutzfolie', 0.30, 3.90, 20);
insert into artikel values (2004, 'Display Schutzfolie Premium', 0.50, 6.99, 20);
insert into artikel values (3001, 'TV 46"', 274.0, 549, 20);
insert into artikel values (3002, 'TV 55" Deluxe', 400, 799, 20);

insert into gutschein values(99100010, 'Gutschein 10%', 10);
insert into gutschein values(99100020, 'Gutschein 20%', 20);

insert into bestellung values(1, 1, null, to_date('02.01.2015', 'dd.mm.yyyy'), 'E');
insert into bestellung values(2, 3, null, to_date('14.01.2015', 'dd.mm.yyyy'), 'E');
insert into bestellung values(3, 1, null, to_date('17.01.2015', 'dd.mm.yyyy'), 'E'); 
insert into bestellung values(4, 2, null, to_date('20.02.2015', 'dd.mm.yyyy'), 'E');
insert into bestellung values(5, 4, null, to_date('03.02.2015', 'dd.mm.yyyy'), 'O');
insert into bestellung values(6, 3, 99100020, to_date('07.02.2015', 'dd.mm.yyyy'), 'O');
insert into bestellung values(7, 4, 99100010, to_date('07.02.2015', 'dd.mm.yyyy'), 'O');

insert into bestellpos values(1,1001, 1);
insert into bestellpos values(1, 2004, 3);
insert into bestellpos values(2, 1002, 1);
insert into bestellpos values(2, 2003, 2);
insert into bestellpos values(3, 2001, 5);
insert into bestellpos values(4, 1001, 1);
insert into bestellpos values(4, 2004, 10);
insert into bestellpos values(4, 3002, 1);
insert into bestellpos values(5, 2002, 1);
insert into bestellpos values(6, 3001, 1);
insert into bestellpos values(7, 3002, 1);
insert into bestellpos values(7, 1001, 3);
insert into bestellpos values(7, 2002, 3);

commit;