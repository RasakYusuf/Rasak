 SELECT country,StateProvince,Class, count(*) as TotalTransaction, sum(orderqty) TotalQty 
 FROM PurchaseTrans
 GROUP BY ROLLUP  (Country,StateProvince,Class)
 ORDER BY country 

 SELECT country,StateProvince,Class, count(*) as TotalTransaction, sum(orderqty) TotalQty 
 FROM PurchaseTrans
 GROUP BY CUBE  (Country,StateProvince,Class)
 ORDER BY country

 SELECT country,StateProvince,Class, count(*) as TotalTransaction, sum(orderqty) TotalQty from PurchaseTrans
 GROUP BY GROUPING SETS (Country,StateProvince,Class)
 ORDER BY country
 
 CREATE DATABASE [K2A Fleets]
 USE [K2A Fleets]
 CREATE TABLE Float_Category
 (
  FloatCategoryID INT IDENTITY(1,1),
  FloatRate FLOAT,
  FloatExceedQty FLOAT,
  FloatExceedRate FLOAT
  CONSTRAINT Float_Category_pk PRIMARY KEY (FloatCategoryID)
)
 
 INSERT INTO Float_Category(FloatRate,FloatExceedQty,FloatExceedRate)
 VALUES(0.4,15,0.7),
       (0.1,15,0.6),
	    (0.2,50,0.75),
		(0.24,68,0.9),
		(0.12,100,1.8)

CREATE TABLE Equipment
(
 EquipmentID INT,
 EquipmentName VARCHAR(255),
 UnitPrice DECIMAL(12,2),
 DiscountPercent FLOAT,
 FloatCategoryID INT
 CONSTRAINT Equipment_pk PRIMARY KEY(EquipmentID)
 CONSTRAINT Float_Category_fk FOREIGN KEY (FloatCategoryID) REFERENCES Float_Category (FloatCategoryID)
)

Create Table Equipment
(
 EquipmentID int identity (1,1) primary key,
 EquipmentName varchar(255),
 UnitPrice decimal(12,2),
 DiscountPercent float,
 FloatCategoryID int foreign key references Float_Category(FloatCategoryID)
)

select * from Equipment
insert into Equipment(EquipmentName,UnitPrice,DiscountPercent,FloatCategoryID)
Values('Cup -Lock System of Shuttering – 3.2 M high',122.50,0.015,1),
      ( 'Steel Props – 4.2 M High',100,0.02,1),
	  ( 'Steel shuttering plates – 3 ft x 2 ft',1000.50,0.05,1),
	  ( 'Steel section Girders – 8ft to 12 ft' ,1700.00,0.01,1),
	  ( 'Steel pipes for scaffolding',15000.00,0.08,1),
	  ( 'Telescopic Girders',200,0.4,1),
	  ( 'Tower Crane',233,0.14,1),
	  ( 'Tractor mounted Crane' ,105,0.4,1),
	  ( 'Concrete batching plant' ,1325.70,0.015,1),
	  ( 'Mobile batching plant' ,99.87,0.011,1),
	  ( 'Concrete Pump (Greaves – 40 cum/hr)',1500.50,0.095,1),
	  ( 'Tremix machine set with trowel & floater',700.69,0.15,1),
	  ( 'Concrete mixers',120,0.15,1),
	  ( 'D.G. Set – 82.KVA' ,12.50,0.15,1),
	  ( 'Vibrators (Electrical)',200.99,0.001,1),
	  ( 'Vibrators (Petrol)',4100.90,0.03,1),
	  ( 'Stone cutting machine (Platform type)',1200.56,0.09,1),
	  ( 'Stone cutting machine (hand type)' ,1780,0.0094,1),
	  ( 'Groove cutting machine',122.50,0.5,1),
	  ( 'Builder’sÂ Hoist with winch',122.50,0.5,1),
	  ( 'Bar Bending & cutting machine' ,122.50,0.5,1),
	  ( 'Truck' ,122.50,0.5,1),
	  ( 'Air Compressor',122.50,0.5,1),
	  ( 'Road Roller',122.50,0.5,1),
	  ( 'Vibro-Roller',122.50,0.5,1),
	  ( 'Tipper – Tata' ,122.50,0.5,1),
	  ( 'Excavator – ACE' ,122.50,0.5,1),
	  ( 'Tractor with trolly – 40 HP',122.50,0.5,1),
	  ( 'Water pump',122.50,0.5,1),
	  ( 'Cutter Hitachi – Model CM 45',122.50,0.5,1),
	  ( 'Welding Set – Aircooled',122.50,0.5,1),
	  ( 'Drilling Machine Bosch – GSB – 16' ,122.50,0.5,1),
	  ( 'Mud pump – GEC – 1 HP 2 HP',122.50,0.5,1),
	  ( 'Floor Grinding machine – 2 HP' ,122.50,0.5,1),
	  ( 'Earth Compactor – 7.5 HP motor',122.50,0.5,1),
	  ( 'CGI Sheets – 10′, 12′ Long' ,122.50,0.5,1)

