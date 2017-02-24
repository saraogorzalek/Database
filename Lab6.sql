-- Sara Ogorzalek, February 22, 2017, Lab 6

-- 1
select name, city
from customers
where city in (select city
               from products
               group by city
               order by COUNT(products.city) DESC
               limit 1
               );
     
-- 2      
select p.name, p.priceUSD
from products p
where p.priceUSD > (select AVG(p.priceUSD)
                   from products p
                   )
order by p.name DESC;

-- 3      
select c.name, o.pid, o.totalUSD
from customers c inner join orders o 
      on c.cid = o.cid
order by o.totalUSD ASC;

-- 4      
select c.name, coalesce(sum(o.totalUSD),0) as "Total Ordered"
from customers c left outer join orders o
      on c.cid = o.cid
group by c.name
order by c.name ASC; 

-- 5      
select c.name, p.name, a.name
from customers c, products p, agents a, orders o
where c.cid = o.cid
      and p.pid = o.pid
      and a.aid = o.aid
      and a.city = 'Newark';
     
-- 6      
select *
from orders o, customers c, products p
where o.cid = c.cid 
      and o.pid = p.pid
      and o.totalUSD != (p.priceUSD * o.qty * ((100 - c.discount) /100))
      and o.totalUSD is not null;
      
-- 7
-- The difference between a left outer join and a right outer join is a left outer join joins all values from the left table with matching values from the right table,
-- and nulls otherwise. A right outer join joins all values from the right table with matching values from the left table and nulls otherwise. 
-- A right outer join is the opposite from a left outer join. 
-- An example of a left outer join is:

select c.name, c.city
from orders o
left outer join customers c
on o.cid = c.cid;

-- This is a combination of the orders and agents tables. The left outer join joined together the values from orders can customers.
-- An example of a right outer join is:

select c.name, c.city
from orders o
right outer join customers c
on o.cid = c.cid; 
-- This is also a combination of the orders and agents tables, however there is one more row including the customer Weyland who did not make an order. 