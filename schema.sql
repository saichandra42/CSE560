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

create table if not exists cab(
	id int not null unique primary key,
    registration_no varchar(50) not null unique,
    cab_brand varchar(50) not null,
    model varchar(50) not null,
	min_rate numeric(6,3) not null
)