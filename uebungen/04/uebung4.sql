/* 1. Ausgabe von TEAMNO der Teams, in denen nicht der Spieler mit der Nummer 27 Kapitän ist*/
select * from TEAMS where PLAYERNO != 27;

/* 2. Ausgabe von PLAYERNO, NAME und INITIALS der Spieler, die mindestens ein Match gewonnen haben*/
select PLAYERNO, NAME, INITIALS from PLAYERS where PLAYERNO in (select PLAYERNO from MATCHES where WON >= 1);

/* 3 Ausgabe von SpielerNr und Name der Spieler, die mindestens eine Strafe erhalten haben */
select distinct PLAYERNO, NAME from PLAYERS where PLAYERNO in (select distinct PLAYERNO from PENALTIES);

/* 4 Ausgabe von SpielerNr und Name der Spieler, die mindestens eine Strafe über 50.- erhalten haben */
select distinct PLAYERNO, NAME from PLAYERS where PLAYERNO in (select PLAYERNO from PENALTIES where AMOUNT > 50);

/* 5. Ausgabe von SpielerNr und Name der Spieler, die im selben Jahr wie R. Parmenter geboren sind */
select PLAYERNO, NAME from Players where YEAR_OF_BIRTH = (select YEAR_OF_BIRTH from PLAYERS where INITIALS = 'R' and NAME = 'Parmenter');

/* 6 Ausgabe von SpielerNr und Name des ältesten Spielers aus Stratford */
select PLAYERNO, NAME from PLAYERS where YEAR_OF_BIRTH = (select min(YEAR_OF_BIRTH) from PLAYERS);

/* 7. Gesucht sind alle Abteilungen, die keine Mitarbeiter beschäftigen */
select DEPTNO, DNAME from DEPT where DEPTNO not in(select distinct DEPTNO from EMP);

/* 8. Gesucht sind alle Mitarbeiter, die den gleichen Job wie JONES haben */
select * from EMP where JOB = (select JOB from EMP where ENAME = 'JONES');

/* 9. Anzeigen aller Mitarbeiter, die mehr verdienen als irgendein Mitarbeiter aus Abteilung 30 */
select * from EMP where SAL > (select * from (select SAL from EMP where DEPTNO = 30 order by dbms_random.value) where rownum = 1);

select EMPNO, ENAME from EMP where SAL > ANY(select sal from EMP where DEPTNO = 30);

/* 10 Anzeigen aller Mitarbeiter, die mehr verdienen als jeder Mitarbeiter aus Abteilung 30 */
select * from EMP where SAL > (select max(SAL) from EMP where DEPTNO = 30);

/* 11 Anzeigen aller Mitarbeiter aus Abteilung 10, deren Job von keinem Mitarbeiter aus Abteilung 30 ausgeübt wird */
select * from EMP where DEPTNO = 10 and JOB not in(select distinct JOB from EMP where DEPTNO = 30);

/* 12 Gesucht sind die Mitarbeiterdaten (EMPNO, ENAME, JOB, SAL) des Mitarbeiters mit dem höchsten Gehalt */
select EMPNO, ENAME, JOB, SAL from EMP where SAL = (select max(SAL) from EMP);
select EMPNO, ENAME, JOB, SAL from EMP where SAL = (select max(SAL) from EMP) and rownum = 1;