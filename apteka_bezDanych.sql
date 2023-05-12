CREATE TABLE `dostawcy` (
	`id_dostawcy` int NOT NULL,
	`nazwa` varchar NOT NULL,
	`email` varchar NOT NULL,
	`numer_telefonu` varchar NOT NULL,
	`adres` varchar NOT NULL DEFAULT 'charsetutf8mb4',
	PRIMARY KEY (`id_dostawcy`)
);

CREATE TABLE `dostawy` (
	`id_dostawy` int NOT NULL,
	`id_dostawcy` int NOT NULL,
	`id_lekarstwa` int NOT NULL,
	`ilosc` int NOT NULL,
	`data_dostawy` DATE NOT NULL DEFAULT 'charsetutf8mb4'
);

CREATE TABLE `klienci` (
	`id_klienta` int NOT NULL,
	`imie` varchar NOT NULL,
	`nazwisko` varchar NOT NULL,
	`email` varchar NOT NULL,
	`numer_telefonu` varchar NOT NULL,
	`adres` varchar NOT NULL DEFAULT 'charsetutf8mb4',
	PRIMARY KEY (`id_klienta`)
);

CREATE TABLE `konta` (
	`id_konta` int NOT NULL,
	`login` varchar NOT NULL DEFAULT 'null',
	`haslo` varchar NOT NULL DEFAULT 'null'
);

CREATE TABLE `lekarstwa` (
	`id_lekarstwa` int NOT NULL,
	`nazwa_leku` varchar NOT NULL,
	`kategoria` varchar NOT NULL,
	`substancje_czynne` varchar NOT NULL,
	`dawka` varchar NOT NULL,
	`opakowanie` varchar NOT NULL,
	`cena_jednostkowa` DECIMAL NOT NULL,
	`zdjecie_leku` varchar NOT NULL DEFAULT 'null',
	`ilosc` int NOT NULL DEFAULT 'null',
	PRIMARY KEY (`id_lekarstwa`)
);

CREATE TABLE `pracownicy` (
	`id_pracownika` int NOT NULL,
	`imie` varchar NOT NULL,
	`nazwisko` varchar NOT NULL,
	`email` varchar NOT NULL,
	`numer_telefonu` varchar NOT NULL,
	`stanowisko` varchar NOT NULL,
	`wynagrodzenie` int NOT NULL DEFAULT 'charsetutf8mb4'
);

CREATE TABLE `szczegoly_zamowienia` (
	`id_zamowienia` int NOT NULL,
	`id_lekarstwa` int NOT NULL,
	`ilosc_produktow` int NOT NULL DEFAULT 'charsetutf8mb4'
);

CREATE TABLE `zamowienia` (
	`id_zamowienia` int NOT NULL,
	`id_klienta` int NOT NULL,
	`data_zamowienia` DATE NOT NULL,
	`status_zamowienia` varchar NOT NULL DEFAULT 'charsetutf8mb4',
	PRIMARY KEY (`id_zamowienia`)
);

ALTER TABLE `dostawy` ADD CONSTRAINT `dostawy_fk0` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy`(`id_dostawcy`);

ALTER TABLE `dostawy` ADD CONSTRAINT `dostawy_fk1` FOREIGN KEY (`id_lekarstwa`) REFERENCES `lekarstwa`(`id_lekarstwa`);

ALTER TABLE `szczegoly_zamowienia` ADD CONSTRAINT `szczegoly_zamowienia_fk0` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia`(`id_zamowienia`);

ALTER TABLE `szczegoly_zamowienia` ADD CONSTRAINT `szczegoly_zamowienia_fk1` FOREIGN KEY (`id_lekarstwa`) REFERENCES `lekarstwa`(`id_lekarstwa`);

ALTER TABLE `zamowienia` ADD CONSTRAINT `zamowienia_fk0` FOREIGN KEY (`id_klienta`) REFERENCES `klienci`(`id_klienta`);









