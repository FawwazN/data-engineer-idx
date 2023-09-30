CREATE DATABASE DWH_Project

USE DWH_Project

CREATE TABLE DimCustomer (
	CustomerID int NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	CustomerName varchar(50) NOT NULL,
	Age int NOT NULL,
	Gender varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	NoHP varchar(50) NOT NULL,
	CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerID)
)

CREATE TABLE DimProduct (
	ProductID int NOT NULL,
	ProductName varchar(255) NOT NULL,
	ProductCategory varchar(255) NOT NULL,
	ProductUnitPrice int NULL,
	CONSTRAINT PK_DimProduct PRIMARY KEY (ProductID)
)

CREATE TABLE DimStatusOrder (
	StatusID int NOT NULL,
	StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar(50) NOT NULL,
	CONSTRAINT PK_DimStatusOrder PRIMARY KEY (StatusID)
)


CREATE TABLE FactSalesOrder (
	OrderID int NOT NULL,
	CustomerID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int NOT NULL,
	OrderDate date NOT NULL,
	CONSTRAINT PK_FactSales PRIMARY KEY (OrderID),
	CONSTRAINT FK_DimCustomer FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
	CONSTRAINT FK_DimProduct FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
	CONSTRAINT FK_DimStatusOrder FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID)
);