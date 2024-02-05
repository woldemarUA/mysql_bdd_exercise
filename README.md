# brigitte_bdd
	TASK	QUERY
1	Le nom des animaux du refuge. 	SELECT nom FROM Animal;
_____________________________________________
2	Les fonctionnalités disponibles dans le refuge. 	SELECT titre FROM Role;
_____________________________________________
3	Les noms des léopards. 	 SELECT nom FROM Animal a JOIN Espece e ON e.id=a.especeId WHERE e.titre="Leopard";
_____________________________________________
4	Les maladies contractées au moins une fois par des animaux du refuge. 	
SELECT  m.nom AS Maladies_Contractees_au_moins_une_fois 
FROM Maladie m  
JOIN CarnetMaladie cm ON cm.maladieId=m.id;
_____________________________________________
5	Les noms et numéros de cage des animaux mâles qui sont originaires du Kenya et dont la date de naissance est antérieure à 1992. 	

SELECT a.nom AS Animal_Nom, c.numero AS Cage_Numero, a.dateNaissance AS Date_Naissance 
FROM Animal a 
JOIN Cage c ON c.id=a.cageId 
WHERE pays='Kenya' AND YEAR(a.dateNaissance) <1992;
_____________________________________________
6	Une requête produisant l’affichage suivant : Peyrin vit à Nouméa Berrut vit à Sartène Sicard vit à Calvi Voiron vit à Pointe à Pitre Scholl vit à Ushuaia Adiba vit à Papeete.	

SELECT e.nom AS NOM, v.titre AS VIT_A
FROM Employe e
JOIN Ville v ON v.id = e.villeId
WHERE e.id<7;
_____________________________________________

7	Le nom et l’âge des animaux en 2017	
SELECT nom, TIMESTAMPDIFF(YEAR, dateNaissance, '2017-12-31') AS Age_En_2017 
FROM Animal 
WHERE TIMESTAMPDIFF(YEAR, dateNaissance, '2017-12-31')>0;
_____________________________________________
8	Le nom des soigneurs qui habitent Ushuaïa. 	
SELECT e.nom, v.titre 
FROM Employe e
 JOIN Ville v ON v.id = e.villeId 
JOIN Role r ON r.id = e.roleId 
WHERE v.titre = 'Ushuaia' AND r.titre = 'Soigneur'";
_____________________________________________
9	La fonctionnalité et le nom du soigneur des cages gardées par un employé habitant Calvi. 	"SELECT e.nom AS Employe_Nom , c.fonctionalite AS Cage_Fonc 
FROM Employe e 
JOIN Cage c ON c.soigneurId = e.id 
JOIN Ville v ON v.id = e.villeId 
WHERE v.titre = 'Calvi'"
10	Le nom des animaux ainsi que des employés qui en sont soit les soigneurs soit les responsables. 	SELECT a.nom AS Animal_Nom, soign.nom AS Soigneur_Nom, resp.nom AS Responsable_Nom FROM Animal a JOIN Employe soign ON soign.id = a.soigneurId JOIN Employe resp ON resp.id = a.responsableId;
11	Le nom des soigneurs gardant tous les animaux.	SELECT e.nom  FROM Employe e JOIN Role r ON r.id = e.roleId WHERE r.titre = 'Soigneur'
12	Les noms et types des animaux qui n’ont jamais été malades. 	" SELECT a.nom AS Animal_Nom, e.titre AS Espece  
FROM Animal a 
JOIN Espece e ON e.id=a.especeId 
JOIN CarnetSante cs ON cs.id =
a.carnetSanteId 
LEFT JOIN CarnetMaladie cm ON cm.carnetId = cs.id 
LEFT JOIN Maladie m ON m.id = cm.maladieId 
WHERE m.nom IS NULL;"
13	Les noms des animaux originaires du Kenya ayant déjà contractés une grippe	"SELECT a.nom AS Animal_Nom 
FROM Animal a 
JOIN CarnetSante cs ON cs.id = a.carnetSanteId 
JOIN CarnetMaladie cm ON cm.carnetId = cs.id 
JOIN Maladie m ON m.id = cm.maladieId 
WHERE m.nom='Grippe'"
14	Les numéros et fonctionnalités des cages qui sont inoccupées. 	"SELECT c.numero AS Cage_Numero, c.fonctionalite AS Cage_Fonctionalite 
FROM Animal a  
RIGHT JOIN Cage c  ON a.cageId = c.id 
WHERE a.id IS NULL;"
15	Donner pour chaque animal mâle l’ensemble des maladies qu’il a contractées (ensemble des couples nom d’animal, nom de maladie). 	"SELECT a.nom AS Animal_Nom, m.nom AS Maladie_Nom 
FROM Animal a 
JOIN CarnetSante cs ON cs.id = a.carnetSanteid
JOIN CarnetMaladie cm ON cm.carnetId = cs.id
JOIN Maladie m ON m.id = cm.maladieId
 JOIN Sexe s ON s.id=a.sexeId WHERE s.titre ='male'"
