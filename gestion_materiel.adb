WITH Ada.Text_IO, Ada.Integer_Text_Io, Gestion_Date;
USE Ada.Text_IO, Ada.Integer_Text_Io, Gestion_Date;

PACKAGE BODY Gestion_Materiel IS

---Ajout d'un nouveau pack de materiel
PROCEDURE Ajout_Materiel (Tete_Mat : IN OUT T_Ptmat; Mat : IN T_Materiel) IS
BEGIN
   Tete_Mat := NEW T_CellMat'(Mat, Tete_Mat);
END Ajout_Materiel;

---Pour visualiser un materiel
PROCEDURE Visu_Mat (Mat : IN T_Materiel) is
BEGIN
   Put("Pack numero"); Put(" : "); Put(Mat.Num_Pack); New_line;
   Put("Categorie"); Put(" : "); Put(T_Categorie'image(Mat.Cat)); New_line;
   Put("Date de mise en service"); Put(" : "); Afficher_Date(Mat.Date_service); New_line;
   Put("Nbre jours utilisation"); Put(" : "); Put(Mat.Nbjrs_utilises); New_line;
   IF Mat.Dispo = true THEN
      Put("Actuellement disponible"); New_line;
   ELSE Put("Actuellement en location"); New_line;
   END IF;
   IF Mat.Suppr = True THEN
      Put("Suppression demandee"); New_line;
   ELSE Put("Suppression non demandee"); New_line;
   END IF;
END Visu_Mat;

---Pour visualiser tous les packs de materiels
PROCEDURE Visu_All_Pack (Tete_Mat : IN T_Ptmat) IS
   tmp : T_Ptmat := Tete_Mat;
BEGIN
   WHILE Tmp/=NULL LOOP
      Visu_Mat(Tmp.Mat); New_line;
      Tmp :=Tmp.Suiv_Mat;
   END LOOP;
END Visu_All_Pack;

---Pour supprimer un pack de materiel
PROCEDURE Supprimer_Pack (Tete_Mat : IN OUT T_Ptmat; Numpack : IN Integer; Catpack : IN T_Categorie) IS
BEGIN
   IF Tete_Mat /= null then
      if Tete_Mat.Mat.Num_pack = Numpack and then Tete_Mat.Mat.Cat = Catpack AND then Tete_Mat.Mat.Dispo = true then
            Tete_Mat.Mat.Suppr := true;
            Tete_Mat := Tete_Mat.Suiv_Mat;
            Put_Line("SUPPRESSION REUSSIE");
         else
            Tete_Mat.Mat.Suppr := False;
           Supprimer_pack (Tete_Mat.Suiv_Mat, Numpack, Catpack); 
      end if;

   END IF;
END Supprimer_Pack;

---Pour supprimer un pack de materiel a une date donnee
PROCEDURE Supprimer_pack_date_donnee(Tete_mat : IN OUT T_Ptmat; D : IN T_Date; Numpack : IN Integer; Catpack : IN T_Categorie) IS
   tmp:T_Ptmat := Tete_Mat;
BEGIN
   WHILE tmp /=null loop
         if Date_valide(D) and then tmp.Mat.Date_service.Jour <= D.Jour and then tmp.Mat.Date_service.Mois <= D.Mois and then tmp.Mat.Date_service.Annee <= D.Annee then
            Supprimer_Pack(Tete_Mat, Numpack, Catpack);
         end if;
      tmp := tmp.Suiv_Mat;
   end loop;
End Supprimer_pack_date_donnee;

---Pour visualiser les packs de materiel disponibles
PROCEDURE Visu_pack_dispo (Tete_mat : IN T_Ptmat) IS
   tmp : T_Ptmat := Tete_Mat;
BEGIN
   WHILE Tmp/=NULL LOOP
      IF tmp.Mat.Dispo = true THEN
         Visu_Mat(Tmp.Mat); New_line;
      END IF;
      Tmp :=Tmp.Suiv_Mat;
   END LOOP;
END Visu_pack_dispo;

---Pour charger les packs de materiel
PROCEDURE Charger_Materiel (Tete_Mat : IN OUT T_PtMat) IS
   M : T_Materiel;
BEGIN
   M.Num_pack := 8;
   M.Cat := CAMERAS;
   M.Date_service := (Jour => 18, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := false;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);
   
   M.Num_pack := 4;
   M.Cat := CAMERAS;
   M.Date_service := (Jour => 17, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := true;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);
   
   M.Num_pack := 1;
   M.Cat := CAMERAS;
   M.Date_service := (Jour => 15, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := true;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);
   
   M.Num_pack := 7;
   M.Cat := SONO;
   M.Date_service := (Jour => 18, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := false;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);
   
   M.Num_pack := 6;
   M.Cat := SONO;
   M.Date_service := (Jour => 17, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := true;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);

   M.Num_pack := 5;
   M.Cat := PROJECTION;
   M.Date_service := (Jour => 17, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := true;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);

   M.Num_pack := 3;
   M.Cat := PROJECTION;
   M.Date_service := (Jour => 16, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := true;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);

   M.Num_pack := 9;
   M.Cat := LUMIERES;
   M.Date_service := (Jour => 19, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := false;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);

   M.Num_pack := 2;
   M.Cat := LUMIERES;
   M.Date_service := (Jour => 15, Mois => 04, Annee => 2026);
   M.Nbjrs_utilises := 0;
   M.Dispo := false;
   M.Suppr := false;
   Ajout_Materiel(Tete_Mat, M);

   Put_Line ("Les donnees de materielS ont ete chargees avec succes !");
END Charger_Materiel;


















END Gestion_Materiel;
