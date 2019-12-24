--Exercice 1

--Q1) Donnez la liste des avions dont la capacité est supérieure à 350 passagers.
    SELECT * 
    FROM AIRPLANE
    WHERE capacity>350;
--Q2) Quels sont les numéros et noms des avions localisés à Nice ? 
    SELECT NumAP,NameAP	
    FROM AIRPLANE
    WHERE Localisation='Nice';
--Q3) Quels sont les numéros des pilotes en service et les villes de départ de leurs vols ?
    SELECT NumP,Dep_T 
    FROM FLIGHT;
--Q4) Donnez toutes les informations sur les pilotes de la compagnie. 
    SELECT *
    FROM PILOT;
--Q5) Quel est le nom des pilotes domiciliés à Paris dont le salaire est supérieur à 15000 ? 
    SELECT NameP 
    FROM PILOT 
    WHERE Salary>15000;
--Q6) Quels sont les avions (numéro et nom) localisés à Nice ou dont la capacité est inférieure à 350 passagers ? 
    SELECT * 
    FROM AIRPLANE
    WHERE Localisation='Nice' 
    AND capacity>350;
--Q7) Liste des vols au départ de Nice allant à Paris après 18 heures ? 
    SELECT * 
    FROM FLIGHT 
    WHERE Dep_T='Nice' 
    AND Arr_T='Paris' 
    AND (Arr_H-Dep) =18;
--Q8) Quels sont les numéros des pilotes qui ne sont pas en service ?
    SELECT NumP
    FROM PILOT 
    WHERE NumP NOT IN (SELECT DISTINCT NumP FROM VOL ); 
--Q9) Quels sont les vols (numéro, ville de départ) effectués par les pilotes de numéro 100 et 204 ? 
    SELECT NumF, Dep_T
    FROM FLIGHT
    WHERE NumP IN (100,204);

--Exercice 2
--1)
    SELECT Personne 
    FROM EMPRUNT 
    WHERE Livre = 'Recueil Examens BD';
--2)
    SELECT Personne
    FROM EMPRUNT
    WHERE Personne NOT IN (SELECT Personne FROM RETARD)
--3)
 




