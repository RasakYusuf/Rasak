-- Create database and switch to it
CREATE DATABASE [K2A Fleets]
GO
USE [K2A Fleets]
GO

-- Create Float_Category Table
CREATE TABLE Float_Category
(
  FloatCategoryID INT IDENTITY(1,1),
  FloatRate FLOAT,
  FloatExceedQty FLOAT,
  FloatExceedRate FLOAT,
  CONSTRAINT Float_Category_pk PRIMARY KEY (FloatCategoryID)
)
GO

-- Create Equipment Table
CREATE TABLE Equipment
(
 EquipmentID INT,
 EquipmentName VARCHAR(255),
 UnitPrice DECIMAL(12,2),
 DiscountPercent FLOAT,
 FloatCategoryID INT,
 CONSTRAINT Equipment_pk PRIMARY KEY(EquipmentID),
 CONSTRAINT Float_Category_fk FOREIGN KEY (FloatCategoryID) REFERENCES Float_Category (FloatCategoryID)
)
GO

-- Alternative Equipment Table Format (if needed)
/*
CREATE TABLE Equipment
(
 EquipmentID INT IDENTITY(1,1) PRIMARY KEY,
 EquipmentName VARCHAR(255),
 UnitPrice DECIMAL(12,2),
 DiscountPercent FLOAT,
 FloatCategoryID INT FOREIGN KEY REFERENCES Float_Category(FloatCategoryID)
)
GO
*/

-- Create Customer Table
CREATE TABLE Customer 
(
  CustomerID INT IDENTITY (1,1),
  CustomerName VARCHAR(255),
  Category VARCHAR(255),
  PrimaryContact VARCHAR(255),
  ReferenceNo VARCHAR(255),
  PaymentDays INT,
  PostalCode INT,
  CONSTRAINT customer_pk PRIMARY KEY (CustomerID)
)
GO

-- Create Equipment_Transaction Table
CREATE TABLE Equipment_Transaction
(
  TransID INT IDENTITY(1,1),
  TransDate DATETIME,
  CustomerID INT,
  EquipmentID INT,
  Quantity FLOAT,
  GrossAmount DECIMAL(12,2),
  DiscountAmount DECIMAL(12,2),
  FloatRateAmount DECIMAL(12,2),
  FloatExceededAmount DECIMAL(12,2),
  PostalVariationAmount DECIMAL(12,2),
  CONSTRAINT Equipment_Transaction_pk PRIMARY KEY(TransID),
  CONSTRAINT CustomerID_fk FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT EquipmentID_fk FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
)
GO