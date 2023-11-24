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


