--Daily revenue: How much money did we make today?
select TodaysRevenue = sum(TotalPrice), day = c.PurchaseDate
from CoffeeKiosk c
group by c.PurchaseDate
order by c.PurchaseDate desc

--Top products: What are the top 5 products by sales volume or revenue in the last month?
select top 5 AmountSold = count(c.PurchaseItem), Revenue = sum(c.TotalPrice), c.PurchaseItem
from CoffeeKiosk c
where c.PurchaseDate between datefromparts(year(getdate()), month(getdate()) - 1, day(getdate())) and datefromparts(year(getdate()), month(getdate()), day(getdate())) 
group by c.PurchaseItem
order by count(c.PurchaseItem) desc, sum(c.TotalPrice) desc


--Payment reconciliation: How much came in by cash vs card each day?
select  Sum = sum(c.TotalPrice), c.PaymentMethod
from CoffeeKiosk c
group by c.PaymentMethod




