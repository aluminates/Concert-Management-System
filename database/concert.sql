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

INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST1', 'Richa Agarwal', 'richaa@abc.com', '9218756349', 'Eastwood Road', 'Bangalore', '2001-10-19', '21');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST2', 'Ankita Rajan', 'ankitar@abc.com',  '9400275418', 'Milan Road', 'Mumbai', '1995-11-10', '28');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST3', 'Sunita Raval', 'sunitaraval@xyz.com', '9491230333', 'Riddhipur Road', 'Guwahati', '2006-02-29','17');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST4', 'Naina Prabhu', 'nainaprabhu@rst.com', '8103065876', 'Vikhroli Road', 'Bhubaneshwar', '2000-09-01', '23');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST5', 'John Issac', 'johnissac@def.com', '8723197324', 'Doe Street', 'Kolkata', '1995-06-06', '28');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST6', 'Ayushi Savant', 's.ayushi@lmn.com', '9821780772', 'Dhirajgarh Marg', 'New Delhi', '2004-03-13', '19');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST7', 'Sakshi Dixit', 'sakshid@def.com', '8743107654', 'SV Road', 'Mysore', '1996-01-31','27');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST8', 'Akhila Mohan', 'akhilamohan@rst.com', '8451850673', 'Aasth Chowk', 'Lucknow', '2008-04-15','15');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST9', 'Mona Shankar', 'mona.s@lmn.com', '6706272897', 'Sahil Nagar', 'Bangalore', '1998-08-04','25');
INSERT INTO customer (cust_id, cust_name, email, phone_no, street_name, city, DOB, age) VALUES ('CUST10', 'Nandini Roy', 'nandiniroy@xyz.com', '7294654110', 'Doe Street', 'Chennai', '2007-05-25','16');

CREATE TABLE ticket_type(
    ticketType_id VARCHAR(20) NOT NULL,
    concert_id VARCHAR(20) NOT NULL,
    price FLOAT,
    tickets_available INT,
    CHECK (price >= 0 AND tickets_available >= 0),
    PRIMARY KEY (ticketType_id, concert_id),
    FOREIGN KEY (concert_id) REFERENCES concert(concert_id) ON UPDATE CASCADE ON DELETE NO ACTION
);

INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T1', 'C1', '1000', '6000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T2', 'C1', '1800', '5200');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T3', 'C1', '2500', '3000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T4', 'C1', '4000', '800');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T1', 'C2', '800', '3000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T1', 'C3', '500', '3000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T2', 'C3', '1000', '1500');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T3', 'C3', '1500', '500');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T1', 'C4', '800', '2500');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T2', 'C4', '1200', '2000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T1', 'C5', '400', '400');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T2', 'C5', '1200', '3600');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T3', 'C5', '2000', '2000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T1', 'C7', '1000', '7000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T2', 'C7', '2800', '6000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T3', 'C7', '3500', '3200');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T4', 'C7', '5000', '1800');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T1', 'C8', '1500', '5000');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T2', 'C8', '3200', '3200');
INSERT INTO ticket_type (ticketType_id, concert_id, price, tickets_available) VALUES ('T3', 'C8', '5000', '1800');

CREATE TABLE venues(
	venue_id VARCHAR(20) NOT NULL, 
    venue_name VARCHAR(30),
	capacity INT,
    city VARCHAR(30),
    street_name VARCHAR(30),
	CHECK (capacity>=0),
	PRIMARY KEY (venue_id)
);

INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V1', 'Phoenix Market City', '5000', 'Whitefield', 'Bangalore');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V2', 'Mahalaxmi Race Course', '6000', 'Keshavrao Khadye Marg', 'Mumbai');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V3', 'Vagator Beach', '20000', 'Bardez', 'Goa');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V4', 'Boomrang BarXsocial', '35000', 'Koramangala', 'Bangalore');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V5', 'Bhartiya Mall', '10000', 'Thanisandra Main Road', 'Bangalore');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V6', 'Nexus Shantiniketan', '15000', 'Whitefield', 'Bangalore');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V7', 'Inner Circle Ground', '15000', 'Whitefield', 'Bangalore');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V8', 'R2 Grounds', '3000', 'Bandra East', 'Mumbai');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V9', 'T.M.C Ground', '18000', 'Hiranandani Estate,Thane West', 'Thane');
INSERT INTO venues (venue_id, venue_name, capacity, street_name, city) VALUES ('V10', 'SVP Stadium', '160000', 'Worli', 'Mumbai');

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

INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B1', 'C3', 'CUST6', 10, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B2', 'C2', 'CUST3', 20, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B3', 'C5', 'CUST8', 15, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B4', 'C1', 'CUST5', 5, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B5', 'C7', 'CUST1', 20, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B6', 'C3', 'CUST10', 15, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B7', 'C1', 'CUST2', 10, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B8', 'C5', 'CUST9', 5, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B9', 'C1', 'CUST4', 10, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B10', 'C8', 'CUST7', 15, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B11', 'C4', 'CUST1', 20, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B12', 'C8', 'CUST2', 5, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B13', 'C2', 'CUST3', 15, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B14', 'C7', 'CUST4', 20, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B15', 'C4', 'CUST6', 10, 5);
INSERT INTO ticket_booking_header (booking_id, concert_id, cust_id, discount, tax) VALUES ('B16', 'C7', 'CUST8', 5, 5);

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

INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B1', 'T2', 2);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B1', 'T3', 1);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B2', 'T1', 4);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B3', 'T1', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B3', 'T2', 2);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B4', 'T4', 1);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B4', 'T3', 2);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B4', 'T2', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B5', 'T1', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B5', 'T2', 2);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B6', 'T1', 6);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B7', 'T3', 2);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B7', 'T4', 1);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B7', 'T1', 4);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B7', 'T2', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B8', 'T3', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B9', 'T3', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B9', 'T1', 5);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B10', 'T1', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B10', 'T2', 2);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B10', 'T3', 1);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B11', 'T2', 4);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B12', 'T3', 3);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B13', 'T1', 5);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B14', 'T2', 1);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B14', 'T1', 6);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B14', 'T3', 1);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B15', 'T2', 4);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B16', 'T3', 2);
INSERT INTO ticket_booking_details (booking_id, ticketType_id, tickets_bought) VALUES ('B16', 'T4', 3);










CREATE TABLE concert (
    concert_id VARCHAR(20) NOT NULL,
    venue_id VARCHAR(20),
    concert_name VARCHAR(30),
    date_of_concert DATE,
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (concert_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id) ON UPDATE CASCADE ON DELETE NO ACTION
);


INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C1', 'V7', 'Papon Live in Concert', '2024-11-25', '18:00:00', '22:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C2', 'V8', 'Ed Sheeran: +-=/* Tour', '2024-03-16', '18:30:00', '23:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C3', 'V1', 'Sunburn', '2024-12-28', '18:30:00', '23:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C4', 'V1', 'Super Sunday Bollywood Night', '2024-11-19', '17:00:00', '21:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C5', 'V2', 'Ronan Keating', '2024-01-18', '19:00:00', '23:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C6', 'V7', 'Whitefield Music Festival', '2024-02-25', '18:00:00', '22:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C7', 'V9', 'Neeti Mohan', '2024-12-16', '17:00:00', '21:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C8', 'V5', 'Sunburn Arena Ft. Dimitri Vegas & Like Mike-Mumbai', '2024-11-24', '18:30:00', '23:00:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C9', 'V5', 'Sonu Nigam', '2024-12-02', '17:30:00', '20:30:00');
INSERT INTO concert (concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) VALUES ('C10', 'V6', 'KING', '2024-12-24', '19:30:00', '23:30:00');

DELIMITER //

CREATE TRIGGER check_concert_date
BEFORE INSERT ON concert
FOR EACH ROW
BEGIN
    IF NEW.date_of_concert <= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid concert date';
    END IF;
END //

DELIMITER ;


DELIMITER $$
/* Trigger updates attribute 'total_amount' by adding all 'amount' attributes of particular booking id from 'ticket_booking_details' */
/* Trigger then updates 'discount_amount', 'tax_amount' and 'net_amount'*/
CREATE TRIGGER ticket_amount 
AFTER INSERT ON ticket_booking_details 
FOR EACH ROW
BEGIN
	UPDATE ticket_booking_header AS a
	SET a.total_amount = a.total_amount + new.amount, 
		a.discount_amount = a.total_amount * (a.discount/100), 
		a.tax_amount = (a.total_amount - a.discount_amount) * (a.tax/100),
		a.net_amount = a.total_amount - a.discount_amount + a.tax_amount
	WHERE a.booking_id=new.booking_id;
END;$$

/* Trigger sets attribute 'price'  from tables 'ticket_types' and sets attribute 'amount'*/
CREATE TRIGGER get_price
BEFORE INSERT ON ticket_booking_details
FOR EACH ROW
BEGIN
	DECLARE V1 VARCHAR(20);
	DECLARE V2 INT;
	SELECT event_id INTO V1 FROM ticket_booking_header WHERE booking_id = new.booking_id;
	SELECT price INTO V2 FROM ticket_type WHERE ticketType_id = new.ticketType_id AND event_id = V1;
	SET new.price=V2;
	SET new.amount = new.price * new.tickets_bought;
END;$$
DELIMITER ;
