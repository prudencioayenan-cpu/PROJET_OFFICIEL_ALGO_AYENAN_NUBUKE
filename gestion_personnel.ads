WITH Gestion_Identite;
USE Gestion_Identite;

PACKAGE Gestion_Personnel IS
   TYPE T_CatEmploye IS (Aucun, Technicien, Ingenieur);
   TYPE T_Personnel IS RECORD
      Identite : T_Identite;
      Categorie : T_CatEmploye;
      Nb_presta : integer :=0;      --nombre de prestations achevees depuis son recrutement
      Dispo : boolean;            --oui si disponible et non si en prestation
      Depart : boolean;            --oui si demande de depart et non si non
   END RECORD;

   TYPE T_Cellpersonnel;
   TYPE T_Ptpersonnel IS ACCESS T_Cellpersonnel;
   TYPE T_Cellpersonnel is record
      Personnel : T_Personnel;
      Suiv_Personnel : T_Ptpersonnel;
   END RECORD;

   PROCEDURE Ajout_employe (Tete_employe : IN OUT T_Ptpersonnel; Employe : IN T_Personnel);
   PROCEDURE Enregistrer_depart (Tete_employe : IN T_Ptpersonnel; IDEmploye : in T_Identite; CatEmploye : in T_CatEmploye);
   PROCEDURE Visu_Employe (Employe : IN T_Personnel);
   PROCEDURE Visu_All_Personnel (Tete_Personnel : IN T_Ptpersonnel);
   PROCEDURE Visu_infos_employe_donne (Tete_Employe : IN T_Ptpersonnel; IDEmploye : IN T_Identite; CatEmploye : IN T_CatEmploye);

END Gestion_Personnel;
