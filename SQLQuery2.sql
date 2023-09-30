CREATE OR ALTER PROCEDURE summary_order_status
(@StatusID int) AS
BEGIN
	SELECT 
		a.OrderID,
		b.CustomerName,
		c.ProductName,
		a.Quantity,
		e.StatusOrder
	FROM FactSalesOrder a
	JOIN DimCustomer b ON a.CustomerID = b.CustomerID
	JOIN DimProduct c ON a.ProductID = c.ProductID
	JOIN DimStatusOrder e ON a.StatusID = e.StatusID
	WHERE a.StatusID = @StatusID
END

EXEC summary_order_status @StatusID = 1