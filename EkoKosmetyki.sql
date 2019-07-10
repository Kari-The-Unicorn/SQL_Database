IF DB_ID ('EkoKosmetyki') IS NULL 
CREATE DATABASE EkoKosmetyki

USE EkoKosmetyki

IF OBJECT_ID('dbo.Zamowiony_produkt','U') IS NOT NULL
DROP TABLE dbo.Zamowiony_produkt

IF OBJECT_ID('dbo.Zamowienia','U') IS NOT NULL
DROP TABLE dbo.Zamowienia


IF OBJECT_ID('dbo.Produkty','U') IS NOT NULL
DROP TABLE dbo.Produkty 
	
IF OBJECT_ID('dbo.Klienci','U') IS NOT NULL
DROP TABLE dbo.Klienci 

IF OBJECT_ID('dbo.Sprzedawcy','U') IS NOT NULL
DROP TABLE dbo.Sprzedawcy

CREATE TABLE dbo.Produkty 
			(Id_Produktu INT IDENTITY(1,1) NOT NULL, 
			Nazwa VARCHAR(100) NOT NULL,
            Marka VARCHAR(25) NOT NULL,
            Kategoria VARCHAR(15) NOT NULL,
            Cena MONEY NOT NULL,
			PRIMARY KEY (ID_Produktu))

CREATE TABLE dbo.Klienci (
               Id_Klienta VARCHAR(5) NOT NULL,
	           Nazwisko VARCHAR(30) NOT NULL,
               Imie VARCHAR(30) NOT NULL,
			   E_mail VARCHAR(50) NOT NULL,
	           Adres_Zamieszkania VARCHAR(50) NOT NULL,
               Kod_Pocztowy VARCHAR(10) NOT NULL,
               Miasto_Zamieszkania VARCHAR(40) NOT NULL,
               Nr_Telefonu VARCHAR(30) NOT NULL,
			   PRIMARY KEY (Id_Klienta))

CREATE TABLE dbo.Sprzedawcy (
	Id_Sprzedawcy VARCHAR(5)  NOT NULL,
	Nazwisko VARCHAR(15) NOT NULL,
               Imie VARCHAR(15) NOT NULL,
	Wynagrodzenie MONEY NOT NULL,
	PRIMARY KEY (Id_Sprzedawcy))

CREATE TABLE dbo.Zamowienia (
	Id_Zamowienia VARCHAR(6) NOT NULL,
               Id_Klienta VARCHAR(5),
               Id_Sprzedawcy VARCHAR(5) NOT NULL,
               Data_Zamowienia DATE NOT NULL,
               Kwota_Sprzeda¿y MONEY NOT NULL,
   PRIMARY KEY (Id_Zamowienia),
   FOREIGN KEY (Id_Klienta) 
               REFERENCES dbo.Klienci (Id_Klienta),
   FOREIGN KEY (Id_Sprzedawcy) 
               REFERENCES dbo.Sprzedawcy (Id_Sprzedawcy))

CREATE TABLE dbo.Zamowiony_produkt (
	Id_Zamowiony_produkt VARCHAR(15) NOT NULL,
	Id_Zamowienia VARCHAR(6),
	Id_Produktu INT IDENTITY,
	Ilosc_Sztuk INT NOT NULL,
	Cena MONEY NOT NULL,
   PRIMARY KEY (Id_Zamowiony_produkt),
   FOREIGN KEY (Id_Zamowienia) 
               REFERENCES dbo.Zamowienia (Id_Zamowienia),
   FOREIGN KEY (Id_Produktu) 
               REFERENCES dbo.Produkty (Id_Produktu))

INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Szampon Dziegciowy','Alverde','Do w³osow','12');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Czarne Myd³o','Speick','Do mycia ','9');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Naturalna Henna Kolor Czerwony ','Khadi','Do w³osów ','25');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Naturalna Henna Kolor Czarny','Khadi','Do w³osów ','25');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Naturalna Henna Kolor Blond','Khadi','Do w³osów ','25');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Naturalna Henna Kolor Rudy','Khadi','Do w³osów ','25');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Szampon z olejkiem makadamia','AVEBIO','Do w³osów ','15');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Szampon Rozmarynowy','Lilla Mai','Do w³osów ','15');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Szampon w kostce na bazie mleka kokosowego','Purite','Do w³osów ','14');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Przeciw³upie¿owy Szampon z Neem','Khadi','Do w³osów ','16');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Lekki krem normalizuj¹cy do cery t³ustej i tr¹dzikowej','Purite','Do twarzy','32');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('T³usty krem do skóry  suchej','Purite','Do twarzy','34');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Nawil¿aj¹cy Krem z Filtrem UV','Lilla Mai','Do twarzy','31');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Lekki krem dla skóry t³ustej i mieszanej','Make Me Bio','Do twarzy','35');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Bio krem do twarzy z ekstraktem z banana','AVEBIO','Do twarzy','41');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Krem t³usty tradycyjny','Fitomed','Do twarzy','22');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Mas³o kakaowe','Make Me Bio','Do cia³a','26');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Balsam Brzozowy z Betulin?,'Sylveco','Do cia³a','19');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Mas³o do cia³a Limonkowe','Purite','Do cia³a','23');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Balsam nawil¿aj¹cy do cia³a z liœciem winoroœli i owocem granatu','ECO Cosmetics','Do cia³a','24');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Balsam do w³osów z lawend?,'Jason','Do w³osów ','26');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Czarne Myd³o Afrykañskie','Dudu','Do mycia ','16');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Myd³o do cia³a z mango','Swati','Do mycia ','16');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Myd³o Truskawkowe','Khadi','Do mycia ','16');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Szminka do ust czerwona','Lavera','Makija?,'27');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Szminka do ust ró¿owa','Alverde','Makija?,'27');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('B³yszczyk czerwony','Alverde','Makija?,'26');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('B³yszczyk ró¿owy','Lavera','Makija?,'26');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Tusz do rzês czarny','Lavera','Makija?,'39');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Tusz do rzês g³êboka czer?,'Alverde','Makija?,'44');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Tusz do rzês br¹zowy','Khadi','Makija?,'39');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('B³yszczyk czerwony','Khadi','Makija?,'26');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Pomadka do ust czerwona','Khadi','Makija?,'27');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Pasta do zêbów z olejkiem z czarnuszki','ECO Cosmetics','Jama ustna','19');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Ekologiczna Pasta do Zêbów z Ksylitolem','Lilla Mai','Jama ustna','19');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Pasta Mineralna do zêbów','Logona','Jama ustna','19');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Organiczna pasta do zêbów solna ','Receptury Babci Agafii','Jama ustna','19');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Pasta do zêbów cedrowa','Receptury Babci Agafii','Jama ustna','19');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Pasta do zêbów z borówk?brusznic?,'Receptury Babci Agafii','Jama ustna','18');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Pasta do zêbów dla dzieci z wyci¹giem z bio-truskawek i bio-malin','Lavera','Jama ustna','17');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Sól do k¹pieli mandarynka i nagietek','Purite ','K¹piel','22');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Jaœminowy ¿el pod prysznic na bazie myd³a Aleppo','Najel','Do mycia ','15');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Rokitnikowy ¿el pod prysznic','Natura Siberica','Do mycia ','15');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Peruwiañskie szmaragdowe myd³o do cia³a','ECOLAB','Do mycia ','18');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Hawajski Olej pod prysznic','ECOLAB','Do mycia ','15');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Naturalny dezodorant z a³unem o zapachu rozmarynu i lawendy','Lilla Mai','Dezodorant','14');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Naturalny dezodorant Roll-on z aloesem','Benecos','Dezodorant','15');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Dezodorant roll-on z bio-pomarañcz?i bio-rokitnikiem','Lavera','Dezodorant','15');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Naturalny krem do r¹k z morel?i czarnym bzem','Benecos','Do r¹k','14');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Krem do r¹k i paznokci z organicznym olejem liczi','Organic Therapy','Do r¹k','17');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Kredka do oczu czarna','Organic Therapy','Makija?,'17');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Kredka do oczu czer?,'Benecos','Makija?,'17');
INSERT INTO dbo.Produkty (Nazwa, Marka, Kategoria, Cena) VALUES ('Kredka do oczu br¹z','Lavera','Makija?,'17');

INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('001','Wiœniewska','Kamelia','kwisniewska@gmail.com','ul. Juliusza S³owackiego 73','87-700','Aleksandrów Kujawski','827-215-402');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('002','Bednarski','Adrian','fart12@wp.pl','ul. Rynek Zygmunta Augusta 16','16-300','Augustów','609-293-143');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('003','Czech','Marian','wiki@o2.pl','ul. 9 Maja 15','97-400','Be³chatów','459-524-563');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('004','Nowak','Natalia','nati32@gmail.com','ul. Brzeska 21','21-500','Bia³a Podlaska','815-815-815');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('005','D¹browski','Janusz','dabrowski@interia.pl','ul. Krakowska 68','26-800','Bia³obrzegi','123-528-874');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('006','Pi¹tek','Mateusz','matix123@o2.pl','ul. Adama Mickiewicza 50','15-232','Bia³ystok','224-173-208');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('007','Sobczak','Eugeniusz','sobczak1@wp.pl','ul. Lipowa 4','15-427','Bia³ystok','512-818-117');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('008','Chojnacka','Maja','chojno@gmail.com','ul. Marii Curie-Sk³odowskiej 14','58-200','Dzier¿oniów','222-766-382');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('009','Nowakowska','Wiktoria','nowak@interia.pl','ul. Radzymiñska 14','82-305','Elbl¹g','667-987-490');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('010','Augustyniak','Genowefa','august@gmail.com','ul. Stanis³awa Dubois 3/4','15-349','Bia³ystok','603-194-882');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('011','Szewczyk','Zuzanna','szewczyk@interia.pl','ul. Warszawska 14','15-063','Bia³ystok','327-804-570');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('012','Bia³ek','Julia','bialek@gmail.com','ul. Zwyciêstwa 8b','15-703','Bia³ystok','606-440-365');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('013','Cybulski','Miko³aj','mikolo@interia.pl','ul. Wroc³awska 7','55-040','Bielany Wroc³awskie','527-239-191');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('014','Czy?,'Jan','czyzyk@onet.pl','ul. Adama Mickiewicza 62','17-100','Bielsk Podlaski','422-186-458');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('015','Sikora','Julia','sikoro@o2.pl','ul. 11 Listopada 102','43-300','Bielsko-Bia³a','333-003-031');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('016','Jaworski','Aleksander','alejandro@wp.pl','ul. Teodora Sixta 19','43-300','Bielsko-Bia³a','486-904-8541');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('017','Kurowska','Patrycja','patix@interia.pl','ul. Bankowa 2a','23-400','Bi³goraj','788-253-566');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('018','Zaj¹c','Karolina','karolaz@wp.pl','ul. Kazimierza Wielkiego 11','32-700','Bochnia','436-594-199');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('019','J?wiak','Jan','janjoz@gmail.com','ul. Ignacego Daszyñskiego 6e','59-920','Bogatynia','224-930-409');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('020','Kasprzyk','Szymon','szymonkas@interia.pl','ul. Adama Asnyka 18','59-700','Boles³awiec','600-126-140');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('021','Gajewski','Piotr','petru@wp.pl','ul. Rynek 9','63-810','Borek Wielkopolski','616-283-792');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('022','Lewandowski','Kacper','kaspar@onet.pl','ul. D³uga 2','49-300','Brzeg','607-241-634');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('023','Kowalczyk','Bartek','bartos@interia.pl','ul. Partyzantów 21','28-100','Busko-Zdrój','514-163-909');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('024','Brzozowski','Mateusz','mateux@gmail.com','ul. Ferdynanda Focha 4','85-070','Bydgoszcz','518-158-555');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('025','G³owacki','Aleksander','aleksandrog@o2.pl','ul. Gdañska 42','85-006','Bydgoszcz','222-386-156');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('026','Wójtowicz','Franciszek','frankoni@interia.pl','ul. Józefa Twardzickiego 33','85-791 ','Bydgoszcz','507-190-400');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('027','Ko³odziejczyk','Karolina','kolodziej@wp.pl','ul. Modrzewiowa 15a','85-631','Bydgoszcz','515-675-595');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('028','Kêdzierski','Kamil','kedzier@gmail.com','ul. Gliwicka 15','41-902','Bytom','436-594-199');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('029','Witkowski','Marcin','witek@gmail.com','ul. Lwowska 8/10','22-100','Che³m','875-865-632');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('030','Trzaska','S³awomir','trzaska@gmail.com','ul. Dworcowa 24a','86-200','Che³mno','224-930-409');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('031','Nowacka','Ewa','nowak@o2.pl','ul. Tadeusza Koœciuszki 38','89-600','Chojnice','908-634-643');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('032','Cezar','Gra¿yna','cezar@o2.pl','ul. Wolnoœci 24','41-500','Chorzów','503-200-240');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('033','Wierny','Antoni','wierny@interia.pl','Al. Henryka 1','32-500','Chrzanów','503-200-252');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('034','Paliwoda','Wies³awa','paliwoda@wp.pl','ul. 3 Maja 3A','06-400','Ciechanów','600-126-140');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('035','Pogodny','Lucyna','pogod@interia.pl','ul. Zdrojowa 11','87-720','Ciechocinek','373-643-432');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('036','Sikora','Jerzy','sikorek@onet.pl','ul. Stary Targ 4','43-400','Cieszyn','616-283-792');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('037','Wikorski','Stanis³aw','wikor@gmail.com','Pl. Jana Paw³a II 4/4','43-502','Czechowice-Dziedzice','518-158-555');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('038','Zugerski','S³awomir','zuger@o2.pl','Al. Najœwiêtszej Marii Panny 29','42-200','Czêstochowa','607-241-634');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('039','Wilk','Ewa','wilk@onet.pl','ul. Dekabrystów 33','42-200','Czêstochowa','874-544-246');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('040','Stachowska','Joanna','stacho@gmail.com','ul. Spokojna 1/12','42-200','Czêstochowa','514-163-990');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('041','Wybraniec','Kazimierz','wybran@interia.pl','ul. Niska 19','02-781','Warszawa','446-753-463');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('042','Zgubna','Leonia','zgubn@o2.pl','ul. Poznañska 98','45-321','D¹browa Tarnowska','666-604-792');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('043','Kisielewski','Protazy','kisiel@gmail.com','ul. Têczowa 19/100','76-414','Dêbica','577-453-674');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('044','Wielgowska','Eurelia','wielgowska@wp.pl','ul. Krótka 5','53-333','Wroc³aw','487-034-028');
INSERT INTO dbo.Klienci (Id_Klienta, Nazwisko, Imie, E_mail, Adres_Zamieszkania, Kod_Pocztowy, Miasto_Zamieszkania, Nr_Telefonu) VALUES ('045','Tomaszewska','Karolina','tomaska@o2.pl','ul. D³uga 12/35','53-333','Wroc³aw','755-545-785');

INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.11 ','Kowalski','Jan','2300');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.12 ','Nowak','Alicja','2450');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.13 ','Morawski','Andrzej','2100');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.14 ','Komaska','Regina','2150');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.15 ','Michalska','Bo¿ena','2125');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.16 ','Borowiecka','Zofia','2200');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.19 ','Helska','Leokadia','1950');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.21 ','Masternak','Ignacy','2700');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.22 ','Rawska','Izabela','2500');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.23 ','Rogalska','Genowefa','2100');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.24 ','Wawerska','Saturnina','2200');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.25 ','Kownacka','Lidia','2250');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.26 ','Rymarski','Wojciech','2300');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.27 ','Bielecki','Marek','2700');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.28 ','Kubrak','Wies³aw','2800');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.29 ','Poznaniec','Ludwig','2900');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.30 ','Sromotny','Ziemowit','2950');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.41 ','Roboñski','Ignacy','2100');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.42 ','Rafalski','Dariusz','2500');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.43 ','Nowacka','Barbara','2600');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.44 ','Senyszyñska','Lucyna','2900');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.45 ','Kownacka','Karolina','2800');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.46 ','Zucherska','Magda','2850');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.47 ','Bocholska','Alina','1900');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.49 ','Drabik','Tadeusz','2100');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.50 ','Ramerski','Pawe?,'2200');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.61 ','Drobski','Piotr','2350');
INSERT INTO dbo.Sprzedawcy (Id_Sprzedawcy, Nazwisko, Imie, Wynagrodzenie) VALUES ('01.62 ','Liszek','Magdalena','2300');

INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.100','004','01.46 ','2015-1-30','12');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.101','032','01.12 ','2015-2-13','108');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.102','020','01.44 ','2015-2-20','201');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.103','023','01.50 ','2015-4-9','300');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.104','027','01.42 ','2015-4-30','75');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.105','030','01.61 ','2015-5-1','14');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.106','039','01.49 ','2015-5-8','75');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.107','038','01.45 ','2015-5-26','18');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.108','042','01.46 ','2015-6-1','56');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.109','045','01.62 ','2015-6-3','81');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.110','021','01.50 ','2015-7-23','137');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.111','044','01.46 ','2015-8-4','192');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.112','031','01.41 ','2015-8-5','81');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.113','022','01.50 ','2015-8-27','170');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.114','031','01.46 ','2015-9-15','102');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.115','040','01.45 ','2015-9-16','128');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.116','025','01.30 ','2015-10-13','300');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.117','004','01.50 ','2015-10-26','48');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.118','037','01.12 ','2015-11-12','114');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.119','022','01.43 ','2015-12-8','426');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.120','045','01.49 ','2015-12-18','25');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.121','010','01.45 ','2015-12-21','54');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.122','028','01.61 ','2015-1-27','45');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.123','025','01.47 ','2015-1-28','63');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.124','037','01.61 ','2015-2-6','225');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.125','031','01.49 ','2015-2-27','120');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.126','029','01.61 ','2015-3-13','105');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.127','004','01.61 ','2015-4-1','105');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.128','019','01.12 ','2015-4-3','150');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.129','040','01.19 ','2015-4-14','120');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.130','017','01.61 ','2015-5-15','225');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.131','024','01.11 ','2015-5-26','100');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.132','031','01.12 ','2015-6-19','57');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.133','022','01.46 ','2015-7-17','133');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.134','025','01.61 ','2015-7-24','120');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.135','043','01.46 ','2015-7-27','76');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.136','026','01.45 ','2015-8-10','50');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.137','004','01.15 ','2015-8-21','16');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.138','032','01.19 ','2015-8-27','56');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.139','016','01.49 ','2015-10-28','45');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.140','036','01.13 ','2015-11-3','238');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.141','045','01.12 ','2015-11-6','60');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.142','041','01.46 ','2015-11-16','72');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.143','015','01.16 ','2015-12-16','225');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.144','022','01.19 ','2016-1-1','100');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.145','033','01.26 ','2016-1-11','389');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.146','014','01.22 ','2016-1-28','404');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.147','004','01.19 ','2015-1-8','285');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.148','002','01.49 ','2015-2-3','105');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.149','025','01.25 ','2015-2-24','112');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.150','010','01.12 ','2015-2-25','144');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.151','011','01.61 ','2015-3-4','288');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.152','013','01.46 ','2015-3-10','66');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.153','007','01.21 ','2015-3-18','164');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.154','013','01.46 ','2015-4-6','265');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.155','034','01.27 ','2015-4-7','357');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.156','010','01.28 ','2015-4-9','755');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.157','009','01.12 ','2015-4-10','438');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.158','035','01.24 ','2015-4-13','192');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.159','018','01.28 ','2015-4-21','391');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.160','012','01.28 ','2015-4-22','216');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.161','004','01.19 ','2015-5-19','338');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.162','003','01.23 ','2015-7-1','380');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.163','019','01.28 ','2015-7-3','50');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.164','008','01.12 ','2015-7-23','27');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.165','019','01.19 ','2015-7-27','180');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.166','033','01.29 ','2015-8-25','206');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.167','005','01.12 ','2015-9-29','112');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.168','006','01.28 ','2015-10-13','128');
INSERT INTO dbo.Zamowienia (Id_Zamowienia, Id_Klienta, Id_Sprzedawcy, Data_Zamowienia, Kwota_Sprzeda¿y) VALUES ('01.169','019','01.45 ','2015-10-29','162');

