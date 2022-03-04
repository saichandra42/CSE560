CREATE TABLE IF NOT EXISTS ubriders (
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

CREATE TABLE IF NOT EXISTS ubproviders (
    id INT NOT NULL UNIQUE PRIMARY KEY,
    driver_name VARCHAR(50),
    joined_date DATE,
    gender VARCHAR(50),
    known_languages VARCHAR(50),
    current_cab_id INT,
    phone_number VARCHAR(50),
    licence_no VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS cab (
    id INT NOT NULL UNIQUE PRIMARY KEY,
    registration_no VARCHAR(50) NOT NULL UNIQUE,
    cab_brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    min_rate NUMERIC(6 , 3 ) NOT NULL
);