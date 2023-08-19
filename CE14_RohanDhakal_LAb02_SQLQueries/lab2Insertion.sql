USE assignment;

INSERT INTO Author(AuthorID, `Name`, DOB, Nationality, Gender)
VALUES
	(111,'Monty Desai', '1981-09-03', 'Indian', 'Male'),
    (112,'Abhimanyu Desai', '1989-09-03', 'Indian', 'Male'),
    (113,'Anne Frank', '1966-10-28', 'French', 'Female'),
    (114,'Khim Bahadur Khatri', '1984-01-24', 'Nepali', 'Male'),
    (115,'SiddhiCharan Shrestha', '1975-04-03', 'Nepali', 'Male'),
    (116,'Annie Besant', '1957-10-08', 'British', 'Female'),
    (117,'Khaled Hosseini', '1961-06-13', 'Afghani', 'Male'),
    (118,'Mark Summerfield', '1978-12-11', 'American', 'Male'),
    (119,'Wiliam W. Hines', '1961-09-30', 'Canadian', 'Male'),
    (120,'Yasmeena Ali', '1963-08-07', 'Israeli', 'Female'),
    (121,'Laxmi Prasad Devkota', '1957-02-03', 'Nepali', 'Male'),
    (122,'BP Koirala', '1955-02-03', 'Nepali', 'Male');
    
INSERT INTO Authoredby(AuthorID, ISBN)
VALUES
(111,178140885085),
(111,578140885035),
(112,578140885035),
(113,078140885075),
(114,898140881526),
(115,278140885065),
(116,878131675020),
(117,478140885025),
(118,078140885095),
(119,398140885052),
(114,398140885052),
(120,316755885025),
(121,679140885045),
(122,778150885055);

INSERT INTO Company(CompanyID, Address, Website)
VALUES
(9999,'Koteshwor-09, Kathmandu', 'www.publishingcompany.com');

INSERT INTO Companyphone(Phone, CompanyID)
VALUES
(9810000000, 9999),
(9812345678, 9999);

INSERT INTO Distributor (PANID, `Name`, Website, Location)
VALUES
(999999990, 'Distributor1' , 'www.dist1.com', 'Kathmandu'),
(999999991, 'Distributor2' , 'www.dist2.com', 'Pokhara'),
(999999992, 'Distributor3' , 'www.dist3.com', 'Biratnagar'),
(999999993, 'Distributor4' , 'www.dist4.com', 'Butwal');

INSERT INTO Distributorphone(Phone, PANID)
VALUES
(9816933888, 999999990),
(9816943111, 999999990),
(9842567890, 999999991),
(9769098765, 999999992),
(9862345678, 999999991),
(9807659873, 999999993),
(9876509876, 999999993);

INSERT INTO orders(orderNumber, TotalAmount, Discount, `Status`, PANID, BooksQuantity, MagazineQuantity, `Date`)
VALUES
(1001, 200000, 20000, 'pending', '999999990', 1000, 0 , '2021-10-10'),
(1002, 30000, 3000, 'completed', '999999990', 100, 0 , '2022-01-10'),
(1003, 80000, 4000, 'completed', '999999990', 200, 0 , '2021-12-10'),
(1004, 60000, 6000, 'pending', '999999992', 300, 0 , '2022-02-14'),
(1005, 30000, 3000, 'pending', '999999991', 150, 0 , '2022-02-23'),
(1006, 13000, 1300, 'completed', '999999992', 130, 0 , '2021-11-10'),
(1007, 420000, 42000, 'pending', '999999993', 400, 0 , '2022-02-18'),
(1008, 84000, 8400, 'completed', '999999993', 70, 0 , '2021-01-28'),
(1009, 350000, 35000, 'pending', '999999991', 175, 0 , '2022-01-08'),
(1010, 350000, 35000, 'completed', '999999993', 100, 0 , '2022-02-03'),
(1011, 612900, 61290, 'pending', '999999992', 540, 0 , '2022-01-12'),
(1012, 750000, 75000, 'completed', '999999990', 500, 0 , '2022-01-02'),
(1200, 35000, 2500, 'completed', '999999990', 0, 500 , '2022-01-28'),
(1201, 22000, 2000, 'pending', '999999991', 0, 400 , '2022-02-21'),
(1202, 60000, 4000, 'completed', '999999991', 0, 500 , '2022-01-11'),
(1203, 24000, 2000, 'completed', '999999991', 0, 400 , '2021-11-22'),
(1204, 51000, 6000, 'completed', '999999991', 0, 300 , '2022-01-02'),
(1205, 16000, 1000, 'pending', '999999992', 0, 200 , '2022-02-20'),
(1206, 9000, 500, 'completed', '999999992', 0, 100 , '2021-01-02'),
(1207, 12750, 1750, 'completed', '999999993', 0, 150 , '2021-10-02'),
(1208, 35000, 2500, 'pending', '999999990', 0, 350 , '2022-02-03');

