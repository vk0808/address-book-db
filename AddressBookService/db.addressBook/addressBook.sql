-- uc-1

-- To Create a database
CREATE DATABASE address_book

-- To see the DB created
EXEC sp_databases
--SELECT * FROM sys.databases;

-- To go to the database created
USE address_book

---------------------------------------------------------------

-- uc-2
-- To go to the database created
USE address_book

-- To create a table
CREATE TABLE address(
	BookID INT IDENTITY(1, 1) PRIMARY KEY,
	FirstName VARCHAR(255)  NOT NULL,
	LastName VARCHAR(255)  NOT NULL,
	Address VARCHAR(250) NOT NULL,
	City VARCHAR(100) NOT NULL,
	State VARCHAR(100) NOT NULL,
	Zip VARCHAR(6) NOT NULL,
	PhoneNumber VARCHAR(12) NOT NULL,
	Email VARCHAR(100) NOT NULL,
);

---------------------------------------------------------------

-- uc-3
-- To go to the database created
USE address_book

-- To insert into the table created
INSERT INTO address(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email) 
VALUES
('Rahul ','Gowda','2nd cross Ramnagar Nagar','Mysore','Karnataka','580082','8123351458','rahul@gmail.com'),
('Ravi ','Kumar','3nd cross','Bangalore','Karnataka','800078','934747358','ravi@gmail.com'),
('Asha','Kumari','4nd cross Indira Nagar','Bangalore','Karnataka','580003','1234567896','asha@gmail.com'),
('Porvi','Shetty','2nd cross','Mandya','Karnataka','560078','0987654321','porvi@gmail.com'),
('Raja','M','2nd cross Rajaji Nagar','Gadag','Karnataka','570006','0987654321','raja@gmail.com');

---------------------------------------------------------------

-- uc-4
-- To go to the database created
USE address_book

-- Update the record
UPDATE address SET City = 'Trisur', State = 'Kerala'
WHERE FirstName = 'Ravi';

---------------------------------------------------------------

-- uc-5
-- To go to the database created
USE address_book

-- To delete particular records from table
DELETE FROM address WHERE FirstName='Asha'

---------------------------------------------------------------

-- uc-6
-- To go to the database created
USE address_book

-- To retrieve specific records
SELECT FirstName FROM address WHERE City = 'Bangalore' OR State = 'Karnataka';

---------------------------------------------------------------

-- uc-7
-- To go to the database created
USE address_book

-- To retrieve count of specific records
SELECT COUNT(FirstName) AS CountByCityState FROM address WHERE City = 'Bangalore' AND State = 'Karnataka';

---------------------------------------------------------------

-- uc-8
-- To go to the database created
USE address_book

-- To retrieve specific records in order
SELECT * FROM address WHERE City = 'Bangalore' ORDER BY FirstName;

---------------------------------------------------------------

-- uc-9
-- To go to the database created
USE address_book

-- To alter table by adding new columns
ALTER TABLE address ADD BookName VARCHAR(20), BookType VARCHAR(10);

-- To update table
UPDATE address SET BookName='Book1', BookType='Friends' WHERE FirstName='Rahul' OR FirstName='Ravi';
UPDATE address SET BookName='Book2', BookType='Family' WHERE FirstName='Porvi';
UPDATE address SET BookName='Book3', BookType='Profession' WHERE FirstName='Raja';

---------------------------------------------------------------

-- uc-10
-- To go to the database created
USE address_book

-- To retrieve count of specific records
SELECT COUNT(BookType) AS AddressCount, BookType FROM address WHERE BookType='Friends' GROUP BY BookType;
SELECT COUNT(BookType) AS AddressCount, BookType FROM address WHERE BookType='Family' GROUP BY BookType;
SELECT COUNT(BookType) AS AddressCount, BookType FROM address WHERE BookType='Profession' GROUP BY BookType;

---------------------------------------------------------------

-- uc-11
-- To go to the database created
USE address_book

-- To insert into the table created
INSERT INTO address(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email, BookName, BookType) 
VALUES
('Anand','Kumar','#22 !st Cross','Tinsukia','Assam',785575,'8748892361','anand@gmail.com','Book2','Family'),
('Anand','Kumar','#22 !st Cross','Tinsukia','Assam',785575,'8748892361','anand@gmail.com','Book1','Friends');

---------------------------------------------------------------

-- uc-12
-- To go to the database created
USE address_book

-- To create table
CREATE TABLE Person
(
	PersonID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Email VARCHAR(50),
	PhoneNumber VARCHAR(50),
);

CREATE TABLE Addresses
(
	AddressID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	PersonID INT FOREIGN KEY REFERENCES Person(PersonID),
	City VARCHAR(50),
	State VARCHAR(50),
	Zip INT,
);

CREATE TABLE BookTypes
(
	BookID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	BookName VARCHAR(50),
	BookType VARCHAR(50),
);

CREATE TABLE Person_AddressBook
(
	PersonID INT FOREIGN KEY REFERENCES Person(PersonID),
	BookID INT FOREIGN KEY REFERENCES BookTypes(BookID)
);


---------------------------------------------------------------

-- uc-13
-- To go to the database created
USE address_book

-- To insert into the table Person created
INSERT INTO Person
VALUES
('Ragu','ram','ragu@gmail.com','1234567893'),
('Ravi','gowda','ravi@gmail.com','8934567893');

SELECT * FROM Person;

-- To insert into the table Addresses created
INSERT INTO Addresses
VALUES
(1, 'Bangalore','Karnataka',560078),
(2, 'Mandya','Karnataka',580068);

SELECT * FROM Addresses;

-- To insert into the table BookTypes created
INSERT INTO BookTypes
VALUES
('Book1','Freinds'),
('Book2','Family'),
('Book3','Profession');

SELECT * FROM BookTypes;

-- To insert into the table Person_AddressBook created
INSERT INTO Person_AddressBook
VALUES
(1,2),
(2,3);

SELECT * FROM Person_AddressBook;

-- uc-6
SELECT p.FirstName AS "Name",  a.City FROM Person p INNER JOIN Addresses a ON p.PersonID=a.PersonID WHERE a.City='Bangalore';
-- uc-7
SELECT a.City,COUNT(City) AS 'CityCount' FROM Addresses a INNER JOIN Person p ON p.PersonID=a.PersonID GROUP BY City;
-- uc-8
SELECT a.State, COUNT(State) AS 'StateCount' FROM Addresses a INNER JOIN Person p ON p.PersonID=a.PersonID GROUP BY State;
-- uc-10
SELECT p.FirstName, a.City FROM Person p INNER JOIN Addresses a ON p.PersonID=a.PersonID WHERE City='Bangalore' ORDER BY (FirstName);