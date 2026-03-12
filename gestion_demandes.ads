WITH Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel;
USE Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel;

PACKAGE Gestion_Demandes IS
   TYPE T_Demande IS RECORD
      Num_dem : Integer;
      Client : T_Identite;
      Duree : integer range 1..10;  --nbre de jours voulus pour la location
      Date_dem : T_Date;
      Accompagnement : T_CatEmploye;
      Nature_mat : T_Categorie;
   END RECORD;

   TYPE T_CelLdem;
   TYPE T_Ptdem IS ACCESS T_Celldem;
   TYPE T_Celldem IS RECORD
      Demande : T_Demande;
      Suiv_Dem : T_Ptdem;
   END RECORD;

   TYPE T_File_Dem IS RECORD
      Deb_dem, Fin_Dem: T_Ptdem;
   END RECORD;

   PROCEDURE Enregister_Dem (Tete_dem : IN OUT T_Ptdem; Demande : IN T_Demande);
   PROCEDURE Supprimer_dem (Tete_dem : IN OUT T_Ptdem; Numero_demande : IN T_Demande; Ok : Out Boolean);
   PROCEDURE Visu_Dem (Dem : IN T_Demande);
   PROCEDURE Visu_dem_attente (Tete_dem :IN T_Ptdem);
END Gestion_Demandes;
