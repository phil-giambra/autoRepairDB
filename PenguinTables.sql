Use penguin

CREATE TABLE customer (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [firstName] VARCHAR(20) NOT NULL,
 [lastName] VARCHAR(20) NOT NULL,
 [address] VARCHAR(200) NULL,
 [mobile] VARCHAR(15) NOT NULL,
 [email] VARCHAR(50) NULL)

CREATE TABLE employee (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [firstName] VARCHAR(20) NOT NULL,
 [lastName] VARCHAR(20) NOT NULL,
 [address] VARCHAR(200) NOT NULL,
 [mobile] VARCHAR(15) NOT NULL,
 [email] VARCHAR(50) NULL,
 [position] VARCHAR(20) NOT NULL,
 [employmentDate] int,
 [activeStatus] VARCHAR(20) NOT NULL)

 CREATE TABLE vehicle (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [VIN] VARCHAR(50) NOT NULL,
 [licensePlate] VARCHAR(20) NOT NULL,
 [model] VARCHAR(20) NOT NULL,
 [manufacturer] VARCHAR(20) NULL,
 [year] int,
 [color] VARCHAR(20) NOT NULL,
 [customerid] [int] FOREIGN KEY REFERENCES customer(id))

 CREATE TABLE repairSchedule (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [scheduleDate] VARCHAR(20) NOT NULL,
 [timeFrom] VARCHAR(20) NOT NULL,
 [timeTo] VARCHAR(20) NULL,
 [plannedRepair] VARCHAR(200) NOT NULL,
 [actualRepair] VARCHAR(50) NULL,
 [employeeid] [int] FOREIGN KEY REFERENCES employee(id))

 CREATE TABLE  repairTasks (
 [id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
 [taskName] VARCHAR(50) NOT NULL,
 [taskDescription] VARCHAR(200) NULL,
 [duration] VARCHAR(20) NULL,
 [taskPrice] int,
 [scheduleid] [int] FOREIGN KEY REFERENCES repairSchedule(id))