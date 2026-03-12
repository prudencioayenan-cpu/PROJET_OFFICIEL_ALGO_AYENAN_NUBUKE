WITH Ada.Text_IO, Ada.Integer_Text_IO, Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel, Gestion_Demandes;
USE Ada.Text_IO, Ada.Integer_Text_IO, Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel, Gestion_Demandes;

PACKAGE BODY Gestion_Locations IS
   PROCEDURE Visu_Loca (L : IN T_Location) IS
   BEGIN
      Put("Identifiant"); Put(" : "); Put(L.Num_Loca); New_Line;
      Put("Location par le client"); Affiche_ID(L.Client); New_Line;
      Put("pour une duree de"); Put(L.Duree); Put("jours"); New_Line;
      Put("entre le"); Afficher_Date(L.Date_deb); New_Line;
      Put("et le"); Afficher_Date(L.Date_fin); New_Line;
      Put("Accompagnement assure par"); Affiche_ID(L.Prestataire); Put(", ");
      Put(T_Catemploye'Image(L.Accompagnement)); New_Line;
      Put("Le pack loue est un pack de"); Put(T_Categorie'Image(L.Cat_Mat)); Put(", "); Put("il a le numero"); Put(L.Num_Pack); New_Line;
      Put("Le client a attendu"); Put(L.Attente); Put("jours"); Put("avant de recevoir le materiel");
   END Visu_Loca;








END Gestion_Locations;
