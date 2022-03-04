create table if not exists ubriders (
	id int not null unique primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	gender varchar(50),
	joined_date date,
	ip_address varchar(20),
	country varchar(50),
	phone_number varchar(50),
	dob date,
	avatar varchar(100),
	payment_type varchar(6),
	payment_account varchar(50)
);

create table if not exists ubproviders(
	id int not null unique primary key,
	driver_name varchar(50),
	joined_date date,
	gender varchar(50),
	known_languages varchar(50),
	current_cab_id int,
	phone_number varchar(50),
	licence_no varchar(50)
);

-- create table if not exists rider_saved_locations (
-- 	id int not null,
--     rider_id int not null,
--     saved_location_address varchar(150) not null
-- );

