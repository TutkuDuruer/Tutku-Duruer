--select * from table
--offset start rows
--fetch first rows

select film_id,title from film
order by title
fetch first  row only

select film_id,title from film
order by title
fetch first 5 row only

select film_id,title
from film
order by title
offset 5 rows
fetch first 5 row only


select customer_id,rental_id,return_date from rental
where customer_id in (2,3,4,5)  -- 
order by return_date desc


select customer_id,rental_id,return_date from rental
where customer_id not in (2,3,4,5)  --  ( = x or = y or = z ) '   <> x and <> y and <>z
order by return_date desc

select customer_id,rental_id,return_date from rental
where customer_id <>2 and customer_id <>3 and customer_id <>4 and customer_id <>5    
order by customer_id 


select * from payment
where amount between 8 and 9

select * from payment
where amount not between 8 and 9

select payment_date from payment
where payment_date between  '2007-02-07' and '2007-02-15'

select first_name,last_name from customer
where first_name  not like 'Jen%'


select first_name,last_name from customer
where first_name   like '%en%'


select first_name,last_name from customer
where first_name   like '%en'


select first_name,last_name from customer
where first_name   like '__er%'

select first_name,last_name from customer
where first_name   like '%__an'

select first_name from customer
where first_name ilike 'bar%'


CREATE TABLE sepet_a(
	a int primary key,
	fruit_a varchar(100) not null
);

CREATE TABLE sepet_b(
	b int primary key,
	fruit_b varchar(100) not null
)




select * from sepet_a

select * from sepet_b


insert into sepet_a (a,fruit_a)
values 
(1,'Apple'),
(2,'Orange'),
(3, 'Banana'),
(4, 'Cucumber')


select * from sepet_b;

insert into sepet_b (b,fruit_b)
values
(1,'Orange'),
(2,'Apple'),
(3,'Watermelon'),
(4,'Pear')

select * from sepet_b


select * from sepet_a
inner join sepet_b
on fruit_a = fruit_b

select * from sepet_a
left join sepet_b
on fruit_a = fruit_b




select * from sepet_a
right join sepet_b
on fruit_a = fruit_b



select * from sepet_a
full join sepet_b
on fruit_a = fruit_b


select * from sepet_a
left join sepet_b
on fruit_a = fruit_b
where fruit_b is null


select * from sepet_a
right join sepet_b
on fruit_a = fruit_b
where fruit_a is null


select * from sepet_a
full join sepet_b
on fruit_a = fruit_b
where fruit_a is null or fruit_b is null



select customer.customer_id, first_name,last_name,amount,payment_date from customer
inner join payment 
on  customer.customer_id = payment.customer_id
ORDER BY payment_date


select customer.customer_id, first_name,last_name,amount,payment_date as p_date from customer
inner join payment 
on  customer.customer_id = payment.customer_id
where customer.customer_id = 5



select c.customer_id, first_name,last_name,amount,payment_date from customer c
inner join payment p
on c.customer_id = p.customer_id
where c.customer_id = 5

select c.customer_id, first_name,last_name,amount,payment_date from customer c
inner join payment 
using (customer_id)   --on c.customer_id = p.customer_id

select c.customer_id,c.first_name c_f_n,c.last_name c_l_n,s.first_name s_f_n,s.last_name s_l_n,amount,payment_date from customer c 
inner join payment p 
on c.customer_id = p.customer_id
inner join staff s
on p.staff_id = s.staff_id

select f.film_id,title,inventory_id from film f
left join inventory i
on f.film_id = i.film_id


select title,inventory_id from film f
left join inventory i
on f.film_id = i.film_id


select title,inventory_id from film f
left join inventory i USING (film_id)



select title,inventory_id from film f
full join inventory i
on f.film_id = i.film_id


full_name email adress city country
--	---	-	-	-	-	-	-	-	



select cs.customer_id, cs.first_name || ' ' || cs.last_name as full_name, cs.email,a.address,c.city,cr.country from customer cs
left join address a 
on cs.address_id = a.address_id  --using(address_id)
inner join city c 
on a.city_id = c.city_id  -- using
inner join country cr 
on c.country_id = cr.country_id


select title,l.name,c.name from film f
left join language l
using (language_id)
LEFT JOIN film_category fc
using(film_id)
LEFT join category c 
using (category_id)
















select * from staff

