WITH Gestion_Date;
Use Gestion_Date;

PACKAGE Gestion_Materiel IS
   TYPE T_Categorie IS (CAMERAS, SONO, PRISE_DE_SON, PROJECTION, LUMIERES);
   TYPE T_Materiel IS RECORD
      Num_pack : integer;    --numero unique de pack
      Cat : T_Categorie;
      Date_service : T_Date;
      Nbjrs_utilises : Integer :=0;
      Dispo : boolean;    --oui si disponible et non si non
      Suppr : Boolean;   --oui si suppression demandee et non si non
    END RECORD;
   TYPE T_CellMat;
   TYPE T_PtMat IS ACCESS T_CellMat;
   TYPE T_CellMat is record
      Mat : T_Materiel;
      Suiv_Mat : T_PtMat;
   END RECORD;


   PROCEDURE Ajout_Materiel (Tete_Mat : IN OUT T_Ptmat; Mat : IN T_Materiel);
   PROCEDURE Visu_Mat (Mat : IN T_Materiel);
   PROCEDURE Visu_All_Pack (Tete_Mat :  IN T_Ptmat);
   PROCEDURE Supprimer_pack (Tete_Mat : IN OUT T_Ptmat; Numpack : in integer; Catpack : in T_Categorie; OK : out boolean);
   PROCEDURE Supprimer_pack_date_donnee(Tete_mat : in out T_Ptmat; D : in T_Date; Numpack : in integer; Catpack : in T_Categorie; OK : out boolean);
   PROCEDURE Visu_pack_dispo (Tete_mat : in T_Ptmat);

END Gestion_Materiel;
