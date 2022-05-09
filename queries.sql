

CREATE DATABASE UbLyft;
USE UbLyft;

# W - Q1 - Find riders who made more than 100 rides in the application
SELECT Trip.rider_id, Rider.first_name, Rider.last_name, COUNT(Trip.id) 
from Trip, Rider 
WHERE Rider.id = Trip.rider_id 
GROUP BY Trip.rider_id 
HAVING count(Trip.id) > 100 
ORDER BY count(Trip.id) DESC;

####################

-- select rider.id, first_name, last_name,count(*)  from rider, trip where rider.id in (
-- select a.rider_id from Trip a group by a.rider_id having count(*) > 50)
-- and rider.id = trip.rider_id
-- group by rider.id, first_name, last_name;

-- SELECT Trip.rider_id, Rider.first_name, Rider.last_name, COUNT(Trip.id)
-- from Trip INNER JOIN Rider on Rider.id = Trip.rider_id
-- GROUP BY Trip.rider_id 
-- HAVING count(Trip.id) > 50 
-- ORDER BY count(Trip.id) DESC; 

-- Find Providers who made more than 100 rides in the application
-- SELECT Trip.rider_id, Provider.driver_name, Provider.phone_number, COUNT(Trip.id) 
-- from Trip, Provider 
-- WHERE Provider.id = Trip.rider_id 
-- GROUP BY Trip.rider_id 
-- HAVING count(Trip.id) > 50 
-- ORDER BY count(Trip.id) DESC;


####################


# W - Q2 - Find Riders with highest ratings
SELECT Provider.driver_name, AVG(Trip.rider_rating) 
from Trip, Provider 
WHERE Provider.id = Trip.provider_id
GROUP BY Trip.provider_id 
ORDER By AVG(Trip.rider_rating) DESC
LIMIT 1;

-- select  Provider.driver_name, AVG(Trip.rider_rating) from rider where id in (
-- select rider_id from Trip where rider_rating = ( 
-- select max(Trip.rider_rating) from Trip))
-- LIMIT 10;

####################


# W - Q3 --- Most used mode of payment
SELECT Payment.payment_type, COUNT(Payment.id) 
FROM Payment
GROUP BY Payment.payment_type
ORDER BY COUNT(Payment.id) DESC
LIMIT 1;

####################

# W - Q4 monthly earnings
SELECT month(time_of_payment) as mon, year(time_of_payment) as yyyy, sum(total_amount) 
from Payment
group by 1,2
order by sum(total_amount) desc;


#################### 


# W - Q5 Quaterly earnings
select sum(earnings) total_earning from (
	SELECT month(time_of_payment) as mon, year(time_of_payment) as yyyy, sum(total_amount) earnings
	from Payment
	group by 1,2
	HAVING mon = '01' OR mon = '02' OR mon = '03'
	order by sum(total_amount) desc)
    as monthly_earnings;
    
    ####################

#Q6 Top 100 people with how spent the highest amount on the application
SELECT Trip.rider_id, Rider.first_name, SUM(Payment.total_amount)
From Payment, Trip, Rider
WHERE Payment.id = Trip.payment_id AND Trip.rider_id = Rider.id
GROUP BY Trip.rider_id
ORDER BY SUM(Payment.total_amount) DESC
LIMIT 100;

-- SELECT Trip.rider_id, Rider.first_name, SUM(Payment.total_amount)
-- FROM TRIP INNER JOIN RIDER on Trip.rider_id = Rider.id
-- INNER JOIN PAYMENT ON Payment.id = Trip.payment_id
-- GROUP BY Trip.rider_id
-- ORDER BY SUM(Payment.total_amount) DESC
-- LIMIT 100;


####################



#OPT
SELECT Trip.rider_id, Rider.first_name, Rider.last_name, COUNT(Trip.id) 
from Trip, Rider 
WHERE Rider.id = Trip.rider_id
and first_name = 'Abbie' 
GROUP BY Trip.rider_id 
HAVING count(Trip.id) > 50 
ORDER BY count(Trip.id) DESC;

create index idx_name on Rider(first_name);
drop index idx_name on Rider;


####################

#OPT 

SELECT Trip.rider_id, Rider.*
from Trip, Provider, Rider  
WHERE Provider.id = Trip.provider_id
and Rider.id = Trip.rider_id
GROUP BY Trip.rider_id
ORDER By AVG(Trip.rider_rating) DESC
LIMIT 1;



select * from rider where id in (
select rider_id from Trip 
group by rider_id
having AVG(Trip.rider_rating) >= ALL(select AVG(Trip.rider_rating) from trip group by rider_id));