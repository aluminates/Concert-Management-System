<?php
require_once 'Event.php';

class EventTableGateway {

    private $connect;
    
    public function __construct($c) {
        $this->connect = $c;
    }
    
    public function getConcerts() {
        // execute a query to get all events
        $sqlQuery = "SELECT c.*" .
                    "FROM concert c " .
                    "LEFT JOIN venues v ON c.venue_id = v.venue_id";
        
        $statement = $this->connect->prepare($sqlQuery);
        $status = $statement->execute();
        
        if (!$status) {
            die("Could not retrieve concert details!");
        }
        
        return $statement;
    }
    
    public function getConcertsByVenueId($venue_id) {
        // execute a query to get all events
        $sqlQuery = "SELECT c.* " .
                    "FROM concert c " .
                    "LEFT JOIN venues v ON c.venue_id = v.venue_id " .
                    "WHERE c.venue_id=:venue_id";
        
        $params = array(
            "venue_id" => $venue_id
        );
        $statement = $this->connect->prepare($sqlQuery);
        $status = $statement->execute($params);
        
        if (!$status) {
            die("Could not retrieve concert details!");
        }
        
        return $statement;
    }
    
    public function getConcertsById($concert_id) {
        // execute a query to get an event with the specified id
        $sqlQuery = "SELECT * FROM concert WHERE concert_id = :concert_id";
        
        $statement = $this->connect->prepare($sqlQuery);
        $params = array(
            "concert_id" => $concert_id
        );
        
        $status = $statement->execute($params);
        
        if (!$status) {
            die("Could not retrieve Concert ID!");
        }
        
        return $statement;
    }
    
    public function insert($p) {
        $sql = "INSERT INTO concert(concert_id, venue_id, concert_name, date_of_concert, start_time, end_time) " .
                "VALUES (:concert_id, :venue_id, :concert_name, :date_of_concert, :start_time, :end_time)";
        
        $statement = $this->connect->prepare($sql);
        $params = array(
            "concert_id"      => $p->getconcertId(),
            "venue_id"        => $p->getvenueId(),
            "concert_name"     => $p->getconcertName(),            
            "date_of_concert"  => $p->getdateofConcert(),
            "start_time"         => $p->getStartTime(),
            "end_time"            => $p->getEndTime(),
        );
        
        echo "<pre>";
        print_r($p);
        print_r($params);
        echo "</pre>";
        
        $status = $statement->execute($params);
        
        
        if (!$status) {
            die("Could not insert concert!");
        }
        
        $id = $this->connect->lastInsertId();
        
        return $id;
    }

    public function update($p) {
        $sql = "UPDATE concert SET " .
                "concert_id = :concert_id, " . 
                "venue_id = :venue_id, " . 
                "concert_name = :concert_name, " .               
                "date_of_concert = :date_of_concert, " .
                "start_time = :start_time, " .
                "end_time = :end_time, " ;
        
        $statement = $this->connect->prepare($sql);
        $params = array(
            "concert_id"      => $p->getconcertId(),
            "venue_id"        => $p->getvenueId(),
            "concert_name"     => $p->getconcertName(),            
            "date_of_concert"  => $p->getdateofConcert(),
            "start_time"         => $p->getStartTime(),
            "end_time"            => $p->getEndTime(),
        );
        
        echo "<pre>";
        print_r($p);
        print_r($params);
        print_r($statement);
        echo "</pre>";
        
        $status = $statement->execute($params);
        
        if (!$status) {
            die("Could not update event details");
        }
    }
    
    public function delete($concert_id) {
        $sql = "DELETE FROM concert WHERE concert_id = :concert_id";
        
        $statement = $this->connect->prepare($sql);
        $params = array(
            "concert_id" => $concert_id
        );
        $status = $statement->execute($params);
        
        if (!$status) {
            die("Could not delete event");
        }
    }    

    
}