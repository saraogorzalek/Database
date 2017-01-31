-- Sara Ogorzalek, Lab 3, January 31, 2017

select ordNumber, totalUSD
from Orders;

select name, city
from Agents
where name = 'Smith';

select pid, name, priceUSD
from Products
where quantity > 200100;

select name, city
from Customers
where city = 'Duluth'
order by name ASC;

select name
from Agents
where city not in ('New York' , 'Duluth');

select *
from Products
where priceUSD >= 1.00
		and city not in ('Dallas' , 'Duluth');

select *
from Orders
where month = 'Feb'
	or month = 'May';
    
select *
from Orders
where month = 'Feb'
		and totalUSD >= 600;
        
select *
from Orders
where cid = 'c005'