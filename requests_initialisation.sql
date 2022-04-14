CREATE DATABASE project;

USE project;

CREATE TABLE type_club(
   id_type INT AUTO_INCREMENT,
   nom_type VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_type)
);

CREATE TABLE responsabilite(
   id_responsabilite INT AUTO_INCREMENT,
   nom_responsabilite VARCHAR(50) NOT NULL,
   date_debut DATE NOT NULL,
   date_fin DATE NOT NULL,
   PRIMARY KEY(id_responsabilite)
);

CREATE TABLE comite_organisation(
   id_comite INT AUTO_INCREMENT,
   date_creation DATE NOT NULL,
   date_dissolution DATE NOT NULL,
   PRIMARY KEY(id_comite)
);

CREATE TABLE type_evenement(
   id_type INT AUTO_INCREMENT,
   nom_type VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_type)
);

CREATE TABLE etat_rapport(
   id_etat INT AUTO_INCREMENT,
   nom_etat VARCHAR(50) NOT NULL,
   date_modification_rapport DATE NOT NULL,
   PRIMARY KEY(id_etat)
);

CREATE TABLE recompense(
   id_recompense INT AUTO_INCREMENT,
   provenance VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_recompense)
);

CREATE TABLE sanction(
   id_sanction INT AUTO_INCREMENT,
   provenance VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_sanction)
);

CREATE TABLE sponsor(
   id_sponsor INT AUTO_INCREMENT,
   montant_sponsoriser DECIMAL(15,0) NOT NULL,
   PRIMARY KEY(id_sponsor)
);

CREATE TABLE Club(
   id_club INT AUTO_INCREMENT,
   nom_club VARCHAR(50) NOT NULL,
   date_de_creation DATE NOT NULL,
   type VARCHAR(50),
   description VARCHAR(255),
   id_type INT NOT NULL,
   PRIMARY KEY(id_club),
   FOREIGN KEY(id_type) REFERENCES type_club(id_type)
);

CREATE TABLE membre(
   numero_etudiant INT AUTO_INCREMENT,
   nom_etudiant VARCHAR(50) NOT NULL,
   genre BOOLEAN NOT NULL,
   classe VARCHAR(50) NOT NULL,
   niveau VARCHAR(50),
   date_de_naissance DATE NOT NULL,
   id_responsabilite INT,
   PRIMARY KEY(numero_etudiant),
   FOREIGN KEY(id_responsabilite) REFERENCES responsabilite(id_responsabilite)
);

CREATE TABLE evenement(
   id_evenement INT AUTO_INCREMENT,
   nom_evenement VARCHAR(50) NOT NULL,
   date_fin DATE NOT NULL,
   horaire_debut TIME NOT NULL,
   horaire_fin TIME NOT NULL,
   date_debut DATE NOT NULL,
   budget DECIMAL(15,2),
   id_type INT NOT NULL,
   id_comite INT NOT NULL,
   PRIMARY KEY(id_evenement),
   FOREIGN KEY(id_type) REFERENCES type_evenement(id_type),
   FOREIGN KEY(id_comite) REFERENCES comite_organisation(id_comite)
);

CREATE TABLE tache(
   id_tache INT AUTO_INCREMENT,
   nom_tache VARCHAR(50) NOT NULL,
   id_responsable_tache INT NOT NULL,
   montant_depense DECIMAL(15,2) NOT NULL,
   id_evenement INT NOT NULL,
   PRIMARY KEY(id_tache),
   FOREIGN KEY(id_evenement) REFERENCES evenement(id_evenement)
);

CREATE TABLE rapport_activite(
   id_rapport INT AUTO_INCREMENT,
   etat_actuel VARCHAR(50) NOT NULL,
   id_club INT NOT NULL,
   PRIMARY KEY(id_rapport),
   FOREIGN KEY(id_club) REFERENCES Club(id_club)
);

CREATE TABLE signature(
   id_signature INT AUTO_INCREMENT,
   id_rapport INT NOT NULL,
   numero_etudiant INT NOT NULL,
   PRIMARY KEY(id_signature),
   UNIQUE(numero_etudiant),
   FOREIGN KEY(id_rapport) REFERENCES rapport_activite(id_rapport),
   FOREIGN KEY(numero_etudiant) REFERENCES membre(numero_etudiant)
);

