-- Sara Ogorzalek, February 15 2017, Lab 5

select a.city
from agents a, orders o
where o.cid = 'c006'
	and  a.aid = o.aid;

select distinct o1.pid -- can join same table with separate aliases
from Orders o
inner join customers c
      on c.cid = o.cid and c.city = 'Kyoto'
full join orders o1
     on o1.aid = o.aid
     where o.ordNumber is not null
     order by o1.pid;
     
select name
from customers
where not cid in (select cid
                  from orders
                  );

select c.name
from customers c
left outer join orders o 
	on c.cid = o.cid
where o.cid is null;

select c.name, a.name
from customers c, agents a, orders o
where a.aid = o.aid
and c.cid= o.cid
and c.city = a.city; 

select c.name, a.name, c.city
from customers c, agents a
where c.city = a.city;

select c.name, c.city
from customers c
where c.city in (select city
                 from products
                 group by city
                 order by count(pid)
                 limit 1
                 );
