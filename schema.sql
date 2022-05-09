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
	id INT NOT NULL UNIQUE PRIMARY KEY,
	payment_type VARCHAR(7),
	base_fare INT,
	surge_fare INT,
	total_amount INT,
	time_of_payment DATE,
	payment_account_number VARCHAR(50),
	bank_transaction_id VARCHAR(50)
);


create table Trip (
	id INT,
	rider_id INT,
	provider_id INT,
	payment_id INT,
	rider_rating INT,
	rider_feedback TEXT,
	provider_feedback TEXT,
	pickup_location_lat VARCHAR(50),
	pickup_location_long VARCHAR(50),
	drop_location_lat VARCHAR(50),
	drop_location_long VARCHAR(50),
    FOREIGN KEY (rider_id) REFERENCES Rider(id),
    FOREIGN KEY (provider_id) REFERENCES Provider(id),
    FOREIGN KEY (payment_id) REFERENCES Payment(id)
);