CREATE TABLE renfermer(
   id_club_appartient INT,
   numero_etudiant INT,
   PRIMARY KEY(id_club_appartient, numero_etudiant),
   FOREIGN KEY(id_club_appartient) REFERENCES Club(id_club),
   FOREIGN KEY(numero_etudiant) REFERENCES membre(numero_etudiant)
);

CREATE TABLE organiser(
   id_club INT,
   id_evenement INT,
   PRIMARY KEY(id_club, id_evenement),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(id_evenement) REFERENCES evenement(id_evenement)
);

CREATE TABLE decerner(
   id_club INT,
   id_recompense INT,
   PRIMARY KEY(id_club, id_recompense),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(id_recompense) REFERENCES recompense(id_recompense)
);

CREATE TABLE recevoir(
   id_club INT,
   id_sanction INT,
   PRIMARY KEY(id_club, id_sanction),
   FOREIGN KEY(id_club) REFERENCES Club(id_club),
   FOREIGN KEY(id_sanction) REFERENCES sanction(id_sanction)
);

CREATE TABLE sponsoriser(
   id_evenement INT,
   id_sponsor INT,
   PRIMARY KEY(id_evenement, id_sponsor),
   FOREIGN KEY(id_evenement) REFERENCES evenement(id_evenement),
   FOREIGN KEY(id_sponsor) REFERENCES sponsor(id_sponsor)
);

CREATE TABLE dependre(
   id_rapport INT,
   id_etat INT,
   PRIMARY KEY(id_rapport, id_etat),
   FOREIGN KEY(id_rapport) REFERENCES rapport_activite(id_rapport),
   FOREIGN KEY(id_etat) REFERENCES etat_rapport(id_etat)
);


insert into sanction (provenance) values ('Ford');
insert into sanction (provenance) values ('Saturn');
insert into sanction (provenance) values ('Porsche');
insert into sanction (provenance) values ('Toyota');
insert into sanction (provenance) values ('GMC');
insert into sanction (provenance) values ('Dodge');
insert into sanction (provenance) values ('Jaguar');
insert into sanction (provenance) values ('Lincoln');
insert into sanction (provenance) values ('Lincoln');
insert into sanction (provenance) values ('Subaru');
insert into sanction (provenance) values ('GMC');
insert into sanction (provenance) values ('Suzuki');
insert into sanction (provenance) values ('Jeep');
insert into sanction (provenance) values ('Volkswagen');
insert into sanction (provenance) values ('Ford');
insert into sanction (provenance) values ('Volkswagen');
insert into sanction (provenance) values ('Mercedes-Benz');
insert into sanction (provenance) values ('GMC');
insert into sanction (provenance) values ('Dodge');
insert into sanction (provenance) values ('Porsche');




insert into recompense (provenance) values ('Thoughtbridge');
insert into recompense (provenance) values ('Skimia');
insert into recompense (provenance) values ('Flashdog');
insert into recompense (provenance) values ('Edgewire');
insert into recompense (provenance) values ('Meembee');
insert into recompense (provenance) values ('Tazz');
insert into recompense (provenance) values ('Skilith');
insert into recompense (provenance) values ('Agivu');
insert into recompense (provenance) values ('Jaxspan');
insert into recompense (provenance) values ('Katz');
insert into recompense (provenance) values ('Thoughtstorm');
insert into recompense (provenance) values ('Blogtag');
insert into recompense (provenance) values ('Katz');
insert into recompense (provenance) values ('Wordpedia');
insert into recompense (provenance) values ('Voomm');
insert into recompense (provenance) values ('Youfeed');
insert into recompense (provenance) values ('Wikizz');
insert into recompense (provenance) values ('Blogtags');
insert into recompense (provenance) values ('Linklinks');
insert into recompense (provenance) values ('Trilith');





insert into sponsor (montant_sponsoriser) values (281);
insert into sponsor (montant_sponsoriser) values (245);
insert into sponsor (montant_sponsoriser) values (423);
insert into sponsor (montant_sponsoriser) values (334);
insert into sponsor (montant_sponsoriser) values (235);
insert into sponsor (montant_sponsoriser) values (489);
insert into sponsor (montant_sponsoriser) values (227);
insert into sponsor (montant_sponsoriser) values (397);
insert into sponsor (montant_sponsoriser) values (407);
insert into sponsor (montant_sponsoriser) values (307);
insert into sponsor (montant_sponsoriser) values (331);
insert into sponsor (montant_sponsoriser) values (379);
insert into sponsor (montant_sponsoriser) values (467);
insert into sponsor (montant_sponsoriser) values (425);
insert into sponsor (montant_sponsoriser) values (363);
insert into sponsor (montant_sponsoriser) values (274);
insert into sponsor (montant_sponsoriser) values (209);
insert into sponsor (montant_sponsoriser) values (357);
insert into sponsor (montant_sponsoriser) values (363);
insert into sponsor (montant_sponsoriser) values (345);








insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('président', '2020/10/17', '2022/01/16');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('superviseur', '2020/09/11', '2022/01/07');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('designer', '2021/02/22', '2022/02/17');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('vice secretaire', '2020/09/17', '2022/01/16');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('vacataire', '2020/03/25', '2022/02/27');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('comptable', '2020/11/12', '2022/03/08');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('gardien', '2020/06/16', '2022/03/21');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('secretaire', '2021/04/22', '2022/02/07');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('vice president', '2021/05/24', '2022/02/07');
insert into responsabilite (nom_responsabilite, date_debut, date_fin) values ('tresorier', '2020/12/02', '2022/01/25');




insert into type_evenement (nom_type) values ('Action|Comedy|Crime|Romance');
insert into type_evenement (nom_type) values ('Children|Drama|Fantasy');
insert into type_evenement (nom_type) values ('Drama');
insert into type_evenement (nom_type) values ('Comedy|Crime');
insert into type_evenement (nom_type) values ('Drama');
insert into type_evenement (nom_type) values ('Comedy|Romance');
insert into type_evenement (nom_type) values ('Action|Comedy|Romance');
insert into type_evenement (nom_type) values ('Action|Comedy');
insert into type_evenement (nom_type) values ('Documentary|Musical');
insert into type_evenement (nom_type) values ('Thriller');




insert into comite_organisation (date_creation, date_dissolution) values ('2022/04/11', '2023/01/05');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/03/28', '2021/07/31');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/04/06', '2021/09/24');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/02/22', '2023/03/15');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/02/13', '2022/06/23');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/03/12', '2021/10/17');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/04/06', '2022/07/18');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/01/26', '2022/09/07');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/01/24', '2021/09/20');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/04/07', '2022/09/28');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/03/28', '2021/07/05');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/01/23', '2022/06/07');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/04/05', '2021/04/24');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/01/26', '2022/12/19');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/01/13', '2022/09/22');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/02/09', '2021/10/24');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/02/17', '2022/12/24');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/02/18', '2022/11/16');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/01/20', '2022/10/08');
insert into comite_organisation (date_creation, date_dissolution) values ('2022/02/24', '2023/03/01');




insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Dog''s Breakfast, A', '2022/03/17', '8:19', '20:46', '2021/06/16', 4202, 10, 17);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Smashed', '2022/03/15', '11:08', '18:18', '2021/07/23', 3059, 6, 5);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Front Line, The (Go-ji-jeon)', '2022/01/28', '5:33', '18:40', '2021/06/18', 2390, 3, 17);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Brass Teapot, The', '2022/01/06', '4:29', '22:51', '2021/08/04', 3587, 1, 17);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Primal Fear', '2022/01/02', '1:49', '14:48', '2021/11/23', 3500, 3, 14);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Love! Valour! Compassion!', '2022/03/08', '10:15', '17:01', '2021/07/09', 4489, 5, 9);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Iron Sky', '2022/02/24', '0:06', '21:48', '2021/08/27', 3752, 7, 17);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('King Solomon''s Mines', '2022/02/25', '6:59', '14:45', '2021/06/20', 3526, 4, 8);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Survival Quest', '2022/02/02', '7:50', '20:07', '2021/10/20', 4711, 6, 9);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Green Man, The', '2022/02/26', '11:29', '13:51', '2021/10/03', 3215, 2, 2);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('I''ll Do Anything', '2022/02/15', '1:13', '20:10', '2021/10/28', 4609, 5, 13);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Comedy of Terrors, The', '2022/02/14', '3:12', '20:46', '2021/09/20', 4413, 10, 13);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Crouching Tiger, Hidden Dragon (Wo hu cang long)', '2022/04/13', '7:55', '23:10', '2021/05/06', 4197, 3, 6);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Hobbit, The', '2022/02/16', '3:47', '21:10', '2021/11/20', 3649, 9, 4);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Batman Unmasked: The Psychology of the Dark Knight', '2022/01/01', '9:50', '13:21', '2021/11/06', 4449, 9, 3);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Ethel', '2022/01/11', '10:51', '12:55', '2021/08/30', 2103, 2, 7);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Three Outlaw Samurai (Sanbiki no samurai)', '2022/02/19', '11:39', '17:52', '2021/10/25', 4930, 1, 10);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Erendira', '2022/02/18', '5:38', '20:12', '2021/08/11', 3792, 4, 14);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Hunters, The', '2022/01/13', '9:19', '12:59', '2021/10/10', 2130, 10, 1);
insert into evenement (nom_evenement, date_fin, horaire_debut, horaire_fin, date_debut, budget, id_type, id_comite) values ('Lightspeed', '2022/03/29', '6:46', '22:07', '2021/11/04', 3668, 5, 10);




