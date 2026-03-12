WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO;

PACKAGE BODY Gestion_Date IS


FUNCTION Date_valide (D : T_Date) RETURN boolean IS
Begin
    ---On verifie que le jour est valide en fonction des mois de 30 et de 31 jours
    CASE D.mois is
        WHEN 1 | 3 | 5 | 7 | 8 | 10 | 12 =>
         IF D.Jour NOT IN 1..31 THEN
                    return false;
            END if;
        WHEN 4 | 6 | 9 | 11 =>
            IF D.jour NOT IN 1..30 THEN
                RETURN false;
         END IF;
        WHEN 2 =>

            IF (D.annee mod 4 = 0 AND D.annee mod 100 /= 0) OR D.annee mod 400 = 0 THEN
                IF D.jour NOT IN 1..29 THEN
                    RETURN FALSE;
                END IF;
            ELSE
                IF D.jour NOT IN 1..28 THEN
                    return false;
                END IF;
            END IF;
        WHEN OTHERS =>
            RETURN FALSE;
   END CASE;
     ---Si tous les tests sont passes, donc la date est valide
            RETURN TRUE ;
END Date_Valide;

----------------------------------------------------------------------------
PROCEDURE Saisie_Date (D : OUT T_Date) IS
BEGIN
   Put("Entrez la date =>"); New_line;
   LOOP
      Put("Jour :"); Get(D.Jour);
      Put("Mois :");Get(D.Mois);
             Put("Annee :");Get(D.Annee); Skip_line;
      EXIT WHEN Date_Valide (D);
   END LOOP;
END Saisie_Date;
---------------------------------------------------------------------------
PROCEDURE Afficher_Date(D : IN T_Date) IS
BEGIN
   Put(D.Jour); Put("/");
   Put(D.Mois); Put("/");
   Put(D.Annee);
END Afficher_Date;
----------------------------------------------------------------------------
PROCEDURE Jour_Suivant (D : IN OUT T_Date) IS
   BEGIN
      CASE D.Mois IS
         --- On passe au jour suivant, selon que le mois est de 31 jours
        WHEN 1 | 3 | 5 | 7 | 8 | 10 | 12 =>
            IF D.jour = 31 THEN
                D.jour := 1;
                IF D.mois /= 12 THEN
                    D.mois := D.mois + 1;
                ELSE
                    D.mois := 1;
                    D.annee := D.annee + 1;
                END IF;
            ELSE
                D.jour := D.jour + 1;
            END IF;
          --- On passe au jour suivant, selon que le mois est de 30 jours
        WHEN 4 | 6 | 9 | 11 =>
            IF D.jour = 30 THEN
                D.jour := 1;
                D.mois := D.mois + 1;
            ELSE
                D.jour := D.jour + 1;
            END IF;
        WHEN 2 =>
            --- Deuxieme mois, on passe au jour suivant, selon que l'annee est bissextile ou pas
            IF (D.annee mod 4 = 0 AND D.annee mod 100 /= 0) or D.annee mod 400 = 0 THEN
                IF D.jour = 29 THEN
                    D.jour := 1;
                    D.mois := D.mois + 1;
                ELSE
                    D.jour := D.jour + 1;
                END IF;
            ELSE
                IF D.jour = 28 THEN
                    D.jour := 1;
                    D.mois := D.mois + 1;
                ELSE
                    D.jour := D.jour + 1;
                END IF;
            END IF;
        WHEN OTHERS =>
            NULL;
    END CASE;
END Jour_Suivant;
END Gestion_Date;


