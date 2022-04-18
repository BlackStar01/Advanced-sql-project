const express = require('express');
const mysql = require('mysql');

const app = express();
const path = require('path');

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'root',
    database: 'project'
});

db.connect((err) => {
    if(err) {
        console.log(err)
    }
    else
    {
        console.log('Connected...')
    }
})
const req_1 = "SELECT type, description, membre.nom_etudiant, classe, niveau, membre.numero_etudiant, nom_responsabilite FROM `Club` JOIN renfermer ON id_club = id_club_appartient JOIN membre ON membre.numero_etudiant = renfermer.numero_etudiant JOIN responsabilite ON membre.id_responsabilite = responsabilite.id_responsabilite WHERE nom_responsabilite = 'président';" 
const req_2 = "SELECT nom_evenement, budget, comite_organisation.id_comite, comite_organisation.date_creation, comite_organisation.date_dissolution, nom_tache, montant_depense FROM evenement JOIN tache ON tache.id_evenement = evenement.id_evenement JOIN comite_organisation ON comite_organisation.id_comite = evenement.id_comite WHERE date_debut LIKE '2021%' AND date_fin LIKE '2021%'; "
const req_3 = "SELECT id_club, nom_etat FROM rapport_activite JOIN etat_rapport ON etat_rapport.id_etat = rapport_activite.id_rapport"
const req_4 = "SELECT id_club, nom_etat, numero_etudiant FROM rapport_activite JOIN etat_rapport ON etat_rapport.id_etat = rapport_activite.id_rapport JOIN signature ON rapport_activite.id_rapport = signature.id_rapport WHERE nom_etat = 'en attente'"
const req_5 = "SELECT membre.numero_etudiant, nom_etudiant, COUNT(id_club_appartient) FROM membre JOIN renfermer ON renfermer.numero_etudiant = membre.numero_etudiant GROUP BY membre.numero_etudiant HAVING COUNT(id_club_appartient)>1"
const req_6 = "SELECT nom_tache, montant_depense, nom_etudiant, date_de_naissance FROM tache JOIN membre ON id_responsable_tache = membre.numero_etudiant ORDER BY montant_depense DESC LIMIT 10"
const req_7 = "SELECT * FROM (SELECT id_evenement, COUNT(id_club) as nbrOrganisateurs FROM organiser GROUP BY id_evenement) as allEvents WHERE nbrOrganisateurs>1"
const req_8 = "SELECT decerner.id_club, nom_club, decerner.id_recompense, provenance FROM decerner JOIN recompense ON decerner.id_recompense = recompense.id_recompense JOIN `Club` ON decerner.id_club = Club.id_club"

let tabRoute = ['/req_1', '/req_2', '/req_3', '/req_4', '/req_5', '/req_6', '/req_7', '/req_8']
let tabReq = [req_1, req_2 ,req_3, req_4, req_5, req_6, req_7, req_8]

for (let index = 0; index < tabRoute.length; index++) {
    app.get(tabRoute[index], (req, res) => {
        let sql = tabReq[index]
        db.query(sql, (err, result) => {
            if(err) console.log(err);
            res.send(result)
        })
    })    
}

app.listen('3000', () => {
    console.log("Server run on port 3000");
})