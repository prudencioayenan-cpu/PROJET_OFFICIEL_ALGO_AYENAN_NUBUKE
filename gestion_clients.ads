WITH Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel, Gestion_Demandes, Gestion_Locations;
USE Gestion_Date, Gestion_Identite, Gestion_Materiel, Gestion_Personnel, Gestion_Demandes, Gestion_Locations;

PACKAGE Gestion_Clients IS
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


END Gestion_Clients;
 