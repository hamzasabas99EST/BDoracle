--Création de la base de données et contraintes d’intégrité

--1)
CREATE TABLE DEPT (
	           deptno number(2) CONSTRAINT dept_pk PRIMARY KEY,
	           deptname varchar2(10) CONSTRAINT  dept_ck CHECK (deptname  IN('ACCOUNTING','RESEARCH','SALES','OPERATIONS')),  
               loc varchar2(30)
            );

--2) 
    INSERT INTO dept VALUES(10,'ACCOUNTING','NEW-YORK');
    INSERT INTO dept VALUES(20,'RESEARCH','DALLAS');
    INSERT INTO dept VALUES(30,'SALES','CHICAGO');
    INSERT INTO dept VALUES(40,'OPERATIONS','BOSTON');

--3) 
    CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;

--4)
  INSERT INTO EMP VALUES(7369,'Bidon',NULL,NULL,NULL,NULL,NULL,NULL); 
  -- "Oui, Ça fonctionne normal "

--5) 
    RollBACK;

--6)
--Clé promaire
     ALTER TABLE emp
     ADD CONSTRAINT emp_pk PRIMARY KEY (empno);
--Clé etranger
     ALTER TABLE emp 
     ADD CONSTRAINT emp_fk FOREIGN KEY (deptno) REFERENCES                dept(deptno);
--Clé etranger
     ALTER TABLE emp
     ADD CONSTRAINT emp_mgr_fk FOREIGN KEY (mgr) REFERENCES emp(empno);

--7) 
   INSERT INTO emp VALUES(7369, 'WILSON', 'MANAGER', 7839, '17/11/91', 3500.00, 600.00, 10) ; 
--génerer un erreur car il exist un employee avec le numéo 7369
   INSERT INTO emp VALUES(7657, 'WILSON','MANAGER', 7839, '17/11/91', 3500.00, 600.00, 50) ; 
 -- génerer un erreur car il n'exist pas depto avec le numéro 50 dans la table dept
   INSERT INTO emp VALUES(7657, 'WILSON', 'MANAGER', 7000,'17/11/91', 3500.00, 600.00, 10) ;
--génerer un erreur car il n'exist pas un manager avec le numéo 7000	
   INSERT INTO emp VALUES(7657, 'WILSON', 'MANAGER', 7839,'17/11/91', 3500.00, 600.00, 10) ;
--génerer un erreur car la date écrit en invalide format	

--Mise à jour de la base de données
--1)
    UPDATE dept SET loc='PITTISBURGH'
    WHERE deptname='SALES';

--2)
    UPDATE emp SET SAL=SAL*1.10
    WHERE  comm>sal*0.5;

--3) 
   UPDATE emp
   SET comm=(  SELECT avg(comm) FROM emp)
   WHERE hiredate< to_date('01-JAN-82')
   AND comm IS NULL;

--4) 
    RollBACK;

--5) 
    DELETE FROM dept
    WHERE deptno=20;  
--génerer un erreur car il existe des réferences de le dept 20 dans la table emp


--Interrogation de base de données

--1) 
    SELECT ename,sal,comm,commission+salaire 
    FROM emp
    WHERE job='SALESMAN';

--2) 
    SELECT ename
    FROM emp
    WHERE job='SALESMAN'
    ORDER BY comm/sal DESC;

--3)
    SELECT ename
    FROM emp
    WHERE job='SALESMAN'
    AND comm<(0.25*sal);

--4)
    SELECT count(*)
    FROM emp
    WHERE deptno=10;

--5)
    SELECT count(*)
    FROM emp
    WHERE comm IS NOT NULL; 

--6)
   SELECT DISTINCT count(job)
   FROM emp;

--7)
     SELECT AVG(sal) 
     FROM emp
     GROUP BY JOB;

--8) 
    SELECT SUM(sal)
    FROM emp e
    JOIN dept d 
    ON(d.deptno=e.deptno)
    WHERE d.dname='SALES';

 --9)
    SELECT e.ename,d.ename 
    FROM emp e
    JOIN dept d
    ON(d.deptno=e.deptno);    

--10)
    SELECT ename,job,salaire
    FROM emp
    WHERE sal=(SELECT max(sal) FROM emp) ;

--11)
    SELECT ename
    FROM emp
    WHERE sal > (SELECT sal FROM emp WHERE ename='JONES');

--12)
    SELECT ename
    FROM emp
    WHERE job =  (SELECT job FROM emp WHERE ename='JONES'); 

--13)
    SELECT ename
    FROM emp
    WHERE mgr = (SELECT mgr FROM emp WHERE ename='CLARK');

--14)
    SELECT ename,job
    FROM emp
    WHERE mgr = (SELECT mgr FROM emp WHERE ename='TURNER')
    AND job = (SELECT job FROM emp WHERE ename='TURNER');

--15)
    SELECT ename
    FROM emp
    WHERE hire_date < (SELECT hire_date FROM emp WHERE deptno=10);

--16) 
    SELECT e.ename,m.ename
    FROM emp e 
    JOIN emp m
    ON(m.empno=e.mgr);

--17) 
    SELECT e.ename,m.ename
    FROM emp e 
    JOIN emp m
    ON(m.empno=e.mgr)
    WHERE (e.deptno=m.deptno);