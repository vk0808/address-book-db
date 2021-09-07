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