/* 1. Afficher la liste de tous les clubs de Efrei en précisant leur type, président et
description. Les informations relatives au président doivent aussi être affichées,
notamment son nom, classe et niveau et numéro étudiant. */

/* À cause d'une erreur lors de l'insertion des données, tous les clubs n'ont pas de président */

SELECT type, description, membre.nom_etudiant, classe, niveau, membre.numero_etudiant, nom_responsabilite FROM `Club`
JOIN renfermer ON id_club = id_club_appartient
JOIN membre ON membre.numero_etudiant = renfermer.numero_etudiant
JOIN responsabilite ON membre.id_responsabilite = responsabilite.id_responsabilite
WHERE nom_responsabilite = 'président';


/* 2. Afficher la liste des évènements qui ont eu lieu l’année passée, avec leur comité
d’organisation, budget alloué et dépenses. */

/* Qui ont eu lieu l'année passée = Commencé et finis en 2021 */

SELECT nom_evenement, budget, comite_organisation.id_comite, comite_organisation.date_creation, comite_organisation.date_dissolution, nom_tache, montant_depense FROM evenement
JOIN tache ON tache.id_evenement = evenement.id_evenement
JOIN comite_organisation ON comite_organisation.id_comite = evenement.id_comite
WHERE date_debut LIKE '2021%' AND date_fin LIKE '2021%'; 

/* 3. Afficher l’état des rapports d’activité de chaque club. */

SELECT id_club, nom_etat FROM rapport_activite
JOIN etat_rapport ON etat_rapport.id_etat = rapport_activite.id_rapport

/* 4. Pour les rapports en cours de signature, afficher la liste des membres qui n’ont pas
encore signé. */

SELECT id_club, nom_etat, numero_etudiant FROM rapport_activite
JOIN etat_rapport ON etat_rapport.id_etat = rapport_activite.id_rapport
JOIN signature ON rapport_activite.id_rapport = signature.id_rapport
WHERE nom_etat = 'en attente'

/* 5. Afficher les étudiants qui participent à plus d’un seul club, en indiquant le nom du
club et leur position au sein de celui-ci (s'ils n'ont pas de responsabilité, la position
doit simplement mentionner membre). */

SELECT membre.numero_etudiant, nom_etudiant, COUNT(id_club_appartient) FROM membre
JOIN renfermer ON renfermer.numero_etudiant = membre.numero_etudiant
GROUP BY membre.numero_etudiant HAVING COUNT(id_club_appartient)>1

/* 6. Afficher la liste des dix tâches les plus coûteuses, avec leurs prix, et responsable. */

SELECT nom_tache, montant_depense, nom_etudiant, date_de_naissance FROM tache
JOIN membre ON id_responsable_tache = membre.numero_etudiant ORDER BY montant_depense DESC
LIMIT 10

/* 7. Donner les évènements communs à plusieurs clubs, avec la liste de leurs
responsables, et leurs affectations.*/



/* 8. Afficher la liste des récompenses allouées à chaque club, ainsi que leurs
provenances. */