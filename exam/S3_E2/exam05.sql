-- 2. INSY Exam 12.01.2022 - PLSQL

-- 1. Stored Function "grad_pruef"

create or replace function grad_pruef(p_salgrade number)
    return number
    is
    v_salcount number;
    v_empCount number;
    v_diff     number;
begin
    -- check if salgrade exists, otherwise return 2
    select count(*)
    into v_salcount
    from SALGRADE
    where GRADE like p_salgrade;

    if v_salcount = 0 then
        return 2;
    end if;

    -- chen if salgrade has any emp, otherwise return 1
    select count(*)
    into v_empCount
    from emp
    where nvl(SAL, 0) >= (select LOSAL from SALGRADE where GRADE = p_salgrade)
      and nvl(SAL, 0) <= (select HISAL from SALGRADE where GRADE = p_salgrade);

    if v_empCount = 0 then
        return 1;
    end if;

    select max(abs(SAL - (select avg(nvl(SAL, 0))
                          from emp
                          where nvl(SAL, 0) >= (select LOSAL from SALGRADE where GRADE = p_salgrade)
                            and nvl(SAL, 0) <= (select HISAL from SALGRADE where GRADE = p_salgrade)))) as maxDiff
    into v_diff
    from EMP
    where nvl(SAL, 0) >= (select LOSAL from SALGRADE where GRADE = p_salgrade)
      and nvl(SAL, 0) <= (select HISAL from SALGRADE where GRADE = p_salgrade);

    return v_diff;
end;
/

select grad_pruef(1)
from dual;


-- 2. Trigger "check_max_mgr"

select MGR, count(*)
from EMP
where MGR is not null
group by MGR;

create or replace trigger check_max_mgr
    before update of MGR
    on EMP
    for each row
declare
    v_emp   EMP.EMPNO%type;
    v_count number;
    v_mgr   EMP.MGR%type;
begin
    v_mgr := :new.MGR;

    select count(*) into v_count from EMP where MGR = v_mgr;

    DBMS_OUTPUT.PUT_LINE('Checking EMP status...');

    if v_count > 5 then
        raise_application_error(
                -20000,
                'Employee with EMPNO ' || v_emp || ' can not manage more then 5 employees!'
            );
    end if;
end;

create or replace trigger check_max_mgr
    before insert
    on EMP
    for each row
declare
    v_emp   number;
    v_count number;
begin
    select count(*) into v_count
    from EMP
    where MGR = :new.MGR;

    v_emp := :new.MGR;

    if(v_count > 5) then
        raise_application_error(-20000, 'A Employee cannot manage more then 5 other Employees!');
    end if;

    raise_application_error(-20000, ('test' || v_emp || ' ' || v_count));
end;
/



insert into EMP (EMPNO, ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO, MGR)
values (100, 'test', 'CLERK', to_date('2023-12-12', 'YYYY-MM-HH'), 100, 100, 20, 7839);
insert into EMP (EMPNO, ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO, MGR)
values (101, 'test', 'CLERK', to_date('2023-12-12', 'YYYY-MM-HH'), 100, 100, 20, 7839);
insert into EMP (EMPNO, ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO, MGR)
values (102, 'test', 'CLERK', to_date('2023-12-12', 'YYYY-MM-HH'), 100, 100, 20, 7839);
insert into EMP (EMPNO, ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO, MGR)
values (103, 'test', 'CLERK', to_date('2023-12-12', 'YYYY-MM-HH'), 100, 100, 20, 7839);

select MGR,count(*)
from EMP group by MGR;

alter trigger check_max_mgr disable;

-- 3. Trigger "check_date"

create or replace trigger check_date
    before insert or update on EMP
    for each row
    declare
        v_diff number;
    begin
        v_diff := sysdate - :new.HIREDATE;
        if v_diff > 0 then
            raise_application_error(-20000, 'Hiredate has to be in the future');
        end if;
    end;
/

-- test statement:

insert into EMP (EMPNO, ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)
values (1000, 'test', 'CLERK', to_date('2023-12-12', 'YYYY-MM-HH'), 100, 100, 20);

delete from emp where EMPNO = 1000;

alter trigger check_date disable;