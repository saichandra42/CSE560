CREATE TABLE IF NOT EXISTS Rider (
    id INT NOT NULL UNIQUE PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    gender VARCHAR(50),
    joined_date DATE,
    ip_address VARCHAR(20),
    country VARCHAR(50),
    phone_number VARCHAR(50),
    dob DATE,
    avatar VARCHAR(100),
    payment_type VARCHAR(6),
    payment_account VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Cab (
    id INT NOT NULL UNIQUE PRIMARY KEY,
    registration_no VARCHAR(50) NOT NULL UNIQUE,
    cab_brand VARCHAR(50),
    country VARCHAR(50) not null,
    model VARCHAR(50),
    min_rate NUMERIC(6,3) NOT NULL
);

CREATE TABLE IF NOT EXISTS Provider (
    id INT NOT NULL UNIQUE PRIMARY KEY,
    driver_name VARCHAR(50),
    joined_date DATE,
    gender VARCHAR(50),
    known_languages VARCHAR(50),
    current_cab_id INT,
    phone_number VARCHAR(50),
    licence_no VARCHAR(50),
    FOREIGN KEY (current_cab_id) REFERENCES Cab(id)
);

CREATE TABLE IF NOT EXISTS Payment (
	id int not null unique primary key,
    payment_type VARCHAR(6) not null,
    base_fare float not null,
    surge_fare float not null,
    total_amount float not null,
    time_of_payment varchar(10) not null,
    payment_account_number VARCHAR(20) not null,
	bank_transaction_id VARCHAR(50) not null
);

CREATE TABLE IF NOT EXISTS Trip (
	id int not null unique primary key,
    rider_id int not null,
    provider_id int not null,
    cab_id int not null,
    payment_id int not null,
    rider_rating int not null,
    rider_feedback varchar(500),
    provider_feedback varchar(500),
	pickup_location_lat varchar(50) not null,
	pickup_location_long varchar(50) not null,
    drop_location_lat varchar(50) not null,
    drop_location_long varchar(50) not null,
    FOREIGN KEY (rider_id) REFERENCES Rider(id),
    FOREIGN KEY (provider_id) REFERENCES Provider(id),
    FOREIGN KEY (payment_id) REFERENCES Payment(id),
    FOREIGN KEY (cab_id) REFERENCES Cab(id)
);