insert into sponsoriser (id_evenement, id_sponsor) values (6, 7);
insert into sponsoriser (id_evenement, id_sponsor) values (17, 19);
insert into sponsoriser (id_evenement, id_sponsor) values (17, 12);
insert into sponsoriser (id_evenement, id_sponsor) values (11, 13);
insert into sponsoriser (id_evenement, id_sponsor) values (12, 4);
insert into sponsoriser (id_evenement, id_sponsor) values (10, 6);
insert into sponsoriser (id_evenement, id_sponsor) values (12, 8);
insert into sponsoriser (id_evenement, id_sponsor) values (14, 19);
insert into sponsoriser (id_evenement, id_sponsor) values (6, 9);
insert into sponsoriser (id_evenement, id_sponsor) values (6, 17);
insert into sponsoriser (id_evenement, id_sponsor) values (1, 8);
insert into sponsoriser (id_evenement, id_sponsor) values (18, 12);
insert into sponsoriser (id_evenement, id_sponsor) values (20, 18);
insert into sponsoriser (id_evenement, id_sponsor) values (11, 18);
insert into sponsoriser (id_evenement, id_sponsor) values (4, 12);
insert into sponsoriser (id_evenement, id_sponsor) values (16, 19);
insert into sponsoriser (id_evenement, id_sponsor) values (3, 18);
insert into sponsoriser (id_evenement, id_sponsor) values (16, 12);
insert into sponsoriser (id_evenement, id_sponsor) values (12, 7);
insert into sponsoriser (id_evenement, id_sponsor) values (2, 11);


insert into type_club (nom_type) values ('Tongan');
insert into type_club (nom_type) values ('Japanese');
insert into type_club (nom_type) values ('Crow');
insert into type_club (nom_type) values ('Argentinian');
insert into type_club (nom_type) values ('Iroquois');
insert into type_club (nom_type) values ('Potawatomi');
insert into type_club (nom_type) values ('Spaniard');
insert into type_club (nom_type) values ('Chamorro');
insert into type_club (nom_type) values ('Argentinian');
insert into type_club (nom_type) values ('Osage');



insert into Club (nom_club, date_de_creation, type, description, id_type) values ('empowering', '2021/09/23', 'CONE', 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel', 1);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('heuristic', '2021/04/17', 'MATR', 'ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem', 8);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('installation', '2022/01/23', 'MGCD', 'sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue', 3);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('support', '2021/10/29', 'JPM^H', 'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc', 4);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('client-driven', '2021/05/20', 'CACG', 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 8);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Multi-tiered', '2021/08/20', 'KONE', 'orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi', 3);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Robust', '2021/06/20', 'PBR.A', 'nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', 2);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Decentralized', '2021/07/12', 'PWE', 'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus', 6);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Progressive', '2022/02/01', 'SFLY', 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas', 1);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Reactive', '2021/10/30', 'ESPR', 'non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', 8);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Larkin Group', '2022/03/22', 'MELR', 'volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc', 3);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Dooley and Sons', '2022/02/03', 'INSE', 'vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula', 1);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Kuhic-Hagenes', '2022/01/15', 'SRTS', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices', 9);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Herzog Inc', '2021/11/28', 'HSIC', 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', 4);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Tremblay Group', '2022/03/17', 'GLBS', 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis', 3);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Altenwerth, Brekke and Olson', '2021/06/04', 'STRS', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien', 2);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Padberg, Sipes and Pagac', '2021/04/20', 'JNP', 'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 2);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Schaden, Bauch and Goodwin', '2021/08/07', 'ARNC', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', 8);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Walker, Weber and Bechtelar', '2022/03/15', 'AAPC', 'rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas', 6);
insert into Club (nom_club, date_de_creation, type, description, id_type) values ('Spinka-Bernhard', '2021/06/16', 'AEM', 'curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum', 5);




