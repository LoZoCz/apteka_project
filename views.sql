CREATE VIEW widok1 AS SELECT nazwa_leku, cena_jednostkowa 
FROM Lekarstwa 
WHERE cena_jednostkowa BETWEEN 40 AND 60;

CREATE VIEW widok2 AS SELECT nazwa_leku, cena_jednostkowa 
FROM Lekarstwa 
ORDER BY nazwa_leku ASC;

CREATE VIEW widok3 AS SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_zamowienia, Zamowienia.status_zamowienia, Lekarstwa.nazwa_leku, Szczegoly_zamowienia.ilosc_produktow FROM Klienci INNER JOIN Zamowienia ON Klienci.id_klienta = Zamowienia.id_klienta INNER JOIN Szczegoly_zamowienia ON Zamowienia.id_zamowienia = Szczegoly_zamowienia.id_zamowienia INNER JOIN Lekarstwa ON Szczegoly_zamowienia.id_lekarstwa = Lekarstwa.id_lekarstwa;

CREATE VIEW widok4 AS SELECT imie, nazwisko, stanowisko, CASE 
    WHEN stanowisko = 'Kierownik' THEN 8000 
    WHEN stanowisko = 'Farmaceuta' THEN 5000 
    ELSE 3000 
END AS wynagrodzenie
FROM Pracownicy
ORDER BY wynagrodzenie DESC;

CREATE VIEW widok5 AS SELECT lekarstwa.nazwa_leku, SUM(szczegoly_zamowienia.ilosc_produktow) AS ilosc_sprzedana FROM lekarstwa INNER JOIN szczegoly_zamowienia ON lekarstwa.id_lekarstwa = szczegoly_zamowienia.id_lekarstwa INNER JOIN zamowienia ON szczegoly_zamowienia.id_zamowienia = zamowienia.id_zamowienia WHERE zamowienia.data_zamowienia BETWEEN '2023-01-01' AND '2023-05-31' GROUP BY Lekarstwa.nazwa_leku DESC;

CREATE VIEW widok6 AS SELECT nazwa_leku, dawka, opakowanie
FROM Lekarstwa
WHERE opakowanie <= 10;

CREATE VIEW widok7 AS SELECT COUNT(*) AS liczba_zamowien
FROM Zamowienia
INNER JOIN Klienci ON Zamowienia.id_klienta = Klienci.id_klienta
WHERE Klienci.imie = 'Anna';

CREATE VIEW widok8 AS SELECT Lekarstwa.nazwa_leku, SUM(Szczegoly_zamowienia.ilosc_produktow) as ilosc_sprzedanych FROM Lekarstwa JOIN Szczegoly_zamowienia ON Lekarstwa.id_lekarstwa = Szczegoly_zamowienia.id_lekarstwa JOIN Zamowienia ON Zamowienia.id_zamowienia = Szczegoly_zamowienia.id_zamowienia WHERE MONTH(Zamowienia.data_zamowienia) = 5 GROUP BY Lekarstwa.nazwa_leku ORDER BY ilosc_sprzedanych DESC;

CREATE VIEW widok9 AS SELECT nazwa_leku, dawka, opakowanie
FROM Lekarstwa
WHERE id_lekarstwa NOT IN (
  SELECT id_lekarstwa
  FROM Dostawy
  WHERE ilosc > 0 AND data_dostawy >= NOW()
);

CREATE VIEW widok10 AS SELECT Lekarstwa.nazwa_leku, Lekarstwa.dawka, Lekarstwa.opakowanie, COUNT(Dostawy.id_dostawy) - IFNULL(SUM(Szczegoly_zamowienia.ilosc_produktow), 0) AS liczba_opakowan_na_magazynie, MIN(Dostawy.data_dostawy) AS najstarszy_termin_waznosci FROM Lekarstwa LEFT JOIN Dostawy ON Lekarstwa.id_lekarstwa = Dostawy.id_lekarstwa LEFT JOIN Szczegoly_zamowienia ON Lekarstwa.id_lekarstwa = Szczegoly_zamowienia.id_lekarstwa GROUP BY Lekarstwa.id_lekarstwa ORDER BY najstarszy_termin_waznosci ASC;

CREATE VIEW widok11 AS SELECT nazwa_leku, kategoria, opakowanie, cena_jednostkowa, zdjecie_leku FROM lekarstwa;

CREATE VIEW widok12 AS SELECT Lekarstwa.nazwa_leku, COUNT(*) AS ilosc_przepisow
FROM Lekarstwa
INNER JOIN Szczegoly_zamowienia ON Lekarstwa.id_lekarstwa = Szczegoly_zamowienia.id_lekarstwa
INNER JOIN Zamowienia ON Szczegoly_zamowienia.id_zamowienia = Zamowienia.id_zamowienia
INNER JOIN Klienci ON Zamowienia.id_klienta = Klienci.id_klienta
WHERE Klienci.adres LIKE '%[imię i nazwisko lekarza]%'
GROUP BY Lekarstwa.nazwa_leku
ORDER BY ilosc_przepisow DESC;

CREATE VIEW widok13 AS SELECT SUM(ilosc * cena_jednostkowa) AS suma_wydatkow FROM Szczegoly_zamowienia INNER JOIN Lekarstwa ON Szczegoly_zamowienia.id_lekarstwa = Lekarstwa.id_lekarstwa INNER JOIN Zamowienia ON Szczegoly_zamowienia.id_zamowienia = Zamowienia.id_zamowienia WHERE YEAR(Zamowienia.data_zamowienia) = 2023 AND MONTH(Zamowienia.data_zamowienia) = 5;

CREATE VIEW widok14 AS SELECT Lekarstwa.nazwa_leku, SUM(Szczegoly_zamowienia.ilosc_produktow * Lekarstwa.cena_jednostkowa) AS zysk FROM Lekarstwa INNER JOIN Szczegoly_zamowienia ON Lekarstwa.id_lekarstwa = Szczegoly_zamowienia.id_lekarstwa INNER JOIN Zamowienia ON Szczegoly_zamowienia.id_zamowienia = Zamowienia.id_zamowienia INNER JOIN Dostawy ON Lekarstwa.id_lekarstwa = Dostawy.id_lekarstwa WHERE Zamowienia.status_zamowienia = 'zlożone' GROUP BY Lekarstwa.id_lekarstwa;

CREATE VIEW widok15 AS SELECT `nazwa_leku`, `kategoria`, `cena_jednostkowa`, `zdjecie_leku` FROM `lekarstwa` WHERE kategoria LIKE "%lek%" LIMIT 6;