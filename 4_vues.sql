/* 1. Créer une vue appelée « top_clubs » qui permet de donner la liste des clubs qui
respectent toujours leur budget (dont la dépense est inférieure au budget et aux
rentrées d’argent). */
CREATE VIEW top_clubs AS
SELECT
  *
FROM
  (
    SELECT
      DISTINCT sponsoriser.id_evenement,
      SUM(montant_sponsoriser) + budget - SUM(montant_depense) as marge,
      nom_club
    FROM
      sponsoriser
      JOIN sponsor ON sponsoriser.id_sponsor = sponsor.id_sponsor
      JOIN tache ON tache.id_tache = sponsoriser.id_evenement
      JOIN evenement ON tache.id_evenement = evenement.id_evenement
      JOIN organiser ON organiser.id_club = evenement.id_evenement
      JOIN `Club` ON organiser.id_club = Club.id_club
    GROUP BY
      id_evenement
    ORDER BY
      marge DESC
  ) as res
WHERE
  marge > 0;

/* 2. Créer une vue appelée « top_présidents » qui les présidents de clubs qui rédigent le
rapport d’activité dans les délais les plus courts. */



/* 3. Créer une vue appelée « aujourd’hui », qui donne la liste des évènements prévus
pour aujourd’hui, classés par horaire, et en indiquant le (ou les) clubs responsables. */

CREATE VIEW aujourd’hui AS
SELECT
  diffDay
FROM
  (
    SELECT
      DATEDIFF(
        (
          SELECT
            CAST(NOW() AS DATE)
        ),
        date_debut
      ) as diffDay
    FROM
      evenement
  ) as ref
WHERE
  diffDay = 0;

/* 4. Créer une vue appelée « fainéant », qui donne le nom du membre du comité
d’organisation d’un club donné qui signe le rapport en dernier. */

CREATE VIEW fainéant AS
SELECT
  nom_etudiant,
  classe,
  date_de_naissance
FROM
  membre
WHERE
  numero_etudiant = (
    (
      SELECT
        numero_etudiant
      FROM
        (
          SELECT
            dependre.id_etat,
            nom_etat,
            id_rapport
          FROM
            (
              SELECT
                *
              FROM
                etat_rapport
              WHERE
                nom_etat = 'signé'
              ORDER BY
                date_modification_rapport DESC
              LIMIT
                1
            ) as select_1
            JOIN dependre ON dependre.id_etat = select_1.id_etat
        ) AS select_2
        JOIN signature ON signature.id_rapport = select_2.id_rapport
    )
  )

/* 5. Créer une vue appelée « trouble_fête », qui donne le nom du club ayant eu le plus
de sanctions. */

CREATE VIEW trouble_fête AS
SELECT
  *
FROM
  (
    SELECT
      recevoir.id_club,
      COUNT(provenance) as nbrSanction,
      nom_club
    FROM
      recevoir
      JOIN sanction ON recevoir.id_sanction = sanction.id_sanction
      JOIN `Club` ON recevoir.id_club = Club.id_club
    GROUP BY
      recevoir.id_club
  ) AS allSanction
WHERE
  nbrSanction = (
    SELECT
      MAX(nbrSanction)
    FROM
      (
        SELECT
          recevoir.id_club,
          COUNT(provenance) as nbrSanction,
          nom_club
        FROM
          recevoir
          JOIN sanction ON recevoir.id_sanction = sanction.id_sanction
          JOIN `Club` ON recevoir.id_club = Club.id_club
        GROUP BY
          recevoir.id_club
      ) AS TROUBLE
  )

/* 6. Créer une vue appelée « vaut_mieux_acheter » qui donne les tâches de type
« location » les plus coûteuses. */


CREATE VIEW vaut_mieux_acheter AS
SELECT * FROM tache
WHERE montant_depense = (SELECT MAX(montant_depense) FROM tache
WHERE nom_tache LIKE "%Location%")

/* 7. Créer une vue appelée « teachers_pet » qui donne le nom du club ayant eu le plus
de récompenses de la part de l’administration. */

CREATE VIEW teachers_pet AS
SELECT id_club, nom_club, date_de_creation FROM `Club`
WHERE id_club = (SELECT
  id_club
FROM
  (
    SELECT
      id_club,
      COUNT(id_recompense) as nbrRecompense
    FROM
      decerner
    GROUP BY
      id_club
  ) AS select_1
WHERE
  nbrRecompense = (
    SELECT
      MAX(nbrRecompense)
    FROM
      (
        SELECT
          id_club,
          COUNT(id_recompense) as nbrRecompense
        FROM
          decerner
        GROUP BY
          id_club
      ) AS select_2
  ))

/* 8. Créer une vue appelée « perf » qui donne, pour un club donné, la liste de tous ses
présidents classés par date, avec pour chacun les évènements qu’il a organisé, 
l’argent qu’il a pu obtenir du sponsoring, le temps pris pour la rédaction du rapport,
et les récompenses et sanctions obtenues pendant son mandat.*/