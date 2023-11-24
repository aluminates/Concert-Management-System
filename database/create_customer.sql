CREATE TABLE customer(
	cust_id VARCHAR(20) NOT NULL,
	cust_name VARCHAR(20),
	email VARCHAR(50),
	phone_no VARCHAR(12),
    street_name VARCHAR(30),
	city VARCHAR(30),
    DOB date,
    age INT(5),
	PRIMARY KEY (cust_id)
);