INSERT INTO Orderpayment(PaymentID, Dues, PaidAmount, `History`, VATDetails, Discount, TotalAmount, PANID, orderNumber)
VALUES
(811, 30000, 150000, '2021-10-10:: 1:00 PM', 0,20000, 200000, 999999990,1001),
(812, 0, 27000, '2022-01-10:: 2:00 PM', 0, 3000, 30000, 999999990,1002),
(813, 0, 72000, '2021-12-19:: 10:00 AM', 0, 8000, 80000, 999999990,1003),
(814, 0, 54000, '2022-02-16:: 11:55 AM', 0, 6000, 60000, 999999992,1004),
(815, 2000, 25000, '2022-02-16:: 12:23 PM', 0, 3000, 30000, 999999991,1005),
(816, 0, 12700, '2021-11-10:: 1:33 PM', 0, 1300, 13000, 999999992,1006),
(817, -2200, 40000, '2022-01-28:: 10:00 AM', 0, 4200, 420000, 999999993,1007),
(818, 0, 71600, '2022-01-10:: 11:00 AM', 0, 8400, 84000, 999999993,1008),
(819, 15000, 300000, '2022-02-04:: 10:50 AM', 0, 35000, 350000, 999999991,1009),
(820, 1610, 550000, '2022-01-28:: 4:00 PM', 0, 61290, 612900, 999999993,1010);

INSERT INTO Books(ISBN, Title, Genre, Edition, Price)
VALUES
(478140885025, 'The Kite Runner', 'Biography', '1st' ,200),
(578140885035, 'Python Programming', 'Programming', '14th', 300),
(679140885045, 'Muna Madan', 'Fictional', '1st', 400),
(778150885055, 'Karnali Blues', 'Science', '3rd', 250),
(278140885065, 'Sirishko Phool', 'Comedy', '1st', 200),
(078140885075, 'AnneFrank:Diary', 'AutoBiography', '1st' ,100),
(178140885085, 'China Harayeko Manchhe', 'AutoBiography', '1st' , 1050),
(078140885095, 'Dawn till Dusk', 'Love and Romance', '1st', 1200 ),
(398140885052, 'Probability and Statistics', 'Mathematics', '13th', 2000),
(898140881526, 'Differential Mathematics', 'Mathematics', '9th', 3500),
(878131675020, 'Annie Besant: An Autobiography', 'Auto-Biography', '1st', 1135),
(316755885025, 'Awareness', 'Social', '7th', 1500); 

INSERT INTO prints(PrintID, CompanyID, Quantity, PrintDate)
VALUES
(01, 9999, 100, '2021-11-10'),
(02, 9999, 200, '2022-11-10'),
(03, 9999, 70, '2019-01-10'),
(04, 9999, 80, '2022-10-01'),
(05, 9999, 175, '2022-01-01'),
(06, 9999, 200, '2021-12-28'),
(07, 9999, 1200, '1899-11-11'),
(08, 9999, 600, '2005-12-07'),
(09, 9999, 900, '2004-04-05'),
(10, 9999, 1300, '1991-08-02'),
(11, 9999, 1200, '1998-10-01'),
(12, 9999, 700, '1999-12-28'),
(13, 9999, 600, '2005-12-07'),
(14, 9999, 900, '2004-04-05'),
(15, 9999, 1300, '1991-08-02'),
(16, 9999, 1200, '1998-10-01'),
(17, 9999, 600, '2005-12-07'),
(18, 9999, 900, '2004-04-05'),
(19, 9999, 1300, '1991-08-02'),
(20, 9999, 1200, '1998-10-01'),
(21, 9999, 100, '2021-01-10');

