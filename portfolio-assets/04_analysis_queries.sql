-- Equipment Purchase Summary by Year using Pivot
SELECT EquipmentName, 
       FORMAT([2015],'C') AS [2015], 
       FORMAT([2016],'C') AS [2016], 
       FORMAT([2017],'C') AS [2017], 
       FORMAT([2018],'C') AS [2018], 
       FORMAT([2019],'C') AS [2019]
FROM 
(
    SELECT e.EquipmentName, 
           YEAR(t.TransDate) AS TransYear, 
           t.GrossAmount 
    FROM Equipment_Transaction t
    INNER JOIN Equipment e ON t.EquipmentID = e.EquipmentID
) D
PIVOT 
(
    SUM(GrossAmount) FOR TransYear IN ([2015],[2016],[2017],[2018],[2019])
) G
GO