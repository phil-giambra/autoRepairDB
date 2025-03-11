Use penguin

CREATE TABLE customer (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [firstName] NVARCHAR(20) NOT NULL,
 [lastName] NVARCHAR(20) NOT NULL,
 [address] NVARCHAR(200) NULL,
 [mobile] NVARCHAR(15) NOT NULL,
 [email] NVARCHAR(50) NULL)

CREATE TABLE employee (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [firstName] NVARCHAR(20) NOT NULL,
 [lastName] NVARCHAR(20) NOT NULL,
 [address] NVARCHAR(200) NOT NULL,
 [mobile] NVARCHAR(15) NOT NULL,
 [email] NVARCHAR(50) NULL,
 [position] NVARCHAR(20) NOT NULL,
 [employmentDate] int,
 [activeStatus] NVARCHAR(20) NOT NULL)

 CREATE TABLE vehicle (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [VIN] NVARCHAR(50) NOT NULL,
 [licensePlate] NVARCHAR(20) NOT NULL,
 [model] NVARCHAR(20) NOT NULL,
 [manufacturer] NVARCHAR(20) NULL,
 [year] int,
 [color] NVARCHAR(20) NOT NULL,
 [customerid] [int] FOREIGN KEY REFERENCES customer(id))

 CREATE TABLE repairSchedule (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [scheduleDate] NVARCHAR(20) NOT NULL,
 [timeFrom] NVARCHAR(20) NOT NULL,
 [timeTo] NVARCHAR(20) NULL,
 [plannedRepair] NVARCHAR(200) NOT NULL,
 [actualRepair] NVARCHAR(50) NULL,
 [employeeid] [int] FOREIGN KEY REFERENCES employee(id))

 CREATE TABLE  repairTasks (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [taskName] NVARCHAR(50) NOT NULL,
 [taskDescription] NVARCHAR(200) NULL,
 [duration] NVARCHAR(20) NULL,
 [taskPrice] int,
 [scheduleid] [int] FOREIGN KEY REFERENCES repairSchedule(id))