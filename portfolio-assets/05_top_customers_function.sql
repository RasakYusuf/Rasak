-- Create a function to return Top N Customers by Purchase Amount
CREATE FUNCTION dbo.TopCustomer (@Year INT, @TopN INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@TopN) c.CustomerID, c.CustomerName, SUM(GrossAmount) AS PurchaseAmount
    FROM Equipment_Transaction E
    INNER JOIN Customer c ON E.CustomerID = c.CustomerID
    WHERE YEAR(TransDate) = @Year
    GROUP BY c.CustomerID, c.CustomerName
    ORDER BY SUM(GrossAmount) DESC
)
GO

-- Example usage
SELECT * FROM dbo.TopCustomer(2019, 10)
GO