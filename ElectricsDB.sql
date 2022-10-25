CREATE DATABASE ElectricsDB
GO

USE ElectricsDB
GO

CREATE TABLE Services
(
	id INT IDENTITY PRIMARY KEY,
	serviceName NVARCHAR (50) NOT NULL,
	decription NVARCHAR (200) NULL,
	servicePicture NVARCHAR NULL
)
GO

ALTER TABLE Services
ALTER COLUMN servicePicture NVARCHAR (200) NULL
GO

CREATE TABLE Designation
(
	id INT IDENTITY PRIMARY KEY,
	desigName NVARCHAR (50) NOT NULL
)
GO

CREATE TABLE Seller
(
	sellerId INT IDENTITY PRIMARY KEY,
	sellerName NVARCHAR (50) NOT NULL,
	sellerAddress NVARCHAR (100) NOT NULL,
	dob DATE NOT NULL,
	desigId INT REFERENCES Designation (id) NOT NULL,
	sellMobile NVARCHAR (14) NOT NULL,
	sellEmail NVARCHAR (60) NULL,
	sellPicture NVARCHAR (200) NULL
)
GO

CREATE TABLE Buyer
(
	buyerId INT IDENTITY PRIMARY KEY,
	buyerName NVARCHAR (50) NOT NULL,
	buyerAddress NVARCHAR (100) NOT NULL,
	buyerMobile NVARCHAR (14) NOT NULL,
	buyerEmail NVARCHAR (60) NULL
)
GO

CREATE TABLE MakeOrder
(
	orderId INT IDENTITY,
	orderName NVARCHAR (70) NOT NULL,
	buyerId INT REFERENCES Buyer (buyerId),
	serviceId INT REFERENCES Services (id),
	sellerId INT REFERENCES Seller (sellerId),
	price MONEY NOT NULL,
	isActive BIT NULL,
	PRIMARY KEY (buyerId,serviceId,sellerId)
)
GO

