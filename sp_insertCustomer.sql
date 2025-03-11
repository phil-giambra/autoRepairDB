USE [penguin]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertVehicle]    Script Date: 4/16/2022 10:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_insertCustomer] (
 @customerFirstName VARCHAR(20),
 @customerLastName VARCHAR(20),
 @customerAddress VARCHAR(200),
 @customerMobile VARCHAR(15),
 @customerEmail VARCHAR(50))
AS
BEGIN

DECLARE @CustomerCount INT
SET @CustomerCount = (SELECT COUNT(*) FROM customer WHERE mobile = @customerMobile)
DECLARE @customerid INT

IF @CustomerCount = 1 
BEGIN
 SET @customerid = (SELECT id FROM customer WHERE mobile = @customerMobile)
END
ELSE
BEGIN
INSERT INTO customer (firstName,lastName,address,mobile, email ) 
	VALUES (@customerFirstName, @customerLastName, @customerAddress, @customerMobile, @customerEmail )
END

END
