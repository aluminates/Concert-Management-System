CREATE TABLE ticket_booking_header(
	booking_id VARCHAR(20) NOT NULL,
	concert_id VARCHAR(20) NOT NULL,
	cust_id VARCHAR(20) NOT NULL,
	total_amount FLOAT DEFAULT 0,
	discount FLOAT DEFAULT 0,
	discount_amount FLOAT DEFAULT 0,
	tax FLOAT DEFAULT 0,
	tax_amount FLOAT DEFAULT 0,
	net_amount FLOAT DEFAULT 0,
	CHECK (discount>=0 AND tax>=0 AND discount_amount>=0 AND tax_amount>=0),
	CHECK (total_amount>=0 AND net_amount>=0), 
	PRIMARY KEY (booking_id),
	FOREIGN KEY (concert_id) REFERENCES concert(concert_id) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON UPDATE CASCADE ON DELETE NO ACTION
);