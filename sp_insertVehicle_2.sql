USE [penguin]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertVehicle]    Script Date: 4/16/2022 10:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_insertVehicle_2] (
 @vehicleVIN NVARCHAR(50),
 @vehicleLicensePlate NVARCHAR(20),
 @vehicleModel NVARCHAR(50),
 @vehicleManufacturer NVARCHAR(50),
 @vehicleYear int,
 @vehicleColor NVARCHAR(50),
 @customerMobile NVARCHAR(15))
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
