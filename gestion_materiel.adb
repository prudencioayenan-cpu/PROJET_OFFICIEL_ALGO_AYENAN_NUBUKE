WITH Ada.Text_IO, Ada.Integer_Text_Io, Gestion_Date;
USE Ada.Text_IO, Ada.Integer_Text_Io, Gestion_Date;

PACKAGE BODY Gestion_Materiel IS

PROCEDURE Ajout_Materiel (Tete_Mat : IN OUT T_Ptmat; Mat : IN T_Materiel) IS
BEGIN
   Tete_Mat := NEW T_CellMat'(Mat, Tete_Mat);
END Ajout_Materiel;

PROCEDURE Visu_Mat (Mat : IN T_Materiel) is
BEGIN
   Put("Pack numero"); Put(" : "); Put(Mat.Num_Pack); New_line;
   Put("Categorie"); Put(" : "); Put(T_Categorie'image(Mat.Cat)); New_line;
   Put("Date de mise en service"); Put(" : "); Afficher_Date(Mat.Date_service); New_line;
   Put("Ce pack a ete utilise pendant"); Put(" : "); Put(Mat.Nbjrs_utilises ); New_line;
   IF Mat.Dispo = true THEN
      Put("Actuellement disponible"); New_line;
   ELSE Put("Actuellement en location"); New_line;
   END IF;
   IF Mat.Suppr = True THEN
      Put("Suppression demandee"); New_line;
   END IF;
END Visu_Mat;

























END Gestion_Materiel;
