-- Insert data into Float_Category
INSERT INTO Float_Category(FloatRate, FloatExceedQty, FloatExceedRate)
VALUES (0.4,15,0.7),
       (0.1,15,0.6),
       (0.2,50,0.75),
       (0.24,68,0.9),
       (0.12,100,1.8)
GO

-- Insert data into Equipment (partial list for demonstration)
INSERT INTO Equipment(EquipmentID, EquipmentName, UnitPrice, DiscountPercent, FloatCategoryID)
VALUES(1, 'Cup -Lock System of Shuttering – 3.2 M high', 122.50, 0.015, 1),
      (2, 'Steel Props – 4.2 M High', 100, 0.02, 1),
      (3, 'Steel shuttering plates – 3 ft x 2 ft', 1000.50, 0.05, 1),
      (4, 'Steel section Girders – 8ft to 12 ft' ,1700.00, 0.01, 1)
-- Add remaining rows as needed
GO

-- Insert data into Customer (partial list for demonstration)
INSERT INTO Customer(CustomerName, Category, PrimaryContact, ReferenceNo, PaymentDays, PostalCode)
VALUES('A Datum Corporation','Novelty Goods Supplier','Reio Kabin','AA20384',14,46077),
      ('Woodgrove Bank','Financial Services Supplier','Hubert Helms','28034202',7,94101),
      ('Consolidated Messenger','Courier','Kerstin Parn','209340283',30,94101)
-- Add remaining rows as needed
GO