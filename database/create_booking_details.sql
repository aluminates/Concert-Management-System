CREATE TABLE ticket_booking_details(
	seq_no INT NOT NULL AUTO_INCREMENT,
	booking_id VARCHAR(20) NOT NULL,
	ticketType_id VARCHAR(30) NOT NULL,
	tickets_bought INT,
	price FLOAT DEFAULT 0,
	amount FLOAT DEFAULT 0,
	CHECK (price>=0 AND amount>=0 AND tickets_bought>0),
	PRIMARY KEY (seq_no, booking_id),
	FOREIGN KEY (booking_id) REFERENCES ticket_booking_header(booking_id) ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (ticketType_id) REFERENCES ticket_type(ticketType_id) ON UPDATE CASCADE ON DELETE NO ACTION
);