Create table Customer 
     (
	  CustomerID int identity (1,1),
      CustomerName varchar(255),
	  Category varchar(255),
	  PrimaryContact varchar(255),
	  ReferenceNo varchar(255),
	  PaymentDays int,
	  PostalCode int
	  constraint customer_pk primary key (customerID)
     )	 


insert into Customer(CustomerName,Category,PrimaryContact,ReferenceNo,PaymentDays,PostalCode)
values('A Datum Corporation','Novelty Goods Supplier','Reio Kabin','AA20384',14,46077),
       ('Woodgrove Bank','Financial Services Supplier','Hubert Helms','28034202',7,94101),
	   ('Consolidated Messenger','Courier','Kerstin Parn','209340283',30,94101),
	   ('Litware Inc.','Packaging Supplier','Elias Myllari','BC0280982',30,95245),
	   ('Humongous Insurance','Insurance Services Supplier','Madelaine Cartier','82420938',14,37770),
	   ('Graphic Design Institute','Novelty Goods Supplier','Penny Buck','8803922',14,64847),
	   ('Fabrikam Inc.','Clothing Supplier','Bill Lawson','293092',30,40351),
	   ('The Phone Company','Novelty Goods Supplier','Hai Dam','237408032',30,56732),
	   ('Trey Research','Marketing Services Supplier','Donald Jones','82304822',7,57543),
	   ('Lucerne Publishing','Novelty Goods Supplier','Prem Prabhu','JQ082304802',30,37659),
	   ('Contoso Ltd.','Novelty Goods Supplier','Hanna Mihhailov','B2084020',7,98253),
	   ('Nod Publishers','Novelty Goods Supplier','Marcos Costa','GL08029802',7,27906),
	   ('Northwind Electric Cars','Toy Supplier','Eliza Soderberg','ML0300202',30,7860),
	   ('A Datum Corporation','Novelty Goods Supplier','Reio Kabin','AA20384',14,46077),
	   ('Contoso Ltd.','Novelty Goods Supplier','Hanna Mihhailov','B2084020',7,98253),
	   ('Consolidated Messenger','Courier','Kerstin Parn','209340283',30,94101),
	   ('Fabrikam Inc.','Clothing Supplier','Bill Lawson','293092',30,40351),
	   ('Graphic Design Institute','Novelty Goods Supplier','Penny Buck','8803922',14,64847),
	   ('Humongous Insurance','Insurance Services Supplier','Madelaine Cartier','82420938',14,37770),
	   ('Litware Inc.','Packaging Supplier','Elias Myllari','BC0280982',30,95245),
	   ('Lucerne Publishing','Novelty Goods Supplier','Prem Prabhu','JQ082304802',30,37659),
	   ('Nod Publishers','Novelty Goods Supplier','Marcos Costa','GL08029802',7,27906),
	   ('Northwind Electric Cars','Toy Supplier','Eliza Soderberg','ML0300202',30,7860),
	   ('Trey Research','Marketing Services Supplier','Donald Jones','82304822',7,57543),
	   ('The Phone Company','Novelty Goods Supplier','Hai Dam','237408032',30,56732),
	   ('Woodgrove Bank','Financial Services Supplier','Hubert Helms','28034202',7,94101),
	   ('Consolidated Messenger','Courier Services Supplier','Kerstin Parn','209340283',30,94101)

select * from Customer

