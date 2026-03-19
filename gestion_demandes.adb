WITH  Ada.Text_IO, Ada.Integer_Text_IO, Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel;
USE  Ada.Text_IO, Ada.Integer_Text_IO, Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel;

PACKAGE BODY Gestion_Demandes IS



PROCEDURE Visu_Dem (Dem : IN T_Demande)IS
BEGIN
   Put("Numero"); Put(" : "); Put(Dem.Num_Dem); New_Line;
   --Put("Client"); Put(" : "); Afficher_ID(Dem.Client); New_Line;
   Put("Duree"); Put(" : "); Put(Dem.Duree); Put("jours"); New_Line;
   Put("Date"); Put(" : "); Afficher_Date(Dem.Date_dem); New_line;
   Put("Accompagnement"); Put(" : "); Put(T_CatEmploye'image(Dem.Accompagnement)); New_Line;
   Put("Nature"); Put(" : "); Put(T_Categorie'Image(Dem.Nature_mat)); New_Line;
END Visu_Dem;
















END Gestion_Demandes;
