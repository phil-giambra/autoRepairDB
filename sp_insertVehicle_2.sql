USE [penguin]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertVehicle]    Script Date: 4/16/2022 10:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_insertVehicle_2] (
 @vehicleVIN VARCHAR(50),
 @vehicleLicensePlate VARCHAR(20),
 @vehicleModel VARCHAR(50),
 @vehicleManufacturer VARCHAR(50),
 @vehicleYear int,
 @vehicleColor VARCHAR(50),
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

INSERT INTO vehicle (VIN,licensePlate,model,manufacturer,year,color, customerid)
     VALUES (@vehicleVIN,@vehicleLicensePlate,@vehicleModel,@vehicleManufacturer,@vehicleYear,@vehicleColor, @customerid) 

END
