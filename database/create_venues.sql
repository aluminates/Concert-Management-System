CREATE TABLE venues(
	venue_id VARCHAR(20) NOT NULL, 
    venue_name VARCHAR(30),
	capacity INT,
    city VARCHAR(30),
    street_name VARCHAR(30),
	CHECK (capacity>=0),
	PRIMARY KEY (venue_id)
);