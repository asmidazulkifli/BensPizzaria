


--DASHBOARD 1 - Order Activity
--Requirement - Item name, Item Price, Quantity, Customer Name, Delivery Address
--Data needed - total orders, total sales, total items, average order value, sales by category, top selling items, orders by hour, sales by hour, orders by address, orders by delivery/pick up


SELECT 
[dbo].[orders].[order_id],
[dbo].[item].[item_price],
[dbo].[orders].[quantity],
[dbo].[item].[item_cat],
[dbo].[item].[item_name],
[dbo].[orders].created_at,
DATEPART(HOUR, ([dbo].[orders].created_at)) AS created_hour,
[dbo].[address].[delivery_address1],
[dbo].[address].[delivery_address2],
[dbo].[address].[delivery_city],
[dbo].[address].[delivery_zipcode],
CONCAT([dbo].[address].[delivery_address1], ', ',[dbo].[address].[delivery_city],', ',[dbo].[address].[delivery_zipcode],', ', 'United States') AS full_address,
[dbo].[orders].[delivery]
FROM [dbo].[orders]
LEFT JOIN [dbo].[item] ON [dbo].[orders].item_id = [dbo].[item].item_id
LEFT JOIN [dbo].[address] ON [dbo].[orders].add_id = [dbo].[address].add_id

--cant use the HOUR function. Alternative is DATEPART(hour,dbo.orderd.created_at)
--full_address column is created for map chart purpose in Power BI