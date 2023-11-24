<?php
class Location {
    private $venue_id;
    private $venue_name;    
    private $capacity;
    private $city;
    private $street_name;

    
    public function __construct($venue_id, $venue_name, $capacity, $city, $street_name) {
        $this->id = $venue_id;
        $this->Name = $venue_name;
        $this->Capacity = $capacity;
        $this->City = $city;
        $this->Street_name = $street_name;
    }
    
    public function getvenueId() { return $this->id; }
    public function getvenueName() { return $this->Name; }
    public function getCapacity() { return $this->Capacity; }
    public function getCity() { return $this->City; }
    public function getStreetname() { return $this->Street_name; }
}
?>