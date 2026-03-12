WITH Ada.Text_IO,Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PACKAGE Gestion_Date IS
   Subtype T_jour is integer range 1..31;
   Subtype T_mois is integer range 1..12;

   Type T_Date is record
      Jour : T_jour ;
      Mois : T_mois ;
      Annee : Natural;
   END RECORD ;

   PROCEDURE Saisie_Date (D : OUT T_Date);
   FUNCTION  Date_valide (D : T_Date) return boolean;
   PROCEDURE Afficher_Date (D : IN T_Date);
   PROCEDURE Jour_Suivant (D : IN OUT T_Date);

   End Gestion_Date;

