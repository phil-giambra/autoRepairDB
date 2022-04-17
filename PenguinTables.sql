Use PenguinDatabase

CREATE TABLE customer (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [firstName] NVARCHAR(20),
 [lastName] NVARCHAR(20),
 [address] NVARCHAR(200),
 [mobile] NVARCHAR(15),
 [email] NVARCHAR(50))

CREATE TABLE employee (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [firstName] NVARCHAR(20),
 [lastName] NVARCHAR(20),
 [address] NVARCHAR(200),
 [mobile] NVARCHAR(15),
 [email] NVARCHAR(50),
 [position] NVARCHAR(20),
 [employmentDate] int,
 [activeStatus] NVARCHAR(20))

 CREATE TABLE vehicle (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [VIN] NVARCHAR(50),
 [licensePlate] NVARCHAR(20),
 [model] NVARCHAR(20),
 [manufacturer] NVARCHAR(20),
 [year] int,
 [color] NVARCHAR(20),
 [customerid] [int] FOREIGN KEY REFERENCES customer(id))

 CREATE TABLE repairSchedule (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [scheduleDate] int,
 [timeFrom] int,
 [timeTo] NVARCHAR(20),
 [plannedRepair] NVARCHAR(200),
 [actualRepair] NVARCHAR(50),
 [employeeid] [int] FOREIGN KEY REFERENCES employee(id))

 CREATE TABLE  repairTasks (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [taskName] NVARCHAR(50),
 [taskDescription] NVARCHAR(200),
 [duration] NVARCHAR(20),
 [taskPrice] int,
 [scheduleid] [int] FOREIGN KEY REFERENCES repairSchedule(id))