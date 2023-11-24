<?php
require_once 'Location.php';

class LocationTableGateway {

    private $connect;
    
    public function __construct($c) {
        $this->connect = $c;
    }
    
    // execute a query to get all locations
    public function getLocations() {
        $sqlQuery = "SELECT * FROM venues";
        
        $statement = $this->connect->prepare($sqlQuery);
        $status = $statement->execute();
        
        if (!$status) {
            die("Could not retrieve venue details!");
        }
        
        return $statement;
    }
    
    // execute a query to get a location with the specified id
    public function getLocationsById($venue_id) {
        $sqlQuery = "SELECT * FROM venues WHERE venue_id = :id";
        
        $statement = $this->connect->prepare($sqlQuery);
        $params = array(
            "venue_id" => $venue_id
        );
        
        $status = $statement->execute($params);
        
        if (!$status) {
            die("Could not retrieve venue ID!");
        }
        
        return $statement;
    }
    
    //execute a insert sql statement that inserts data taken from user to a database.
    public function insert($p) {
        $sql = "INSERT INTO venues(venue_id, venue_name, capacity, city, street_name) " .
                "VALUES (:venue_id, :venue_name, :capacity, :city, :street_name)";
        
        $statement = $this->connect->prepare($sql);
        $params = array(
            "id"              => $p->getvenueId(),
            "Name"           => $p->getvenueName(),            
            "Capacity"      => $p->getCapacity(),
            "City"      => $p->getCity(),
            "StreetName"      => $p->getStreetname(),
        );
        
        echo "<pre>";
        print_r($p);
        print_r($params);
        echo "</pre>";
        
        $status = $statement->execute($params);
        
        
        if (!$status) {
            die("Could not insert venue");
        }
        
        $venue_id = $this->connect->lastInsertId();
        
        return $venue_id;
    }
    
    public function update($p) {
        
        $sql = "UPDATE venues SET " .
                "venue_name = :venue_name, " . 
                "venue_id = :venue_id, " .                
                "capacity = :capacity, " .
                "city = :city, " .
                "street_name = :street_name, " .
                " WHERE venue_id = :venue_id";
        
        $statement = $this->connect->prepare($sql);
        $params = array(
            "venue_name"              => $p->getVenuename(),
            "venue_id"           => $p->getvenueId(),            
            "capacity"      => $p->getCapacity(),
            "city"      => $p->getCity(),
            "street_name"      => $p->getStreetname()
        );
        
        echo "<pre>";
        print_r($p);
        print_r($params);
        print_r($statement);
        echo "</pre>";
        
        $status = $statement->execute($params);
        
        if (!$status) {
            die("Could not update venue details!");
        }
    }
    
    public function delete($id) {
        $sql = "DELETE FROM venues WHERE venue_id = :id";
        
        $statement = $this->connect->prepare($sql);
        $params = array(
            "id" => $id
        );
        $status = $statement->execute($params);
        
        if (!$status) {
            die("Could not delete venue!");
        }
    }    

}