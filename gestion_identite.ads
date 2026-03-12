WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PACKAGE Gestion_Identite IS
   SUBTYPE T_Mot IS String (0..20);
   Type T_Identite is record
      Nom , Prenom : T_Mot :=(others =>' ');
      KNom, Kprenom : integer:=0;
   END RECORD;

   FUNCTION ID_Valide (ID : T_Identite) return boolean;
   PROCEDURE Saisie_ID (ID : OUT T_Identite);
   PROCEDURE Afficher_ID(ID : IN T_Identite);
END Gestion_Identite;