16	Les numéros et fonctionnalités des cages qui sont partagées par des animaux de types différents. En d’autres termes, ce sont les cages qui contiennent au moins deux animaux de types différents. 	"SELECT c.numero AS Cage_Numero, c.fonctionalite as Cage_Fonctionalite 
FROM Animal a 
JOIN Cage c ON c.id =a.cageId 
GROUP BY cageId 
HAVING COUNT(*)>1"
17	Les noms des responsables et les noms des soigneurs de Charly. 	"SELECT a.nom AS Animal_Nom, soign.nom AS Soigneur_Nom, resp.nom AS Responsable_Nom 
FROM Animal a 
JOIN Employe soign ON soign.id = a.soigneurId 
JOIN Employe resp ON resp.id = a.responsableId 
WHERE a.nom='Charly'"
18	Le nom et le pays d’origine de l’animal doyen du refuge (il peut y en avoir plusieurs).	"SELECT nom, TIMESTAMPDIFF(YEAR, dateNaissance, CURRENT_DATE()) AS Age_Actuel 
FROM Animal 
WHERE  TIMESTAMPDIFF(YEAR, dateNaissance, CURRENT_DATE())>6"
19	Le nom, le type et l’année de naissance des animaux qui ont contracté toutes les maladies (connues) du refuge	"SELECT a.nom AS Animal_Nom, e.titre AS Espece ,YEAR(a.dateNaissance) AS Annee_Naissance, m.nom, m.date 
FROM Animal a 
JOIN Espece e ON e.id = a.especeId 
JOIN CarnetSante cs ON cs.id = a.carnetSanteId 
JOIN CarnetMaladie cm ON cm.carnetid = cs.id 
JOIN Maladie m ON m.id = cm.maladieId"
20	Le nom, le type et le pays d’origine des animaux qui partagent la cage de Charly.	" SELECT a1.nom AS Animal1_Nom, a2.nom AS Animal2_Nom  
FROM Animal a1 
JOIN Animal a2 ON a1.cageId = a2.cageId AND a1.id<a2.id 
WHERE a1.nom='Charly' OR a2.nom='Charly'"
21	Le nom et l’adresse des employés qui sont soigneurs d’animaux de tous types, on fait référence aux types des animaux du refuge.	"SELECT e.nom AS Employe_Nom, v.titre AS Employe_Addresse, es.titre AS Espece 
FROM Animal a 
JOIN Employe e ON e.id = a.soigneurId 
JOIN Ville v ON v.id = e.villeId 
JOIN Espece es ON es.id = a.especeId 
ORDER BY e.nom"
22	Lister le nom et l'âge de tous les animaux	SELECT nom AS Animal_Nom, TIMESTAMPDIFF(YEAR, dateNaissance, NOW()) AS Age_Actuel FROM Animal
23	Donner les caractéristiques de l'animal appelé HECTOR 	"SELECT 
    a.nom AS Animal_Nom, 
    e.titre AS Espece, 
    sexe.titre AS Sexe, 
    a.dateNaissance AS Animal_Naissance, 
    a.dateArivee AS Arrive, 
    GROUP_CONCAT(DISTINCT m.nom ORDER BY m.nom ASC SEPARATOR ', ') AS Maladies, 
    c.numero AS Cage_Numero, 
    c.fonctionalite AS Cage_Fonct, 
    soign.nom AS Soigneur, 
    resp.nom AS Responsable, 
    mere.nom AS Mere_Nom, 
    pere.nom AS Pere_Nom
FROM Animal a
JOIN Espece e ON e.id = a.especeId
JOIN Sexe sexe ON sexe.id = a.sexeId
JOIN CarnetSante cs ON cs.id = a.carnetSanteId
LEFT JOIN CarnetMaladie cm ON cm.carnetId = cs.id
LEFT JOIN Maladie m ON m.id = cm.maladieid
JOIN Cage c ON c.id = a.cageId
JOIN Employe soign ON soign.id = a.soigneurId
JOIN Employe resp ON resp.id = a.responsableId
LEFT JOIN Animal mere ON mere.id = a.mereId
LEFT JOIN Animal pere ON pere.id = a.pereId
WHERE a.nom='Hector'
GROUP BY a.nom, e.titre, sexe.id, a.dateNaissance, a.dateArivee, c.numero, c.fonctionalite, soign.nom, resp.nom, mere.nom, pere.nom
\G;"
24	Donner les origines distinctes de toutes les familles. 	SELECT DISTINCT pays AS Pays_d_Origine FROM Animal
25	Donner les noms des singes de plus de 10 ans et originaire d'Afrique. 	SELECT a.nom FROM Animal a JOIN Ordre o ON o.id = a.ordreId WHERE o.titre='Primates' AND TIMESTAMPDIFF(YEAR, a.dateNaissance, NOW())>10 AND a.continent='Afrique'
26	Donner les noms des singes ainsi que des animaux de plus de 8 ans	"SELECT nom 
FROM Animal 
WHERE ordreId = (SELECT id FROM Ordre WHERE titre='Primates') OR TIMESTAMPDIFF(YEAR, dateNaissance, NOW())>8"
27	Donner les races des animaux dont le numéro de menu est 1 et l'âge est supérieur à 10. 	" SELECT e.titre  
FROM Animal a 
JOIN Espece e ON e.id = a.especeId 
JOIN Menu m ON m.animalId = a.id 
WHERE TIMESTAMPDIFF(YEAR, a.dateNaissance, NOW())>10 AND m.numero=1"
28	Donner les menus plus 2 fois moins riches en viande qu'en légume?	"SELECT m.numero, GROUP_CONCAT(DISTINCT m.alimentId) AS AlimentIds 
FROM Menu m 
JOIN (   
      SELECT DISTINCT m1.numero   
      FROM Menu m1   
      JOIN Menu m2 ON m1.numero = m2.numero   
      WHERE m1.alimentId = 2     AND  m2.alimentId = 11     AND (m1.quantite / m2.quantite) <= 0.5 ) 
   subquery ON m.numero = subquery.numero 