insert into organiser (id_club, id_evenement) values (1, 19);
insert into organiser (id_club, id_evenement) values (2, 11);
insert into organiser (id_club, id_evenement) values (3, 15);
insert into organiser (id_club, id_evenement) values (4, 17);
insert into organiser (id_club, id_evenement) values (5, 7);
insert into organiser (id_club, id_evenement) values (6, 11);
insert into organiser (id_club, id_evenement) values (7, 19);
insert into organiser (id_club, id_evenement) values (8, 14);
insert into organiser (id_club, id_evenement) values (9, 7);
insert into organiser (id_club, id_evenement) values (10, 2);
insert into organiser (id_club, id_evenement) values (11, 16);
insert into organiser (id_club, id_evenement) values (12, 8);
insert into organiser (id_club, id_evenement) values (13, 11);
insert into organiser (id_club, id_evenement) values (14, 12);
insert into organiser (id_club, id_evenement) values (15, 1);
insert into organiser (id_club, id_evenement) values (16, 19);
insert into organiser (id_club, id_evenement) values (17, 5);
insert into organiser (id_club, id_evenement) values (18, 4);
insert into organiser (id_club, id_evenement) values (19, 3);
insert into organiser (id_club, id_evenement) values (20, 15);



insert into decerner (id_club, id_recompense) values (1, 14);
insert into decerner (id_club, id_recompense) values (2, 1);
insert into decerner (id_club, id_recompense) values (3, 6);
insert into decerner (id_club, id_recompense) values (4, 12);
insert into decerner (id_club, id_recompense) values (5, 7);
insert into decerner (id_club, id_recompense) values (6, 13);
insert into decerner (id_club, id_recompense) values (7, 17);
insert into decerner (id_club, id_recompense) values (8, 7);
insert into decerner (id_club, id_recompense) values (9, 17);
insert into decerner (id_club, id_recompense) values (10, 8);
insert into decerner (id_club, id_recompense) values (11, 11);
insert into decerner (id_club, id_recompense) values (12, 13);
insert into decerner (id_club, id_recompense) values (13, 5);
insert into decerner (id_club, id_recompense) values (14, 6);
insert into decerner (id_club, id_recompense) values (15, 9);
insert into decerner (id_club, id_recompense) values (16, 15);
insert into decerner (id_club, id_recompense) values (17, 19);
insert into decerner (id_club, id_recompense) values (18, 2);
insert into decerner (id_club, id_recompense) values (19, 7);
insert into decerner (id_club, id_recompense) values (20, 4);




insert into recevoir (id_club, id_sanction) values (1, 1);
insert into recevoir (id_club, id_sanction) values (2, 18);
insert into recevoir (id_club, id_sanction) values (3, 14);
insert into recevoir (id_club, id_sanction) values (4, 16);
insert into recevoir (id_club, id_sanction) values (5, 13);
insert into recevoir (id_club, id_sanction) values (6, 10);
insert into recevoir (id_club, id_sanction) values (7, 6);
insert into recevoir (id_club, id_sanction) values (8, 4);
insert into recevoir (id_club, id_sanction) values (9, 10);
insert into recevoir (id_club, id_sanction) values (10, 10);
insert into recevoir (id_club, id_sanction) values (11, 11);
insert into recevoir (id_club, id_sanction) values (12, 12);
insert into recevoir (id_club, id_sanction) values (13, 13);
insert into recevoir (id_club, id_sanction) values (14, 19);
insert into recevoir (id_club, id_sanction) values (15, 10);
insert into recevoir (id_club, id_sanction) values (16, 17);
insert into recevoir (id_club, id_sanction) values (17, 11);
insert into recevoir (id_club, id_sanction) values (18, 12);
insert into recevoir (id_club, id_sanction) values (19, 17);
insert into recevoir (id_club, id_sanction) values (20, 12);



insert into rapport_activite (id_rapport, etat_actuel, id_club) values (1, 'en cours de creation', 1);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (2, 'en attente', 2);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (3, 'signé', 3);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (4, 'signé', 4);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (5, 'soumis', 5);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (6, 'soumis', 6);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (7, 'soumis', 7);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (8, 'en cours de creation', 8);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (9, 'en cours de creation', 9);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (10, 'en cours de creation', 10);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (11, 'en attente', 11);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (12, 'en attente', 12);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (13, 'absent', 13);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (14, 'soumis', 14);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (15, 'signé', 15);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (16, 'signé', 16);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (17, 'absent', 17);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (18, 'en cours de creation', 18);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (19, 'soumis', 19);
insert into rapport_activite (id_rapport, etat_actuel, id_club) values (20, 'en cours de creation', 20);


insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (1, 'en cours de creation', '2021/07/01');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (2, 'soumis', '2020/12/28');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (3, 'soumis', '2021/09/23');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (4, 'absent', '2022/02/27');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (5, 'signé', '2021/07/30');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (6, 'absent', '2022/02/02');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (7, 'soumis', '2022/02/01');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (8, 'en attente', '2021/07/07');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (9, 'soumis', '2021/08/08');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (10, 'soumis', '2021/07/18');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (11, 'signé', '2022/02/20');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (12, 'en cours de creation', '2021/06/15');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (13, 'absent', '2022/02/26');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (14, 'en cours de creation', '2021/11/09');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (15, 'en cours de creation', '2021/07/17');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (16, 'en attente', '2021/02/28');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (17, 'en cours de creation', '2022/03/07');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (18, 'soumis', '2020/11/10');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (19, 'absent', '2020/12/24');
insert into etat_rapport (id_etat, nom_etat, date_modification_rapport) values (20, 'signé', '2020/12/31');



insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (1, 'Alu', 1, 'in', 'id', '2021/08/01', 7);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (2, 'Shovell', 1, 'tincidunt', 'luctus', '2021/12/25', 6);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (3, 'Busson', 1, 'quis', 'ac', '2021/06/14', 2);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (4, 'Lamey', 1, 'viverra', 'ultrices', '2022/02/22', 8);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (5, 'Humerstone', 1, 'donec', 'eu', '2022/02/13', 1);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (6, 'Edeson', 1, 'sit', 'porta', '2021/04/07', 9);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (7, 'Tunuy', 1, 'sed', 'hac', '2021/07/07', 1);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (8, 'Brayson', 1, 'hac', 'cras', '2022/03/01', 8);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (9, 'Lovering', 1, 'semper', 'libero', '2021/04/30', 8);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (10, 'Tulip', 1, 'rutrum', 'cras', '2021/05/11', 1);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (11, 'Lidgate', 1, 'est', 'morbi', '2021/06/24', 6);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (12, 'Phelip', 1, 'amet', 'interdum', '2021/02/24', 7);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (13, 'Willmett', 1, 'sem', 'venenatis', '2021/07/12', 8);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (14, 'Maving', 1, 'lorem', 'nisi', '2021/01/26', 7);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (15, 'Drissell', 1, 'eget', 'eget', '2022/01/14', 7);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (16, 'Prinnett', 1, 'in', 'risus', '2021/07/27', 8);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (17, 'Hudd', 1, 'quis', 'habitasse', '2021/05/25', 7);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (18, 'Burberye', 1, 'proin', 'vitae', '2022/03/18', 10);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (19, 'Larsen', 1, 'nibh', 'ac', '2021/11/18', 1);
insert into membre (numero_etudiant, nom_etudiant, genre, classe, niveau, date_de_naissance, id_responsabilite) values (20, 'Stiff', 1, 'mi', 'justo', '2021/12/17', 9);



insert into renfermer (id_club_appartient, numero_etudiant) values (9, 1);
insert into renfermer (id_club_appartient, numero_etudiant) values (4, 2);
insert into renfermer (id_club_appartient, numero_etudiant) values (10, 3);
insert into renfermer (id_club_appartient, numero_etudiant) values (18, 4);
insert into renfermer (id_club_appartient, numero_etudiant) values (8, 5);
insert into renfermer (id_club_appartient, numero_etudiant) values (9, 6);
insert into renfermer (id_club_appartient, numero_etudiant) values (7, 7);
insert into renfermer (id_club_appartient, numero_etudiant) values (1, 8);
insert into renfermer (id_club_appartient, numero_etudiant) values (15, 9);
insert into renfermer (id_club_appartient, numero_etudiant) values (12, 10);
insert into renfermer (id_club_appartient, numero_etudiant) values (20, 11);
insert into renfermer (id_club_appartient, numero_etudiant) values (3, 12);
insert into renfermer (id_club_appartient, numero_etudiant) values (10, 13);
insert into renfermer (id_club_appartient, numero_etudiant) values (19, 14);
insert into renfermer (id_club_appartient, numero_etudiant) values (3, 15);
insert into renfermer (id_club_appartient, numero_etudiant) values (13, 16);
insert into renfermer (id_club_appartient, numero_etudiant) values (7, 17);
insert into renfermer (id_club_appartient, numero_etudiant) values (1, 18);
insert into renfermer (id_club_appartient, numero_etudiant) values (20, 19);
insert into renfermer (id_club_appartient, numero_etudiant) values (1, 20);


