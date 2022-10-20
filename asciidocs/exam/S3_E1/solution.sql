/*
 1
 */

select 'Business PC enthält' || TEILBEZ
from TEIL
         left join STUECKLISTE on TEILNR = UTEILNR
where HTEILNR = (select TEILNR from TEIL where TEILBEZ = 'Business PC');

/*
 2
 */

select AUFTRNR, MITARBNAME, SUM(ISTZEIT - SOLLZEIT) "GESAMTDIFFERENZ"
from ARBEITSZEIT
         join ARBEITSGANG using (AGNR)
         join ARBEITSAUFTRAG using (AUFTRNR)
         join MITARBEITER using (MITARBNR)
where FERTIGDATUM is not null
  and ARBEITSGANG.TEILNR = ARBEITSAUFTRAG.TEILNR
group by AUFTRNR, MITARBNAME
having SUM(ISTZEIT - SOLLZEIT) < 0
order by 2;


/*
 3
 */


select AGNR, AGBESCHREIBUNG, TEILBEZ
from ARBEITSGANG
         inner join TEIL using (TEILNR)
where upper(AGBESCHREIBUNG) like '%SPEICHER%';

/*
 4
 */

select *
from TEIL
where TEILPREIS > (select avg(TEILPREIS)
                   from TEIL);



