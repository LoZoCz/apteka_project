-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Maj 2023, 21:59
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `apteka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawcy`
--

CREATE TABLE `dostawcy` (
  `id_dostawcy` int(11) NOT NULL,
  `nazwa` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `numer_telefonu` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `dostawcy`
--

INSERT INTO `dostawcy` (`id_dostawcy`, `nazwa`, `email`, `numer_telefonu`, `adres`) VALUES
(1, 'Pharma-Plus', 'info@pharmaplus.com', '+48 123 456 789', 'ul. Piękna 15, 00-001 Warszawa'),
(2, 'Lekomed', 'lekomed@lekomed.pl', '+48 987 654 321', 'ul. Kwiatowa 10, 20-100 Lublin'),
(3, 'Farmix', 'biuro@farmix.com', '+48 111 222 333', 'ul. Wrocławska 20, 50-001 Wrocław'),
(4, 'Medicus', 'kontakt@medicus.com', '+48 555 666 777', 'ul. Mickiewicza 5, 30-001 Kraków'),
(5, 'Polska Apteka', 'kontakt@polskaapteka.pl', '+48 222 333 444', 'ul. Powstańców 15, 80-001 Gdańsk'),
(6, 'ABC Pharma', 'info@abcpharma.com', '+48 123 456 789', 'ul. Przykładowa 1, 00-000 Warszawa'),
(7, 'BetaMed', 'contact@betamed.com', '+48 987 654 321', 'ul. Modelowa 2, 00-001 Kraków'),
(8, 'GamaLek', 'office@gamalek.com', '+48 555 555 555', 'ul. Wzorcowa 3, 00-002 Poznań'),
(9, 'DeltaPharm', 'support@deltapharm.com', '+48 111 222 333', 'ul. Standardowa 4, 00-003 Wrocław'),
(10, 'EpsilonMed', 'sales@epsilonmed.com', '+48 444 555 666', 'ul. Typowa 5, 00-004 Gdańsk');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawy`
--

CREATE TABLE `dostawy` (
  `id_dostawy` int(11) NOT NULL,
  `id_dostawcy` int(11) NOT NULL,
  `id_lekarstwa` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `data_dostawy` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `dostawy`
--

INSERT INTO `dostawy` (`id_dostawy`, `id_dostawcy`, `id_lekarstwa`, `ilosc`, `data_dostawy`) VALUES
(1, 1, 3, 500, '2022-01-01'),
(2, 2, 5, 200, '2022-01-02'),
(3, 3, 10, 100, '2022-01-05'),
(4, 4, 18, 50, '2022-01-06'),
(5, 5, 7, 300, '2022-01-08'),
(6, 6, 14, 150, '2022-01-10'),
(7, 7, 25, 400, '2022-01-12'),
(8, 8, 22, 250, '2022-01-14'),
(9, 9, 1, 1000, '2022-01-16'),
(10, 10, 13, 150, '2022-01-18'),
(11, 1, 20, 75, '2022-01-20'),
(12, 2, 6, 400, '2022-01-22'),
(13, 3, 11, 200, '2022-01-24'),
(14, 4, 15, 100, '2022-01-26'),
(15, 1, 7, 120, '2022-06-01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `numer_telefonu` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `email`, `numer_telefonu`, `adres`) VALUES
(1, 'Mikołaj', 'Kowalski', 'mikolaj.kowalski@example.com', '123456789', 'ul. Kwiatowa 1, Warszawa'),
(2, 'Anna', 'Nowak', 'anna.nowak@example.com', '987654321', 'ul. Słoneczna 2, Kraków'),
(3, 'Mariusz', 'Wiśniewski', 'mariusz.wisniewski@example.com', '555555555', 'ul. Nadmorska 3, Gdańsk'),
(4, 'Katarzyna', 'Dąbrowska', 'katarzyna.dabrowska@example.com', '111111111', 'ul. Główna 4, Łódź'),
(5, 'Piotr', 'Kaczmarek', 'piotr.kaczmarek@example.com', '222222222', 'ul. Wiejska 5, Poznań'),
(6, 'Ewa', 'Lewandowska', 'ewa.lewandowska@example.com', '333333333', 'ul. Szkolna 6, Wrocław'),
(7, 'Tomasz', 'Wójcik', 'tomasz.wojcik@example.com', '444444444', 'ul. Parkowa 7, Katowice'),
(8, 'Beata', 'Majewska', 'beata.majewska@example.com', '666666666', 'ul. Rycerska 8, Lublin'),
(9, 'Michał', 'Krupa', 'michal.krupa@example.com', '777777777', 'ul. Morska 9, Gdynia'),
(10, 'Monika', 'Cieślak', 'monika.cieslak@example.com', '888888888', 'ul. Radosna 10, Warszawa'),
(11, 'Mateusz', 'Krajewski', 'm.kraju@gmail.com', '124112412', 'ul. Borowikowa 7/7, Radom'),
(12, 'Monika', 'Markowska', 'm.mark@gmail.com', '1241124177', 'ul. Mostowa 7/43, Mikołów'),
(13, 'Mateusz', 'Cieślak', 'mat.cies@gmail.com', '446383299', 'ul. Borowikowa 7/79, Radom'),
(14, 'Monika', 'Kociołek', 'monimonia123@gmail.com', '123321456', 'ul. elozelo 123, Warszawa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konta`
--

CREATE TABLE `konta` (
  `id_konta` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `haslo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `konta`
--

INSERT INTO `konta` (`id_konta`, `login`, `haslo`) VALUES
(1, 'admin', 'admin'),
(2, 'szef', 'vitafarm1234');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarstwa`
--

CREATE TABLE `lekarstwa` (
  `id_lekarstwa` int(11) NOT NULL,
  `nazwa_leku` varchar(255) NOT NULL,
  `kategoria` varchar(255) NOT NULL,
  `substancje_czynne` varchar(255) NOT NULL,
  `dawka` varchar(255) NOT NULL,
  `opakowanie` varchar(255) NOT NULL,
  `cena_jednostkowa` decimal(65,0) NOT NULL,
  `zdjecie_leku` varchar(255) DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `lekarstwa`
--

INSERT INTO `lekarstwa` (`id_lekarstwa`, `nazwa_leku`, `kategoria`, `substancje_czynne`, `dawka`, `opakowanie`, `cena_jednostkowa`, `zdjecie_leku`, `ilosc`) VALUES
(1, 'Rhinocold', 'Przeziębienie', 'Paracetamol, Pseudoefedryna, Kofeina', '1 tabletka', '20 sztuk', '11', 'lek1.jpg', 20),
(2, 'Fervex', 'Przeziębienie', 'Paracetamol, Askorbinian sodu, Chlorek potasu', '1 saszetka', '10 saszetek', '10', 'lek5.jpg', 30),
(3, 'Coldrex', 'Przeziębienie', 'Paracetamol, Pseudoefedryna, Chlorek feniraminu', '1 tabletka', '12 sztuk', '12', 'lek1.jpg', 100),
(4, 'Sinupret', 'Zatoki', 'Ekstrakt z kwiatów pierwiosnka, kwiatów szałwii, korzenia prawoślazu, kwiatów dziewanny', '1 tabletka', '50 sztuk', '30', 'lek1.jpg', 20),
(5, 'Nasivin', 'Zatoki', 'Oksymetazolina', '1 ml', '10 ml', '9', 'lek4.jpg', 10),
(6, 'Ibuprom', 'Przeciwbólowe na gardło', 'Ibuprofen', '1 tabletka', '24 sztuki', '10', 'lek1.jpg', 25),
(7, 'Strepsils', 'Przeciwbólowe na gardło', 'Amylometakrezol, Alkohol 2,4-dichlorobenzylowy', '1 tabletka do ssania', '24 sztuki', '15', 'lek1.jpg', 40),
(8, 'BioSil', 'Suplement diety', 'Kolagen typu I i III, Cholina', '1 kapsułka', '60 kapsułek', '80', 'lek2.jpg', 21),
(9, 'Olimp Gold Luteina', 'Suplement diety', 'Luteina, Zeaksantyna', '1 kapsułka', '30 kapsułek', '45', 'lek2.jpg', 15),
(10, 'Perfecta Mama', 'Suplement diety', 'Witaminy (A, C, D3, E, K, B1, B2, B6, B12, niacyna, kwas pantotenowy, biotyna, kwas foliowy), składniki mineralne (wapń, magnez, żelazo, cynk, miedź, jod, selen)', '2 tabletki', '30 tabletek', '35', 'lek1.jpg', 2),
(11, 'Dermika Hydrospheric', 'Suplement piękności', 'Kolagen morski, Kwas hialuronowy', '1 saszetka', '10 saszetek', '40', 'lek5.jpg', 20),
(12, 'KeraCare Oil Moisturizer', 'Suplement piękności', 'Olej arganowy, Olej jojoba, Olej migdałowy', '1 butelka', '237 ml', '50', 'lek3.jpg', 254),
(13, 'Coldolax', 'Lek na przeziębienie', 'Paracetamol, Pseudoefedryna', '500mg/30mg', '20 tabletek', '16', 'lek1.jpg', 36),
(14, 'Sinudol', 'Lek na zatoki', 'Fenylefryna, Chlorowodorek pseudoefedryny', '5mg/30mg', '30 tabletek', '26', 'lek1.jpg', 76),
(15, 'Gardlostop', 'Przeciwbólowy na gardło', 'Lidokaina, Cetrimidium bromek', '1mg/1mg', '20 pastylek', '20', 'lek1.jpg', 123),
(16, 'Biotyna Max', 'Suplement diety', 'Biotyna', '5mg', '60 kapsułek', '30', 'lek2.jpg', 45),
(17, 'Kolagen Boost', 'Suplement diety', 'Kolagen', '500mg', '30 saszetek', '40', 'lek5.jpg', 22),
(18, 'Magnez Forte', 'Suplement diety', 'Magnez', '300mg', '30 tabletek', '15', 'lek1.jpg', 43),
(19, 'Naropin', 'Lek przeciwbólowy', 'Ropiwakaina', '2mg/ml', '5 ampułek', '70', 'lek2.jpg', 12),
(20, 'Artivin', 'Lek przeciwzapalny', 'Meloksykam', '15mg', '10 tabletek', '33', 'lek1.jpg', 27),
(21, 'Omeprazol Ranbex', 'Lek na zgagę', 'Omeprazol', '20mg', '14 kapsułek', '22', 'lek2.jpg', 24),
(22, 'Brylactin', 'Lek na alergię', 'Cetyryzyna', '10mg', '30 tabletek', '13', 'lek1.jpg', 100),
(23, 'Lisibeta', 'Lek na nadciśnienie', 'Lizynopryl', '5mg', '28 tabletek', '19', 'lek1.jpg', 37),
(24, 'Xanaflux', 'Lek uspokajający', 'Alprazolam', '0,5mg', '20 tabletek', '25', 'lek1.jpg', 20),
(25, 'Vitaplex', 'Multiwitaminowy suplement diety', 'Witaminy A, C, D, E, B-kompleks', '1 tabletka', '30 tabletek', '10', 'lek1.jpg', 65);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownika` int(11) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `numer_telefonu` varchar(255) NOT NULL,
  `stanowisko` varchar(255) NOT NULL,
  `wynagrodzenie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `email`, `numer_telefonu`, `stanowisko`, `wynagrodzenie`) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@apteka.pl', '123456789', 'Farmaceuta', 4000),
(2, 'Anna', 'Nowak', 'anna.nowak@apteka.pl', '987654321', 'Farmaceuta', 4200),
(3, 'Piotr', 'Wójcik', 'piotr.wojcik@apteka.pl', '111222333', 'Farmaceuta', 3800),
(4, 'Marta', 'Kowalczyk', 'marta.kowalczyk@apteka.pl', '333444555', 'Magazynier', 3200),
(5, 'Michał', 'Kaczmarek', 'michal.kaczmarek@apteka.pl', '555666777', 'Sprzedawca', 3000),
(6, 'Adam', 'Bąk', 'adam.bak@apteka.pl', '777888999', 'Szef apteki', 8000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szczegoly_zamowienia`
--

CREATE TABLE `szczegoly_zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_lekarstwa` int(11) NOT NULL,
  `ilosc_produktow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `szczegoly_zamowienia`
--

INSERT INTO `szczegoly_zamowienia` (`id_zamowienia`, `id_lekarstwa`, `ilosc_produktow`) VALUES
(1, 3, 2),
(2, 8, 1),
(3, 14, 3),
(4, 5, 1),
(5, 9, 2),
(6, 16, 2),
(7, 1, 4),
(8, 10, 1),
(9, 24, 1),
(10, 2, 3),
(11, 17, 1),
(12, 19, 1),
(13, 7, 1),
(14, 15, 2),
(15, 23, 2);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok1`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok1` (
`nazwa_leku` varchar(255)
,`cena_jednostkowa` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok2`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok2` (
`nazwa_leku` varchar(255)
,`cena_jednostkowa` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok3`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok3` (
`imie` varchar(255)
,`nazwisko` varchar(255)
,`data_zamowienia` date
,`status_zamowienia` varchar(255)
,`nazwa_leku` varchar(255)
,`ilosc_produktow` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok4` (
`imie` varchar(255)
,`nazwisko` varchar(255)
,`stanowisko` varchar(255)
,`wynagrodzenie` int(4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok5` (
`nazwa_leku` varchar(255)
,`ilosc_sprzedana` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok6` (
`nazwa_leku` varchar(255)
,`dawka` varchar(255)
,`opakowanie` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok7` (
`liczba_zamowien` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok8`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok8` (
`nazwa_leku` varchar(255)
,`ilosc_sprzedanych` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok9`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok9` (
`nazwa_leku` varchar(255)
,`dawka` varchar(255)
,`opakowanie` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok10`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok10` (
`nazwa_leku` varchar(255)
,`dawka` varchar(255)
,`opakowanie` varchar(255)
,`liczba_opakowan_na_magazynie` decimal(33,0)
,`najstarszy_termin_waznosci` date
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok11`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok11` (
`nazwa_leku` varchar(255)
,`kategoria` varchar(255)
,`opakowanie` varchar(255)
,`cena_jednostkowa` decimal(65,0)
,`zdjecie_leku` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok12`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok12` (
`nazwa_leku` varchar(255)
,`ilosc_przepisow` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok13`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok13` (
`suma_wydatkow` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok14`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok14` (
`nazwa_leku` varchar(255)
,`zysk` decimal(65,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `widok15`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `widok15` (
`nazwa_leku` varchar(255)
,`kategoria` varchar(255)
,`cena_jednostkowa` decimal(65,0)
,`zdjecie_leku` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `data_zamowienia` date NOT NULL,
  `status_zamowienia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `id_klienta`, `data_zamowienia`, `status_zamowienia`) VALUES
(1, 1, '2023-05-01', 'Złożone'),
(2, 8, '2023-05-02', 'Oczekujące'),
(3, 3, '2023-05-02', 'Złożone'),
(4, 7, '2023-05-03', 'Wysłane'),
(5, 4, '2023-05-03', 'Oczekujące'),
(6, 2, '2023-05-04', 'Złożone'),
(7, 5, '2023-05-04', 'Anulowane'),
(8, 1, '2023-05-05', 'Oczekujące'),
(9, 3, '2023-05-05', 'Wysłane'),
(10, 10, '2023-05-06', 'Złożone'),
(11, 9, '2023-05-06', 'Oczekujące'),
(12, 2, '2023-05-07', 'Wysłane'),
(13, 8, '2023-05-07', 'Złożone'),
(14, 6, '2023-05-08', 'Oczekujące'),
(15, 5, '2023-05-08', 'Złożone');

-- --------------------------------------------------------

--
-- Struktura widoku `widok1`
--
DROP TABLE IF EXISTS `widok1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok1`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `lekarstwa`.`cena_jednostkowa` AS `cena_jednostkowa` FROM `lekarstwa` WHERE `lekarstwa`.`cena_jednostkowa` between 40 and 6060  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok2`
--
DROP TABLE IF EXISTS `widok2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok2`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `lekarstwa`.`cena_jednostkowa` AS `cena_jednostkowa` FROM `lekarstwa` ORDER BY `lekarstwa`.`nazwa_leku` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok3`
--
DROP TABLE IF EXISTS `widok3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok3`  AS SELECT `klienci`.`imie` AS `imie`, `klienci`.`nazwisko` AS `nazwisko`, `zamowienia`.`data_zamowienia` AS `data_zamowienia`, `zamowienia`.`status_zamowienia` AS `status_zamowienia`, `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `szczegoly_zamowienia`.`ilosc_produktow` AS `ilosc_produktow` FROM (((`klienci` join `zamowienia` on(`klienci`.`id_klienta` = `zamowienia`.`id_klienta`)) join `szczegoly_zamowienia` on(`zamowienia`.`id_zamowienia` = `szczegoly_zamowienia`.`id_zamowienia`)) join `lekarstwa` on(`szczegoly_zamowienia`.`id_lekarstwa` = `lekarstwa`.`id_lekarstwa`))  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok4`
--
DROP TABLE IF EXISTS `widok4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok4`  AS SELECT `pracownicy`.`imie` AS `imie`, `pracownicy`.`nazwisko` AS `nazwisko`, `pracownicy`.`stanowisko` AS `stanowisko`, CASE WHEN `pracownicy`.`stanowisko` = 'Kierownik' THEN 8000 WHEN `pracownicy`.`stanowisko` = 'Farmaceuta' THEN 5000 ELSE 3000 END AS `wynagrodzenie` FROM `pracownicy` ORDER BY CASE WHEN `pracownicy`.`stanowisko` = 'Kierownik' THEN 8000 WHEN `pracownicy`.`stanowisko` = 'Farmaceuta' THEN 5000 ELSE 3000 END AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok5`
--
DROP TABLE IF EXISTS `widok5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok5`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, sum(`szczegoly_zamowienia`.`ilosc_produktow`) AS `ilosc_sprzedana` FROM ((`lekarstwa` join `szczegoly_zamowienia` on(`lekarstwa`.`id_lekarstwa` = `szczegoly_zamowienia`.`id_lekarstwa`)) join `zamowienia` on(`szczegoly_zamowienia`.`id_zamowienia` = `zamowienia`.`id_zamowienia`)) WHERE `zamowienia`.`data_zamowienia` between '2023-01-01' and '2023-05-31' GROUP BY `lekarstwa`.`nazwa_leku`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok6`
--
DROP TABLE IF EXISTS `widok6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok6`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `lekarstwa`.`dawka` AS `dawka`, `lekarstwa`.`opakowanie` AS `opakowanie` FROM `lekarstwa` WHERE `lekarstwa`.`opakowanie` <= 1010  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok7`
--
DROP TABLE IF EXISTS `widok7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok7`  AS SELECT count(0) AS `liczba_zamowien` FROM (`zamowienia` join `klienci` on(`zamowienia`.`id_klienta` = `klienci`.`id_klienta`)) WHERE `klienci`.`imie` = 'Anna''Anna'  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok8`
--
DROP TABLE IF EXISTS `widok8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok8`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, sum(`szczegoly_zamowienia`.`ilosc_produktow`) AS `ilosc_sprzedanych` FROM ((`lekarstwa` join `szczegoly_zamowienia` on(`lekarstwa`.`id_lekarstwa` = `szczegoly_zamowienia`.`id_lekarstwa`)) join `zamowienia` on(`zamowienia`.`id_zamowienia` = `szczegoly_zamowienia`.`id_zamowienia`)) WHERE month(`zamowienia`.`data_zamowienia`) = 5 GROUP BY `lekarstwa`.`nazwa_leku` ORDER BY sum(`szczegoly_zamowienia`.`ilosc_produktow`) AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok9`
--
DROP TABLE IF EXISTS `widok9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok9`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `lekarstwa`.`dawka` AS `dawka`, `lekarstwa`.`opakowanie` AS `opakowanie` FROM `lekarstwa` WHERE !(`lekarstwa`.`id_lekarstwa` in (select `dostawy`.`id_lekarstwa` from `dostawy` where `dostawy`.`ilosc` > 0 AND `dostawy`.`data_dostawy` >= current_timestamp()))  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok10`
--
DROP TABLE IF EXISTS `widok10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok10`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `lekarstwa`.`dawka` AS `dawka`, `lekarstwa`.`opakowanie` AS `opakowanie`, count(`dostawy`.`id_dostawy`) - ifnull(sum(`szczegoly_zamowienia`.`ilosc_produktow`),0) AS `liczba_opakowan_na_magazynie`, min(`dostawy`.`data_dostawy`) AS `najstarszy_termin_waznosci` FROM ((`lekarstwa` left join `dostawy` on(`lekarstwa`.`id_lekarstwa` = `dostawy`.`id_lekarstwa`)) left join `szczegoly_zamowienia` on(`lekarstwa`.`id_lekarstwa` = `szczegoly_zamowienia`.`id_lekarstwa`)) GROUP BY `lekarstwa`.`id_lekarstwa` ORDER BY min(`dostawy`.`data_dostawy`) ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok11`
--
DROP TABLE IF EXISTS `widok11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok11`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `lekarstwa`.`kategoria` AS `kategoria`, `lekarstwa`.`opakowanie` AS `opakowanie`, `lekarstwa`.`cena_jednostkowa` AS `cena_jednostkowa`, `lekarstwa`.`zdjecie_leku` AS `zdjecie_leku` FROM `lekarstwa``lekarstwa`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok12`
--
DROP TABLE IF EXISTS `widok12`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok12`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, count(0) AS `ilosc_przepisow` FROM (((`lekarstwa` join `szczegoly_zamowienia` on(`lekarstwa`.`id_lekarstwa` = `szczegoly_zamowienia`.`id_lekarstwa`)) join `zamowienia` on(`szczegoly_zamowienia`.`id_zamowienia` = `zamowienia`.`id_zamowienia`)) join `klienci` on(`zamowienia`.`id_klienta` = `klienci`.`id_klienta`)) WHERE `klienci`.`adres` like '%[imię i nazwisko lekarza]%' GROUP BY `lekarstwa`.`nazwa_leku` ORDER BY count(0) AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok13`
--
DROP TABLE IF EXISTS `widok13`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok13`  AS SELECT sum(`lekarstwa`.`ilosc` * `lekarstwa`.`cena_jednostkowa`) AS `suma_wydatkow` FROM ((`szczegoly_zamowienia` join `lekarstwa` on(`szczegoly_zamowienia`.`id_lekarstwa` = `lekarstwa`.`id_lekarstwa`)) join `zamowienia` on(`szczegoly_zamowienia`.`id_zamowienia` = `zamowienia`.`id_zamowienia`)) WHERE year(`zamowienia`.`data_zamowienia`) = 2023 AND month(`zamowienia`.`data_zamowienia`) = 55  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok14`
--
DROP TABLE IF EXISTS `widok14`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok14`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, sum(`szczegoly_zamowienia`.`ilosc_produktow` * `lekarstwa`.`cena_jednostkowa`) AS `zysk` FROM (((`lekarstwa` join `szczegoly_zamowienia` on(`lekarstwa`.`id_lekarstwa` = `szczegoly_zamowienia`.`id_lekarstwa`)) join `zamowienia` on(`szczegoly_zamowienia`.`id_zamowienia` = `zamowienia`.`id_zamowienia`)) join `dostawy` on(`lekarstwa`.`id_lekarstwa` = `dostawy`.`id_lekarstwa`)) WHERE `zamowienia`.`status_zamowienia` = 'zlożone' GROUP BY `lekarstwa`.`id_lekarstwa``id_lekarstwa`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `widok15`
--
DROP TABLE IF EXISTS `widok15`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `widok15`  AS SELECT `lekarstwa`.`nazwa_leku` AS `nazwa_leku`, `lekarstwa`.`kategoria` AS `kategoria`, `lekarstwa`.`cena_jednostkowa` AS `cena_jednostkowa`, `lekarstwa`.`zdjecie_leku` AS `zdjecie_leku` FROM `lekarstwa` WHERE `lekarstwa`.`kategoria` like '%lek%' LIMIT 0, 66  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dostawcy`
--
ALTER TABLE `dostawcy`
  ADD PRIMARY KEY (`id_dostawcy`);

--
-- Indeksy dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  ADD PRIMARY KEY (`id_dostawy`),
  ADD KEY `Dostawy_fk0` (`id_dostawcy`),
  ADD KEY `Dostawy_fk1` (`id_lekarstwa`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `konta`
--
ALTER TABLE `konta`
  ADD PRIMARY KEY (`id_konta`);

--
-- Indeksy dla tabeli `lekarstwa`
--
ALTER TABLE `lekarstwa`
  ADD PRIMARY KEY (`id_lekarstwa`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownika`);

--
-- Indeksy dla tabeli `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  ADD KEY `Szczegoly_zamowienia_fk0` (`id_zamowienia`),
  ADD KEY `Szczegoly_zamowienia_fk1` (`id_lekarstwa`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `Zamowienia_fk0` (`id_klienta`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dostawcy`
--
ALTER TABLE `dostawcy`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  MODIFY `id_dostawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `konta`
--
ALTER TABLE `konta`
  MODIFY `id_konta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `lekarstwa`
--
ALTER TABLE `lekarstwa`
  MODIFY `id_lekarstwa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dostawy`
--
ALTER TABLE `dostawy`
  ADD CONSTRAINT `Dostawy_fk0` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`),
  ADD CONSTRAINT `Dostawy_fk1` FOREIGN KEY (`id_lekarstwa`) REFERENCES `lekarstwa` (`id_lekarstwa`);

--
-- Ograniczenia dla tabeli `szczegoly_zamowienia`
--
ALTER TABLE `szczegoly_zamowienia`
  ADD CONSTRAINT `Szczegoly_zamowienia_fk0` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id_zamowienia`),
  ADD CONSTRAINT `Szczegoly_zamowienia_fk1` FOREIGN KEY (`id_lekarstwa`) REFERENCES `lekarstwa` (`id_lekarstwa`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `Zamowienia_fk0` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
