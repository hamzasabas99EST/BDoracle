--TP4
--Ex1
DECLARE 
    a NUMBER :=3;
    b NUMBER :=4;
    c NUMBER ;
BEGIN
    dbms_output.put_line('Les valeurs avant permutation'||' a :'|| a ||' b: '||b);
    c:=a;
    a:=b;
    b:=c;
    dbms_output.put_line('Les valeurs après permutation '||'a: ' || a ||' b: '|| b);
END;

--Ex2

DECLARE 
    a NUMBER :=10;
    fact NUMBER:=1 ;
    
BEGIN 
    FOR i IN 1..a LOOP
    fact:=fact*i;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Factoriel de '|| a ||' '|| fact);
    
END;

--Ex3
DECLARE
    v_id departments.department_id%TYPE;
BEGIN
    SELECT max(department_id)
    INTO v_id
    FROM departments;
    
    INSERT INTO departments
    VALUES (v_id+10,'ISIL',200,1500);
END;

--Ex4
DECLARE
    v_id departments.department_id%TYPE;
BEGIN
    SELECT max(department_id)
    INTO v_id
    FROM departments;
    
    DBMS_OUTPUT.PUT_LINE( 'Valeur max' ||v_id);
END;

--Ex6
DECLARE
    v_id departments.department_id%TYPE;
BEGIN
    SELECT max(department_id)
    INTO v_id
    FROM departments;
    
    UPDATE departments 
    SET location_id=2500
    WHERE department_id=v_id;
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;



--EX8
DECLARE
    CURSOR emp_cursor IS 
        SELECT * FROM employees
        order by hire_date DESC;
        
    t_emp emp_cursor%ROWTYPE;
    
BEGIN
    OPEN emp_cursor;
    LOOP
     FETCH emp_cursor INTO  t_emp;
     EXIT WHEN emp_cursor%ROWCOUNT>10;
     DBMS_OUTPUT.PUT_LINE(t_emp.employee_id);
    END LOOP; 
    CLOSE emp_cursor;
END;

--Ex9

DECLARE 
    v_nombre NUMBER;
BEGIN 
    SELECT count(*) 
    INTO v_nombre
    FROM employees
    WHERE department_id=30:
    
    DBMS_OUTPUT.PUT_LINE('Nombre de personnes travaillant dans le service numéro 30 est : '|| v_nombre);
END;
    
--Ex10
    DECLARE
        v_name employee.last_name%TYPE;
        v_salary  employee.salary%TYPE;
    BEGIN
      SELECT last_name,salary
      INTO v_name,v_salary
      FROM employees;

      IF v_salary<3000 THEN 
        v_salary+=500;
        DBMS_OUTPUT.PUT_LINE(v_name||' salary is updated ');

      ELSE 
        DBMS_OUTPUT.PUT_LINE(v_name||' earn '||v_salary);
      END IF;
    END;

--Ex11
    --1) a)
    SELECT horaire 
    FROM salle
    WHERE titre='Les misérables';
    --b)
    SELECT acteur
    FROM FILM
    GROUP BY acteur
    HAVING COUNT(Titre)=(SELECT COUNT(*) FROM Film);
    --c)
    SELECT spectateur FROM Vu
    GROUP BY spectateur
    HAVING COUNT(Titre)=(SELECT COUNT(Titre) FROM Aime GROUP BY Amateur);
    --2)
     DECLARE
        CURSOR film_cursor IS
        SELECT count(*) as 'nombrefilm',p.prodecteur
        FROM FILM f JOIN PRODUCTEUR p
        ON(f.titre=p.titre)
        GROUP BY p.prodecteur;

     BEGIN 
        OPEN film_cursor;
            FOR film_record IN film_cursor LOOP
                IF film_record%NOTFOUND THEN
                DBMS_OUTPUT.PUT_LINE('Pas de film disponibles !!');
                ELSE
                DBMS_OUTPUT.PUT_LINE('Le réalisateur : '||film_record.nombrefilm || 'à realisé '||film_record.p.prodecteur);

            END LOOP;
        CLOSE film_cursor; 
        END;


