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

