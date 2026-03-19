WITH Gestion_Date, Gestion_Identite;
USE Gestion_Date, Gestion_Identite;

PACKAGE BODY Gestion_Clients IS
   TYPE T_Client IS RECORD
      Client : T_Identite;
      nb_locations : integer :=0;
      Facture, Montant_regle : Integer :=0;
   END RECORD;
   TYPE T_Noeudclient;
   TYPE T_Arbreclient IS ACCESS T_Noeudclient;
   TYPE T_Noeudclient IS RECORD
      Cle : T_Client;
      fg, fd : T_Arbreclient;
   END RECORD;

   -- PROCEDURE Visu_Prefixe (A : IN T_Arbreclient) is






END Visu_prefixe;
   PROCEDURE Save_Reglement(A : IN OUT T_Arbreclient; Id_Client : IN T_Client; ok : out boolean) IS   BEGIN      IF A=NULL THEN Ok :=False;
      ELSIF
            A.Cle.Client=Id_Client THEN
         Ok :=True;
         A.fd

end save_reglement;
END Gestion_Clients;
