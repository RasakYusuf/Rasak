-- Generate transaction data using WHILE loop
DECLARE @StartDate DATE = '2015-01-01'
DECLARE @EndDate DATE = '2019-05-31'
DECLARE @TransDate DATE
DECLARE @MaxCounter INT = 1000000
DECLARE @StartCounter INT = 1
DECLARE @CustomerID INT
DECLARE @EquipmentID INT
DECLARE @Quantity FLOAT
DECLARE @GrossAmount DECIMAL(12,2)
DECLARE @DiscountAmount DECIMAL(12,2)
DECLARE @FloatRateAmount DECIMAL(12,2)
DECLARE @FloatExceededAmount DECIMAL(12,2)
DECLARE @PostalVariationAmount DECIMAL(12,2)

WHILE @StartCounter <= @MaxCounter
BEGIN
  SELECT @TransDate = DATEADD(DAY, CONVERT(INT, RAND() * DATEDIFF(DAY, @StartDate, @EndDate)), @StartDate)
  SELECT @CustomerID = (SELECT TOP 1 CustomerID FROM Customer ORDER BY NEWID())
  SELECT @EquipmentID = (SELECT TOP 1 EquipmentID FROM Equipment ORDER BY NEWID())
  SELECT @Quantity = ROUND(CONVERT(FLOAT, RAND() * 1000), 2)
  SELECT @GrossAmount = (SELECT UnitPrice FROM Equipment WHERE EquipmentID = @EquipmentID) * @Quantity
  SELECT @DiscountAmount = (SELECT DiscountPercent FROM Equipment WHERE EquipmentID = @EquipmentID) * @Quantity

  SELECT @FloatRateAmount = CASE
                              WHEN @Quantity > 100 AND @Quantity <= 150 THEN @Quantity * fc.FloatRate
                              ELSE 0
                            END
  FROM Equipment e
  INNER JOIN Float_Category fc ON e.FloatCategoryID = fc.FloatCategoryID
  WHERE e.EquipmentID = @EquipmentID

  SELECT @FloatExceededAmount = CASE
                                  WHEN @Quantity > 150 THEN fc.FloatExceedRate * @Quantity
                                  ELSE 0
                                END
  FROM Equipment e
  INNER JOIN Float_Category fc ON e.FloatCategoryID = fc.FloatCategoryID
  WHERE e.EquipmentID = @EquipmentID

  SELECT @PostalVariationAmount = CASE
                                    WHEN PostalCode BETWEEN 7000 AND 50000 THEN @Quantity * 0.002
                                    WHEN PostalCode BETWEEN 50001 AND 70000 THEN @Quantity * 0.050
                                    WHEN PostalCode BETWEEN 70001 AND 90000 THEN @Quantity * 0.062
                                    ELSE @Quantity * 0.0078
                                  END
  FROM Customer WHERE CustomerID = @CustomerID

  INSERT INTO Equipment_Transaction(TransDate, CustomerID, EquipmentID, Quantity, GrossAmount, DiscountAmount, FloatRateAmount, FloatExceededAmount, PostalVariationAmount)
  SELECT @TransDate, @CustomerID, @EquipmentID, @Quantity, @GrossAmount, @DiscountAmount, @FloatRateAmount, @FloatExceededAmount, @PostalVariationAmount

  SET @StartCounter = @StartCounter + 1
END
GO