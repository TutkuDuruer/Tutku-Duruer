--subquery
--any
--all
--insert
--update
--identity columns
--we mad filtration ,when we need one more time filtration,we use sub queries
--find the average value of rental duration

select avg(rental_rate) from film

select * from film
where rental_rate >2.98


select title,film_id,rental_rate from film f 
where rental_rate>(
select avg(rental_rate) from film f )

--query1
select inventory.film_id 
from inventory 
inner join rental r
using (inventory_id)
where return_date between '2005-05-29'and'2005-05-30'
--query2
select film_id,title from film f
--combination of query 1 and query 2
select film_id,title from film f --her ikisndede film_id ortak.
where film_id in(select inventory.film_id 
from inventory 
inner join rental r
using (inventory_id)
where return_date between '2005-05-29'and'2005-05-30')

select count(category_id),category_id
from(select title,category_id from film f
inner join  film_category fc
using(film_id)
where category_id=ANY (
select category_id  from category c                   --her ikiside aynı anlamda kullanılır any ve in
where c.name='Action' or c.name='Drama'               --select * from u sub queriyealdıgımız zaman allians vermemiz gerekiyor
)) as k
group by category_id                              -- iki türlü subqueries yapılıyor bunlardan birisi,whereden sonra geliyor
                                                  -- digeri ise fromdan sonra gelebilir.
												  --where'den sonra gelenlerde birsey yapılmaz.
												  --fromdan sonra gelenlerde alians eklemesi yapılır.
												  --where >group by sıralaması ile yapılır

select avg(f.length) from film f
group by f.rating


select film_id,title,length from film f
where length>ALL(select avg(f.length) from film f
group by f.rating)
--film dili,dili yalnızca ingilizce olsun 
--filmilere ait kategoriler 
--title,category name,hours ,language




select f.title,l.name,c.name,f.length as hours from film f
join language l
using(language_id)
join film_category fc
using(film_id)    -- when we make join we look the common coloumn,there is no importmat of order by making join
join category c
using(category_id)
where f.length/60 >1.2


--first we make filtration later we make join
select *from (
select title,name,hours,language_id from (
select * from(
select f.title,f.length/60 as hours,film_id,language_id from film f
) as t
where hours >1.2) as k                   --fromdan sonra bir alt queri açaçgımız zaman as k ,as l giib ifadeler veririz
join film_category fc                 --where i ekledikten sonra ikinci bir
using(film_id)
join category
using(category_id)
) as u 
left join language l
using(language_id)
where l.name='English'

--önce ingilizce tablosuna gidelim daha sonra,sonra joinleyelim.
select f.title,f.film_id
select * from language l
where l.name='English') as u
join film f
using(language_id)
join film_category fc
using(film_id)
join category c
using(category_id)



























