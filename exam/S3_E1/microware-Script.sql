drop table arbeitsgang;
/
create table arbeitsgang (agnr number not null,
                    teilnr number not null,
                    agbeschreibung varchar2(40),
                    sollzeit number,
                    primary key(agnr,teilnr));
);
insert into arbeitsgang values (1,1,'Prozessor und Speicher einbauen',20);
insert into arbeitsgang values (2,1,'Festplatte einbauen',30);
insert into arbeitsgang values (3,1,'Grafikkarte einbauen',10);
insert into arbeitsgang values (1,2,'Prozessor und Speicher einbauen',20);
insert into arbeitsgang values (2,2,'Festplatte einbauen',40);
insert into arbeitsgang values (3,2,'Grafikkarte einbauen',20);
insert into arbeitsgang values (4,2,'CD-ROM einbauen',40);
insert into arbeitsgang values (1,3,'Prozessor und Speicher einbauen',25);
insert into arbeitsgang values (2,3,'Festplatte einbauen',40);
insert into arbeitsgang values (3,3,'Grafikkarte einbauen',30);
insert into arbeitsgang values (4,3,'CD-ROM einbauen',30);
insert into arbeitsgang values (5,3,'Soundkarte einbauen',35);
insert into arbeitsgang values (6,3,'Netzwerkkarte einbauen',25);
drop table teil
/
create table teil (teilnr number not null primary key,
                    teilbez varchar2(40),
                    teilpreis number);               
insert into teil values (1,'Standard PC',NULL); 	
insert into teil values (2,'Business PC',NULL);	
insert into teil values (3,'Internet PC',NULL);	
insert into teil values (4,'Prozessor Intel 266MHz',989);
insert into teil values (5,'Prozessor Intel 300MHz',1479);
insert into teil values (6,'Festplatte IBM 2GB',2499);
insert into teil values (7,'Festplatte Hitachi 4GB',3499);
insert into teil values (8,'8 DIMM 16MB',419);
insert into teil values (9,'DIMM 32MB',839);
insert into teil values (10,'Grafikkarte 4MB',599);
insert into teil values (11,'CD-ROM 24Fach',329);
insert into teil values (12,'CD-ROM 32Fach',839);
insert into teil values (13,'Sound Card 16Bit',329);
insert into teil values (14,'Netzwerkkarte',949);
insert into teil values (15,'PentiumII Board',2499);
insert into teil values (16,'Pentium II Board Standard',NULL); 	
insert into teil values (17,'Pentium II Board Business',NULL); 	
insert into teil values (18,'Pentium II Board Internet',NULL); 	
insert into teil values (19,'Desktop Geh�use',589);
insert into teil values (20,'Minitower Geh�use',459);
insert into teil values (21,'Tower Geh�use',749);
drop table stueckliste
/
create table stueckliste (
                    hteilnr number not null,
                    uteilnr number not null,
                    anzahl number,
                    primary key(hteilnr,uteilnr));
insert into stueckliste values (1,6,1);
insert into stueckliste values (1,10,1);
insert into stueckliste values (1,16,1);
insert into stueckliste values (2,7,1);
insert into stueckliste values (2,10,1);
insert into stueckliste values (2,11,1);
insert into stueckliste values (2,17,1);
insert into stueckliste values (3,7,1);
insert into stueckliste values (3,10,1);
insert into stueckliste values (3,12,1);
insert into stueckliste values (3,13,1);
insert into stueckliste values (3,14,1);
insert into stueckliste values (3,18,1);
insert into stueckliste values (16,4,1);
insert into stueckliste values (16,8,1);
insert into stueckliste values (16,15,1);
insert into stueckliste values (17,4,1);
insert into stueckliste values (17,9,1);
insert into stueckliste values (17,15,1);
insert into stueckliste values (18,5,1);
insert into stueckliste values (18,9,2);
insert into stueckliste values (18,15,1);
drop table mitarbeiter
/
create table mitarbeiter (
                    mitarbnr number not null primary key,
                    mitarbname varchar2(40));                  
insert into mitarbeiter values (1,'Maier');
insert into mitarbeiter values (2,'Huber');
insert into mitarbeiter values (3,'M�ller');
insert into mitarbeiter values (4,'Schmidt');
drop table arbeitsauftrag
/
alter session set nls_date_format = 'DD.MM.YYYY HH24:MI:SS';
create table arbeitsauftrag (
                    auftrnr number not null primary key,
                    teilnr number,
                    anzahl number,
                    mitarbnr number,
                    ausstelldatum date,
                    fertigdatum date,
                    foreign key (mitarbnr) references mitarbeiter,
                    foreign key (teilnr) references teil);
insert into arbeitsauftrag values (1,1,3,4,'18.01.2003','19.01.2003');
insert into arbeitsauftrag values (2,3,1,4,'24.01.2003','25.01.2003');
insert into arbeitsauftrag values (3,2,4,1,'25.01.2003','26.01.2003');
insert into arbeitsauftrag values (4,2,2,3,'26.01.2003',NULL);
insert into arbeitsauftrag values (5,1,2,3,'26.01.2003',NULL);
insert into arbeitsauftrag values (6,3,3,2,'27.01.2003',NULL);
drop table arbeitszeit
/
create table arbeitszeit (
                    auftrnr number not null,
                    agnr number not null,
                    istzeit number,
                    primary key(auftrnr,agnr));              
insert into arbeitszeit values (1,1,20);
insert into arbeitszeit values (1,2,15);
insert into arbeitszeit values (1,3,10);
insert into arbeitszeit values (2,1,30);
insert into arbeitszeit values (2,2,20);
insert into arbeitszeit values (2,3,25);
insert into arbeitszeit values (2,4,30);
insert into arbeitszeit values (2,5,30);
insert into arbeitszeit values (2,6,30);
insert into arbeitszeit values (3,1,25);
insert into arbeitszeit values (3,2,35);
insert into arbeitszeit values (3,3,15);
insert into arbeitszeit values (3,4,45);
insert into arbeitszeit values (4,1,10);
insert into arbeitszeit values (4,2,20);
insert into arbeitszeit values (4,3,NULL);
insert into arbeitszeit values (4,4,NULL);
insert into arbeitszeit values (5,1,25);
insert into arbeitszeit values (5,2,NULL);
insert into arbeitszeit values (5,3,NULL);
insert into arbeitszeit values (6,1,NULL);
insert into arbeitszeit values (6,2,NULL);
insert into arbeitszeit values (6,3,NULL);
insert into arbeitszeit values (6,4,NULL);
insert into arbeitszeit values (6,5,NULL);
insert into arbeitszeit values (6,6,NULL);

commit;