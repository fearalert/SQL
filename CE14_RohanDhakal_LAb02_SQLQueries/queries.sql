USE assignment;

-- 1 Find the name of all published books
SELECT Title, printDate FROM prints
JOIN bookprint
ON
bookprint.printID = prints.PrintID
JOIN Books
ON
Books.ISBN = bookprint.ISBN
WHERE 
PrintDate < curdate();

-- 2  Find the name of all books published before 2000.
SELECT Title, printDate FROM prints
JOIN bookprint
ON
bookprint.printID = prints.PrintID
JOIN Books
ON
Books.ISBN = bookprint.ISBN
WHERE 
PrintDate < '2000-01-01';

-- 3 Get the details of the books written by a particular author.
SELECT Books.ISBN,Title,Author.Name,Genre, Edition, Price FROM Books
JOIN AuthoredBy
ON
Books.ISBN = AuthoredBY.ISBN
JOIN Author
ON
Author.AuthorID = AuthoredBy.AuthorID
WHERE
`Name` = 'Khim Bahadur Khatri';


-- 4 Find the name of all weekly publicatiONs
SELECT Title, Genre, PublishPeriod FROM Magazine WHERE PublishPeriod= 'weekly';

-- 5 Find the pre-ordered books
ALTER TABLE Orders ADD COLUMN ISBN BIGINT;
ALTER TABLE Orders ADD FOREIGN KEY (ISBN) REFERENCES Books (ISBN);

UPDATE Orders set ISBN = 478140885025 where orderNumber = 1001;
UPDATE Orders set ISBN = 578140885035 where orderNumber = 1002;
UPDATE Orders set ISBN = 679140885045 where orderNumber = 1003;
UPDATE Orders set ISBN = 778150885055 where orderNumber = 1004;
UPDATE Orders set ISBN = 278140885065 where orderNumber = 1005;
UPDATE Orders set ISBN = 078140885075 where orderNumber = 1006;
UPDATE Orders set ISBN = 178140885085 where orderNumber = 1007;
UPDATE Orders set ISBN = 078140885095 where orderNumber = 1008;
UPDATE Orders set ISBN = 398140885052 where orderNumber = 1009;
UPDATE Orders set ISBN = 898140881526 where orderNumber = 1010;
UPDATE Orders set ISBN = 878131675020 where orderNumber = 1011;
UPDATE Orders set ISBN = 316755885025 where orderNumber = 1012;

SELECT Title FROM prints 
JOIN 
bookprint 
ON 
bookprint.PrintID = prints.PrintID 
JOIN 
Orders 
ON 
Orders.Date < prints.PrintDate 
JOIN books 
ON books.ISBN = bookprint.ISBN
GROUP BY Title; 

-- 6 Get the details of all publicatiONs with the name starting with an 'A'
SELECT * FROM Books WHERE Title LIKE 'A%';

-- 7 Find all the orders for a particular book.The result must be sorted based ON the order date
SELECT `Date`,Title, BooksQuantity FROM Orders 
JOIN bookOrder 
ON
Orders.orderNumber = bookOrder.orderNumber 
JOIN Books
ON
Books.ISBN = bookOrder.ISBN
AND 
Books.Title = "The Kite Runner" 
ORDER BY Orders.`Date`;