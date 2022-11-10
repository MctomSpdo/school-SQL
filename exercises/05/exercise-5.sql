/* 1. */
select YEAR_JOINED, count(*) as Amount from PLAYERS group by YEAR_JOINED order by 1;

/* 2. */
select (PLAYERNO), count(*) as Anzahl, round(avg(AMOUNT), 2) as Average from PENALTIES group by PLAYERNO;

select NAME from PLAYERS where PLAYERNO in (select PLAYERNO from PENALTIES group by PLAYERNO);

/* 3. */
select TO_CHAR(PEN_DATE, 'yyyy') as Year, count(*) as Amount from PENALTIES where TO_CHAR(PEN_DATE, 'yyyy') < 1983 group by TO_CHAR(PEN_DATE, 'yyyy');

/* 4 */
select TOWN, count(*) from PLAYERS group by TOWN having count(*) > 4;

/* 5 */
select PLAYERNO, sum(AMOUNT) from PENALTIES group by PLAYERNO having sum(AMOUNT) > 150;

/* 6 */
select NAME, INITIALS from PLAYERS where PLAYERNO in (select PLAYERNO from PENALTIES group by PLAYERNO having count(*) > 1);

/* 7 */
select TO_CHAR(PEN_DATE, 'yyyy'), count(*) from PENALTIES group by TO_CHAR(PEN_DATE, 'yyyy') having count(*) = 2;

/* 8. */
select NAME, INITIALS from PLAYERS where PLAYERNO in(select PLAYERNO from PENALTIES where AMOUNT > 40 group by PLAYERNO having count(*) >= 2);

/* 9 */
select NAME, INITIALS from PLAYERS where PLAYERNO in (select PLAYERNO from PENALTIES group by PLAYERNO having sum(AMOUNT) = (select max(sum(AMOUNT)) from PENALTIES group by PLAYERNO));

/* 10 */
select TO_CHAR(PEN_DATE, 'yyyy'), count(*) from PENALTIES group by TO_CHAR(PEN_DATE, 'yyyy') having count(*) = (select max(count(*)) from PENALTIES group by TO_CHAR(PEN_DATE, 'yyyy'));

/* 11 */
select PLAYERNO, sum(WON) - sum(LOST) from MATCHES group by PLAYERNO;

/* 12 */
select * from EMP where DEPTNO = 30 order by SAL desc;

/* 13 */
select * from EMP order by JOB, SAL;

/* 14 */
select * from EMP order by HIREDATE desc, ENAME;

/* 15 ???*/
select * from EMP order by SAL - nvl(COMM, 0);

/* 16 */
select DEPTNO, round(avg(SAL), 2) as Durchschnittsgehalt from EMP group by DEPTNO;

/* 17 */
select JOB, round(avg(SAL), 2) as AVGSAL from EMP group by JOB having count(*) > 2;

/* 18 */
select DEPTNO from EMP group by DEPTNO having count(*) > 2;

/* 19 */
select round(avg(SAL), 2) as AVGSAL, round(avg(nvl(COMM, 0)), 2) as AVGCOMM from EMP where DEPTNO = 30;