--A) Création des tables

--TABLE PIECE
CREATE TABLE PIECE(
        NOP number(3),
        DESIGNATION varchar2(30),
        COULEUR varchar2(30),
        POIDS VARCHAR2(23)
    );


--TABLE SERVICE
CREATE TABLE SERVICE(
           NOS NUMBER(4),
           INTITULE varchar2(30),
           LOCALISATION VARCHAR2(40)
        );

--TABLE ORDRE 
CREATE TABLE ORDRE(
            NOP NUMBER(5),
            NOS NUMBER(5),
            QUANTITE NUMBER(5)
    );

--TABLE NOMCLATURE
CREATE TABLE NOMENCLATURE (
                NOPA NUMBER(5),
                NOPC NUMBER(5),
                QUANTITE NUMBER(3)
        );

--B) Contraintes d'intégrité 

--1)
    INSERT INTO PIECE VALUES (14,'P1','bleu','10kg');
    INSERT INTO PIECE VALUES (14,'P2','jaune','15kg');

--2)
    INSERT INTO SERVICE VALUES (30,'Sales','MARRAKECH');
    INSERT INTO SERVICE VALUES (30,'Progrmmation','LAAYOUNE');

--3) 
     INSERT INTO ORDRE VALUES (35,14,40);
     INSERT INTO ORDRE VALUES (36,14,45);

--4)
    INSERT INTO NOMENCLATURE VALUES (36,15,46);
    INSERT INTO NOMENCLATURE VALUES (30,6,40);

--5) 
    --Table piece
    ALTER TABLE PIECE 
    ADD CONSTRAINT pi_pk PRIMARY KEY (NOP) ;


--Table service
    ALTER TABLE SERVICE
    ADD CONSTRAINT serv_pk PRIMARY KEY (NOS) ;

--Table ordre
    ALTER TABLE ORDRE
    ADD CONSTRAINT ord_pk PRIMARY KEY (NOP, NOS) ;

    ALTER TABLE ORDRE 
    ADD CONSTRAINT ord_nop_fk FOREIGN KEY (NOP) REFERENCES PIECE (NOP) ;

    ALTER TABLE ORDRE 
    ADD CONSTRAINT ord_noc_fk FOREIGN KEY (NOS) REFERENCES SERVICE (NOS) ;

--Table NOMENCLATURE
    ALTER TABLE NOMENCLATURE 
    ADD CONSTRAINT nom_pk PRIMARY KEY (NOPA, NOPC) ;

    ALTER TABLE NOMENCLATURE
    ADD CONSTRAINT nom_nop_fk FOREIGN KEY (NOPA) REFERENCES PIECE (NOP) ;

    ALTER TABLE NOMENCLATURE 
    ADD CONSTRAINT nom_nos_fk FOREIGN KEY (NOPC) REFERENCES PIECE (NOP) ;


--6) 

--7)
    ALTER TABLE PIECE 
    ADD CONSTRAINT col_chck CHECK (COLOR IN('ROUGE','VERTE','BLUE','JAUNE'));

--C) Modification de la structure de la base
--1)
    ALTER TABLE PIECE 
    MODIFY  DESIGNATION VARCHAR2(40) ;

    ALTER TABLE SERVICE
    MODIFY INTITULE VARCHAR2(40) ;
--2)
    ALTER TABLE SERVICE 
    MODIFY LOCALISATION VARCHAR2(30);
--3)
    ALTER TABLE SERVICE ADD  DIRECTEUR VARCHAR2(20) ;
--4)
    ALTER TABLE SERVICE DROP COLUMN LOCALISATION ;
--5)
    ALTER TABLE PIECE DROP CONSTRAINT pi_pk;
--6) 
    ALTER TABLE PIECE DROP CONSTRAINT col_chck;
--7)
    DROP TABLE NOMENCLATURE ;
--8) 
    DROP TABLE ORDRE CASCADE CONSTRAINTS ;


