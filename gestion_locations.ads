WITH Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel, Gestion_Demandes, Gestion_Clients;
USE Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel, Gestion_Demandes, Gestion_Clients;

PACKAGE Gestion_Locations IS
   TYPE T_Location IS RECORD
      Num_loca : integer;      --numero de location
      Client : T_Identite;
      Duree : Integer;            --difference entre date debut et date fin
      Date_deb, Date_fin : T_Date;
      Attente : integer;         -- duree d'attente en jours avant la location
      Accompagnement : T_CatEmploye;
      Prestataire : T_Identite;
      Num_pack : integer;
      Cat_Mat : T_Categorie;
    END RECORD;
   TYPE T_Cellloca;
   TYPE T_Ptloca IS ACCESS T_Cellloca;
   TYPE T_Cellloca IS RECORD
      Location : T_Location;
      Suiv_Location : T_Ptloca;
   END RECORD;


----TYPES DONT ON A BESOIN POUR L'ARCHIVAGE



   PROCEDURE Visu_loca (L : IN T_Location);
   PROCEDURE Visu_loca_cours (Tete_Loca : IN T_Ptloca);
   PROCEDURE Visu_loca_passees (Tete_loca : IN T_Ptloca);
   PROCEDURE Visu_Loca_Employe (Tete_Loca : IN T_Ptloca; Employe : IN T_Identite);
   PROCEDURE Visu_loca_client (Tete_loca : IN T_Ptloca; Client : IN T_Identite);

END Gestion_Locations;
