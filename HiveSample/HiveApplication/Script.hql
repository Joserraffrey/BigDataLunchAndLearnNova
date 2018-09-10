CREATE DATABASE DBJoselalNova;

CREATE EXTERNAL TABLE IF NOT EXISTS DBJoselalNova.CustomerEXT(
	CustomerID    INT,
	NameStyle     BOOLEAN,
	Title         STRING,
	FirstName     STRING,
	MiddleName    STRING,
	LastName      STRING,
	Suffix        STRING,
	CompanyName   STRING,
	SalesPerson   STRING,
	EmailAddress  STRING,
	Phone         STRING,
	PasswordHash  STRING,
	PasswordSalt  STRING,
	rowguid       STRING,
	ModifiedDate  DATE
)
    COMMENT 'Customer data loaded from Azure SQL Database'
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    location '/user/sshuser/sqlserver_import/customer';

SELECT * FROM DBJoselalNova.CustomerEXT;

CREATE TABLE DBJoselalNova.Customer AS SELECT * FROM DBJoselalNova.CustomerEXT;

SELECT * FROM DBJoselalNova.Customer;


CREATE TABLE DBJoselalNova.CustomerAddressEXT (
	CustomerID    INT,
	AddressID     INT,
	AddressType   STRING,
	AddressLine1  STRING,
	AddressLine2  STRING,
	City          STRING,
	StateProvince STRING,
	CountryRegion STRING,
	PostalCode    STRING
	) 
COMMENT 'Customer Address Details' 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE 
location '/user/sshuser/manually_import/';

SELECT * FROM DBJoselalNova.CustomerAddressEXT