SET IDENTITY_INSERT dbo.Zamowiony_produkt ON
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.11.Z ','01.100','1','1','12');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.12.Z ','01.151','11','9','288');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.13.Z ','01.101','33','3','81');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.14.Z ','01.156','42','7','105');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.15.Z ','01.119','37','4','76');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.16.Z ','01.109','41','3','66');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.17.Z ','01.101','2','3','27');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.18.Z ','01.152','16','3','66');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.19.Z ','01.102','27','6','156');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.20.Z ','01.157','38','7','133');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.21.Z ','01.112','45','2','30');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.22.Z ','01.110','34','5','95');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.23.Z ','01.102','8','1','45');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.24.Z ','01.153','15','4','164');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.25.Z ','01.103','28','3','78');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.26.Z ','01.103','42','5','105');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.27.Z ','01.154','14','5','175');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.28.Z ','01.104','8','3','45');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.29.Z ','01.155','12','9','306');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.30.Z ','01.105','9','1','14');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.31.Z ','01.106','5','3','75');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.32.Z ','01.107','2','2','18');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.33.Z ','01.108','46','4','56');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.34.Z ','01.139','7','3','45');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.35.Z ','01.156','13','4','124');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.36.Z ','01.109','47','1','15');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.37.Z ','01.140','12','7','238');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.38.Z ','01.157','21','7','182');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.39.Z ','01.110','9','3','42');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.40.Z ','01.141','1','5','60');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.41.Z ','01.158','22','12','192');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.42.Z ','01.146','30','4','176');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.43.Z ','01.111','11','6','192');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.44.Z ','01.142','2','8','72');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.45.Z ','01.159','19','17','391');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.46.Z ','01.118','43','7','105');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.47.Z ','01.112','51','3','51');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.48.Z ','01.143','3','9','225');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.49.Z ','01.113','52','5','85');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.50.Z ','01.144','4','4','100');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.51.Z ','01.166','41','2','44');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.52.Z ','01.114','53','6','102');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.53.Z ','01.154','39','5','90');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.54.Z ','01.115','11','4','128');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.55.Z ','01.160','20','9','216');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.56.Z ','01.155','40','3','51');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.57.Z ','01.116','4','12','300');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.58.Z ','01.161','17','13','338');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.59.Z ','01.156','35','1','19');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.60.Z ','01.145','49','1','14');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.61.Z ','01.117','1','4','48');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.62.Z ','01.162','18','20','380');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.63.Z ','01.157','36','1','19');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.64.Z ','01.118','2','1','9');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.65.Z ','01.156','31','13','507');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.66.Z ','01.165','42','3','45');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.67.Z ','01.119','6','14','350');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.68.Z ','01.120','3','1','25');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.69.Z ','01.121','2','6','54');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.70.Z ','01.122','2','5','45');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.71.Z ','01.157','32','4','104');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.72.Z ','01.123','2','7','63');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.73.Z ','01.165','25','5','135');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.74.Z ','01.124','6','9','225');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.75.Z ','01.166','26','6','162');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.76.Z ','01.125','8','8','120');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.77.Z ','01.167','23','7','112');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.78.Z ','01.126','7','7','105');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.79.Z ','01.145','5','15','375');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.80.Z ','01.168','24','8','128');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.81.Z ','01.127','8','7','105');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.82.Z ','01.146','36','12','228');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.83.Z ','01.169','44','9','162');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.84.Z ','01.128','3','6','150');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.85.Z ','01.147','37','15','285');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.86.Z ','01.129','47','8','120');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.87.Z ','01.148','8','7','105');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.88.Z ','01.130','5','9','225');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.89.Z ','01.149','9','8','112');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.90.Z ','01.131','6','4','100');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.91.Z ','01.150','10','9','144');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.92.Z ','01.113','50','5','85');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.93.Z ','01.132','35','3','57');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.94.Z ','01.103','29','3','117');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.95.Z ','01.133','35','7','133');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.96.Z ','01.104','48','2','30');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.97.Z ','01.134','7','8','120');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.98.Z ','01.135','34','4','76');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.99.Z ','01.136','6','2','50');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.100.Z ','01.137','23','1','16');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.101.Z ','01.138','9','4','56');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.102.Z ','01.163','3','2','50');
INSERT INTO dbo.Zamowiony_produkt (Id_Zamowiony_produkt, Id_Zamowienia, Id_Produktu, Ilosc_Sztuk, Cena) VALUES ('PKD01.103.Z ','01.164','33','1','27');
SET IDENTITY_INSERT dbo.Zamowiony_produkt OFF