insert into dependre (id_rapport, id_etat) values (1, 1);
insert into dependre (id_rapport, id_etat) values (2, 2);
insert into dependre (id_rapport, id_etat) values (3, 3);
insert into dependre (id_rapport, id_etat) values (4, 4);
insert into dependre (id_rapport, id_etat) values (5, 5);
insert into dependre (id_rapport, id_etat) values (6, 6);
insert into dependre (id_rapport, id_etat) values (7, 7);
insert into dependre (id_rapport, id_etat) values (8, 8);
insert into dependre (id_rapport, id_etat) values (9, 9);
insert into dependre (id_rapport, id_etat) values (10, 10);
insert into dependre (id_rapport, id_etat) values (11, 11);
insert into dependre (id_rapport, id_etat) values (12, 12);
insert into dependre (id_rapport, id_etat) values (13, 13);
insert into dependre (id_rapport, id_etat) values (14, 14);
insert into dependre (id_rapport, id_etat) values (15, 15);
insert into dependre (id_rapport, id_etat) values (16, 16);
insert into dependre (id_rapport, id_etat) values (17, 17);
insert into dependre (id_rapport, id_etat) values (18, 18);
insert into dependre (id_rapport, id_etat) values (19, 19);
insert into dependre (id_rapport, id_etat) values (20, 20);


insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Business Development', 16, 1296, 1);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Marketing', 7, 4728, 2);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Product Management', 20, 1917, 3);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Legal', 7, 2015, 4);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Human Resources', 16, 1926, 5);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Research and Development', 14, 1722, 6);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Business Development', 4, 3078, 7);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Services', 5, 3427, 8);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Marketing', 6, 4661, 9);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Accounting', 17, 3030, 10);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Sales', 19, 2334, 11);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Legal', 18, 3174, 12);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Product Management', 2, 4884, 13);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Training', 7, 4846, 14);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Engineering', 12, 4237, 15);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Services', 9, 1256, 16);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Support', 9, 2019, 17);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Services', 10, 4121, 18);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Legal', 14, 1587, 19);
insert into tache (nom_tache, id_responsable_tache, montant_depense, id_evenement) values ('Training', 17, 3522, 20);



insert into signature (id_signature, id_rapport, numero_etudiant) values (1, 1, 3);
insert into signature (id_signature, id_rapport, numero_etudiant) values (2, 2, 1);
insert into signature (id_signature, id_rapport, numero_etudiant) values (3, 3, 10);
insert into signature (id_signature, id_rapport, numero_etudiant) values (4, 4, 7);
insert into signature (id_signature, id_rapport, numero_etudiant) values (5, 5, 6);
insert into signature (id_signature, id_rapport, numero_etudiant) values (6, 6, 11);

insert into signature (id_signature, id_rapport, numero_etudiant) values (7, 7, 12);
insert into signature (id_signature, id_rapport, numero_etudiant) values (8, 8, 2);
insert into signature (id_signature, id_rapport, numero_etudiant) values (9, 9, 13);
insert into signature (id_signature, id_rapport, numero_etudiant) values (10, 10, 14);
insert into signature (id_signature, id_rapport, numero_etudiant) values (11, 11, 8);
insert into signature (id_signature, id_rapport, numero_etudiant) values (12, 12, 15);
insert into signature (id_signature, id_rapport, numero_etudiant) values (13, 13, 17);
insert into signature (id_signature, id_rapport, numero_etudiant) values (14, 14, 4);
insert into signature (id_signature, id_rapport, numero_etudiant) values (15, 15, 4);
insert into signature (id_signature, id_rapport, numero_etudiant) values (16, 16, 5);
insert into signature (id_signature, id_rapport, numero_etudiant) values (17, 17, 9);
insert into signature (id_signature, id_rapport, numero_etudiant) values (19, 19, 20);
insert into signature (id_signature, id_rapport, numero_etudiant) values (20, 20, 19);
