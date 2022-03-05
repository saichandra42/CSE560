# Number of riders -
select * from Rider;

# Number of providers -
select * from Provider;

# Number of cabs -
select * from Cab;

# Number of countries where we have riders
select * from Rider;

# Number of countries where we have providers -
select count(distinct(country)) from Provider;