Declare @StartDate Date='2015-01-01'
Declare @EndDate Date='2019-05-31'
Declare @TransDate date
Declare @MaxCounter int=1000000
Declare @StartCounter int=1
Declare @CustomerID int
Declare @EquipmentID int
Declare @Quantity float
Declare @GrossAmount decimal(12,2)
Declare @DiscountAmount decimal(12,2)
Declare @FloatRateAmount decimal(12,2)
Declare @FloatExceededAmount decimal(12,2)
Declare @PostalVariationAmount decimal(12,2)
/*create table Equipment_Transaction
    (
	  TransID int identity(1,1),
	  TransDate datetime,
	  CustomerID int,
	  EquipmentID int,
	  Quantity float,
	  GrossAmount decimal(12,2),
	  DiscountAmount decimal(12,2),
	  FloatRateAmount decimal(12,2),
	  FloatExceededAmount decimal(12,2),
	  PostalVariationAmount decimal(12,2)
	  Constraint Equipment_Transaction_pk primary key(TransID),
	  constraint CustomerID_fk foreign key (customerID) references Customer(CustomerID),
	  Constraint EquipmentID_fk foreign key (EquipmentID) references Equipment(EquipmentID)
)*/
While @StartCounter<=@MaxCounter
Begin
  Select @TransDate= (select (Dateadd(day,convert(int,Rand()*(  datediff(day,@StartDate,@EndDate)))+1,@StartDate) ))
  Select @CustomerID=(select convert(int,rand()*(select max(CustomerID) from Customer)) + (select min(customerID) from Customer))
  Select @EquipmentID=(select convert(int, rand()*(select max(EquipmentID) from Equipment)) + (select min(EquipmentID) from Equipment))
  select @Quantity=round((select convert(float,rand()*1000)),2)
  select @GrossAmount=(SELECT UnitPrice FROM Equipment WHERE EquipmentID = @EquipmentId)*@Quantity
  select @DiscountAmount=(select DiscountPercent from Equipment where EquipmentID = @EquipmentId)*@Quantity
  select @FloatRateAmount=case
                              when @Quantity >100 and @Quantity<150 then @Quantity*FloatRate
							  Else '0'
							  End
							  from Float_Category FC
							  inner join Equipment E on fc.FloatCategoryID=E.FloatCategoryID
							  
  select @FloatExceededAmount=case
                              when @Quantity>150 then FloatExceedRate*@Quantity
							  Else '0'
							  End
							  from Float_Category FC
							  inner join Equipment E on fc.FloatCategoryID=E.FloatCategoryID
							  
  select @PostalVariationAmount= case
                                          when PostalCode>=7000 and PostalCode<=50000 then @Quantity*0.002
										  when PostalCode>=50001 and PostalCode<=70000 then @Quantity*0.050
										  when PostalCode>=70001 and PostalCode<=90000 then @Quantity*0.062
										  Else @Quantity*0.0078
										  End
										  from Customer
										 
										   
insert into Equipment_Transaction(TransDate,CustomerID,EquipmentID,Quantity,GrossAmount,DiscountAmount,FloatRateAmount,FloatExceededAmount,PostalVariationAmount)
select @TransDate,@CustomerID,@EquipmentID,@Quantity,@GrossAmount,@DiscountAmount,@FloatRateAmount,@FloatExceededAmount,@PostalVariationAmount

  select @StartCounter=@StartCounter+1
End



Truncate table equipment_transaction
select * from equipment_transaction

create function dbo.TopCustomer (@Year int, @TopN int)
RETURNS TABLE
AS
RETURN
  (
   SELECT Top (@TopN)c.CustomerID,c.CustomerName,sum(GrossAmount) as PurchaseAmount from Equipment_Transaction E
   inner join Customer c on E.CustomerID=c.CustomerID
   where year(TransDate)=@Year
   Group by c.CustomerID,c.CustomerName
   order by sum(GrossAmount) desc
   
  )
 
  
   select * from dbo.TopCustomer (2019,10)

  select EquipmentName,sum(GrossAmount)as PurchaseAmount,year(TransDate) TransYear  from Equipment_Transaction ET
  inner join Equipment E on E.EquipmentID=ET.EquipmentID
  where EquipmentName in (' Cup -Lock System of Shuttering – 3.2 M high','Bar Bending & cutting machine')
  group by EquipmentName,year(TransDate)

  select EquipmentName,sum(unitprice*Quantity) as Total,year(TransDate) TransYear  from Equipment_Transaction ET
  inner join Equipment E on E.EquipmentID=ET.EquipmentID
  where equipmentName in (' Cup -Lock System of Shuttering – 3.2 M high','Bar Bending & cutting machine')
  group by EquipmentName,year(TransDate) 

 /* Dataset and Summary data are needed for testing S & M Software
 */
use [K2A Fleets]

SELECT e.EquipmentName as Equipment,
     format( SUM(case when year(t.Transdate) = 2015 then grossamount end),'C') as '2015',
	 format( SUM(case when year(t.Transdate) = 2016 then grossamount end),'C') as '2016',
	 format( SUM(case when year(t.Transdate) = 2017 then grossamount end),'C') as '2017',
	 format( SUM(case when year(t.Transdate) = 2018 then grossamount end),'C') as '2018',
	 format( SUM(case when year(t.Transdate) = 2019 then grossamount end),'C') as '2019'
    FROM 
       Equipment_Transaction t
    INNER JOIN 
        Equipment e ON t.EquipmentID = e.EquipmentID
Group BY EquipmentName;


---2nd Method
SELECT EquipmentName, 
       FORMAT([2015],'C') AS [2015], 
       FORMAT([2016],'C') AS [2016], 
       FORMAT([2017],'C') AS [2017], 
       FORMAT([2018],'C') AS [2018], 
       FORMAT([2019],'C') AS [2019]
FROM 
    (SELECT e.EquipmentName, 
            YEAR(t.Transdate) AS TransYear, 
            t.GrossAmount 
     FROM Equipment_Transaction T
     INNER JOIN Equipment E ON T.EquipmentID = E.EquipmentID) D
PIVOT 
    (SUM(GrossAmount) FOR TransYear IN ([2015],[2016],[2017],[2018],[2019])) G;
