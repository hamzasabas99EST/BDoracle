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
    
    DMBS_OUTPUT.PUT_LINE('Factoriel de '|| a ||' '|| fact);
    
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
    
    DMBS_OUTPUT.PUT_LINE( 'Valeur max' ||v_id);
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
    