INSERT INTO bookprint(ISBN, printID)
VALUES
(478140885025, 01),
(578140885035, 02),
(679140885045, 03),
(316755885025, 04),
(878131675020, 05),
(898140881526, 06),
(398140885052, 07),
(078140885095, 08),
(778150885055, 09),
(278140885065, 10),
(178140885085, 11),
(078140885075, 12);

INSERT INTO Magazine(MagazineID, Title, Genre, Publishperiod, Price)
VALUES
(3100, 'Saaptahik', 'comedy', 'weekly', 70),
(3101, 'Forbes', 'Rich Information', 'yearly', 55),
(3102, 'Time', 'comedy', 'weekly', 120),
(3103, 'The Atlantic', 'Suspense', 'weekly', 60),
(3104, 'Sports Illustrated', 'Sports', 'monthly', 170),
(3105, 'People', 'General', 'Daily', 80),
(3106, 'Gorkhapatra', 'Newspaper', 'Daily', 90),
(3107, 'Golf Magazine', 'sports', 'Fortnight', 85),
(3108, 'Hindustan', 'Romance', 'weekly', 100);

INSERT INTO Magazineprint(MagazineID,PrintID)
VAlUES
(3100, 13),
(3101, 14),
(3102, 15),
(3103, 16),
(3104, 17),
(3105, 18),
(3106, 19),
(3107, 20),
(3108, 21);

INSERT INTO Transactions(TransactionID, Method, Amount, Dues, AuthorID, CompanyID)
VALUES
(601, 'online', 14000, 6000, 111, 9999),
(602, 'cheque', 24000, 0, 113, 9999),
(603, 'cash', 14000, 6000, 112, 9999),
(604, 'online', 14000, 6000, 119, 9999),
(605, 'cheque', 14000, 6000, 120, 9999),
(606, 'connectIPS', 14000, 6000, 117, 9999);

INSERT INTO Sales(SalesID, `Date`, `Time`, TotalAmount, TotalOrders, Dues)
VALUES
(4111, '2022-02-15', '10:00 AM', 50000, 120, 0),
(4112, '2022-01-05', '11:00 AM', 50000, 200, 0),
(4113, '2022-02-05', '11:55 AM', 50000, 120, 0),
(4114, '2021-11-05', '10:00 AM', 50000, 120, 0),
(4115, '2021-10-05', '10:00 AM', 50000, 120, 0),
(4116, '2021-12-17', '10:00 AM', 50000, 120, 0);

INSERT INTO distributes(SalesID, PANID)
VALUES
(4111, 999999990),
(4112, 999999991),
(4113, 999999991),
(4114, 999999993),
(4115, 999999992),
(4116, 999999990);

INSERT INTO stores(StoreID, StoreName, Address)
VALUES
(1440, 'Store 1', 'Balkhu'),
(1441, 'Store 2', 'Banepa'),
(1442, 'Store 3', 'Thapathali'),
(1443, 'Store 4', 'Dhulikhel'),
(1444, 'Store 5', 'Bhaktapur'),
(1445, 'Store 6', 'Pepsicola');

INSERT INTO storesPhone(Phone, StoreID)
VALUES
(9816933887, 1440),
(9816923887, 1441),
(9816913887, 1442),
(9816943887, 1443),
(9816953887, 1444),
(9816963887, 1440),
(9816993887, 1445);

INSERT INTO requests(SalesID, StoreID)
VALUES
(4111, 1441),
(4112, 1441),
(4113, 1440),
(4114, 1442),
(4115, 1443),
(4116, 1444);

INSERT INTO bookOrder(ID, orderNumber, ISBN)
VALUES
(1, 1001, 478140885025),
(2, 1002, 478140885025),
(3, 1003, 478140885025),
(4, 1004, 578140885035),
(5, 1005, 679140885045),
(6, 1006, 778150885055),
(7, 1007, 278140885065),
(8, 1008, 078140885075),
(9, 1009, 178140885085),
(10, 1010, 078140885095),
(11, 1011, 898140881526),
(12, 1012, 398140885052);

INSERT INTO magazineOrder(ID, orderNumber, magazineID)
VALUES
(1, 1200, 3100),
(2, 1201, 3101),
(3, 1202, 3102),
(4, 1203, 3103),
(5, 1204, 3104),
(6, 1205, 3105),
(7, 1206, 3106),
(8, 1207, 3107),
(9, 1208, 3108);
