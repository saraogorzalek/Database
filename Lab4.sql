-- Sara Ogorzalek, February 8 2017, Lab 4

select city
from agents
where aid in (select aid
			  from orders
			  where cid = 'c006'
              )
order by city ASC;

select distinct pid
from Orders
where aid in (select aid
              from orders
              where cid in (select cid
                            from customers
                            where city = 'Kyoto'
                            )
              )
order by pid DESC;

select cid, name
from customers
where cid not in (select cid
                  from orders
                  where aid = 'a01'
                  );

select cid
from customers
where cid in (select cid
              from orders
              where pid ='p01')
AND cid in (select cid
            from orders
            where pid = 'p07');
            
select distinct pid
from orders
where cid not in (select cid
                  from orders
                  where aid = 'a08'
                  )
order by pid DESC;

select name, discount, city
from customers
where cid in (select cid
              from orders
              where aid in (select aid
                            from agents
                            where city = 'Tokyo' or city = 'New York'
                            )
              ); 
              
select *
from customers
where discount in (select discount
                   from customers
                   where city = 'Duluth' or city = 'London'
                   );

-- Check constraints are used to limit the value range that is placed in a column. They insure data integrity and create rules for the database.
-- The advantage of putting this sort of thing inside the database is to insure that the correct data is being entered in those fields. 
-- An example of good uses of check constraints are if a column must only include integers greater than zero, such as a price column. 
-- A bad example is putting a check constraint on a postal code for a state field for an address. Even though there are fifty states, the postal service
-- recognizes more postal codes including other territories and military bases. 
