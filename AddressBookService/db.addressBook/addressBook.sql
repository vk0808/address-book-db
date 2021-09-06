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
('Rahul ','Gowda','2nd cros Rajaji Nagar','Banglore','Karnataka','58082','8123351458','rahul@gmail.com'),
('Ravi ','Kumar','3nd cros Jaya Nagar','Banglore','Gujarat','587682','934747358','ravi@gmail.com'),
('Asha','Kumari','4nd cros Indira Nagar','Banglore','MH','80534','1234567896','asha@gmail.com'),
('Porvi','Shetty','2nd cros Rajaji Nagar','Banglore','Andra','80453','0987654321','porvi@gmail.com'),
('Raja','M','2nd cros Rajaji Nagar','Gadag','Andra','80453','0987654321','raja@gmail.com');


