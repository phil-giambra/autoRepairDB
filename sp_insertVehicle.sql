USE [penguin]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertVehicle]    Script Date: 4/16/2022 8:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_insertVehicle] (
 @vehicleVIN VARCHAR(50),
 @customerMobile VARCHAR(15))
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
INSERT INTO customer (mobile) VALUES (@customerMobile)
SET @customerid = @@IDENTITY
END

INSERT INTO vehicle (VIN, customerid)
     VALUES (@vehicleVIN, @customerid) 

END
