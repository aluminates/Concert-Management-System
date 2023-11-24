CREATE TABLE ticket_type(
    ticketType_id VARCHAR(20) NOT NULL,
    concert_id VARCHAR(20) NOT NULL,
    price FLOAT,
    tickets_available INT,
    CHECK (price >= 0 AND tickets_available >= 0),
    PRIMARY KEY (ticketType_id, concert_id),
    FOREIGN KEY (concert_id) REFERENCES concert(concert_id) ON UPDATE CASCADE ON DELETE NO ACTION
);