GROUP BY m.numero;"
29	Donner l'âge et l'origine des animaux qui sont amis de l'homme.	"SELECT TIMESTAMPDIFF(YEAR, dateNaissance, NOW()) AS Age_Actuel, pays AS Pays_d_Origine 
FROM Animal 
WHERE amis='Domestic'"
30	Numéro de menu et quantité de viande pour les animaux qui ont une attitude amicale envers l'homme	"SELECT 
    a.nom AS Animal_Nom,
    m.numero AS Menu_Numero,
    m.quantite AS Meat_Quantite
FROM 
    Animal a
JOIN 
    Menu m ON a.id = m.animalId
JOIN 
    Aliment al ON m.alimentId = al.id
WHERE 
    a.amis = 'Domestic' AND al.titre = 'Viande Fraiche';"
31	Donner les noms des animaux qui sont grands parents.	"SELECT DISTINCT
    gp.nom AS Grandparent_Nom
FROM 
    Animal gp
JOIN 
    Animal p ON gp.id = p.mereId OR gp.id = p.pereId
JOIN 
    Animal gc ON p.id = gc.mereId OR p.id = gc.pereId
WHERE
    gc.id IS NOT NULL;"
32	32 -Quantité de viande totale pour tous les menus. 	"SELECT
    a.nom AS Animal_Nom,
    e.titre AS ESPECE,
    al.titre AS Aliment,
    SUM(m.quantite) AS Total_Consumption_Kg,
    m.notes AS NOTES
FROM
    Animal a
JOIN
    Menu m ON a.id = m.animalId
JOIN
    Aliment al ON al.id = m.alimentId
JOIN
    Espece e ON e.id = a.especeId
WHERE
    al.titre = 'Viande Fraiche'
GROUP BY
    a.nom, e.titre, al.titre, m.notes

UNION ALL

SELECT
    'Total' AS Animal_Nom,
    '' AS ESPECE,
    'Viande Fraiche' AS Aliment,
    SUM(m.quantite) AS Total_Consumption_Kg,
    '' AS NOTES
FROM
    Menu m
JOIN
    Aliment al ON al.id = m.alimentId
WHERE
    al.titre = 'Viande Fraiche';"
33	Nombre d'enfants pour chaque numéro d'animal.	"SELECT 
    p.nom AS Parent_Name,
    COUNT(e.id) AS Numero_d_Enfant
FROM 
    Animal p
LEFT JOIN 
    Animal e ON p.id = e.mereId OR p.id = e.pereId
GROUP BY 
    p.id;"
34	Lister les animaux qui dont on connaît les deux parents. 	SELECT a.nom, e.titre FROM Animal a JOIN Espece e ON e.id = a.especeID WHERE (a.mereId IS NOT NULL) AND (a.pereId IS NOT NULL);
35	Donner la moyenne de la quantité de viande servie dans les menus.	"SELECT 
    AVG(m.quantite) AS Quantite_Moyenne
FROM 
    Menu m
JOIN 
    Aliment al ON m.alimentId = al.id
WHERE 
    al.titre IN ('Viande Fraiche', 'Poisson');"
36	Donner les numéros et la composition des menus plus riches en viande que la moyenne (se servir de la requête précédente pour faire cette requête). 	"SELECT 
    m.numero AS Numero_de_Menu,
    GROUP_CONCAT(DISTINCT al.titre ORDER BY al.titre SEPARATOR ', ') AS Composition_du_Menu,
    AVG(m.quantite) AS Quantite_Moyenne_de_Viande
FROM 
    Menu m
JOIN 
    Aliment al ON m.alimentId = al.id
WHERE 
    al.titre IN ('Viande Fraiche', 'Poisson')
GROUP BY 
    m.numero
HAVING 
    AVG(m.quantite) > (
        SELECT 
            AVG(m2.quantite)
        FROM 
            Menu m2
        JOIN 
            Aliment al2 ON m2.alimentId = al2.id
        WHERE 
            al2.titre IN ('Viande Fraiche', 'Poisson')
    );"
![image](https://github.com/woldemarUA/brigitte_bdd/assets/3956891/5ded7a6b-16a6-480a-82d7-672e6fc56418)

