<?php
class Event {
    private $concert_id;
    private $venue_id;
    private $concert_name;    
    private $date_of_concert;
    private $start_time;
    private $end_time;
    
    
    public function __construct($concert_id, $venue_id, $concert_name, $date_of_concert, $start_time, $end_time) {
        $this->concert_id = $concert_id;
        $this->venue_id = $venue_id;
        $this->concert_name = $concert_name;
        $this->date_of_concert = $date_of_concert;
        $this->start_time = $start_time;
        $this->end_time = $end_time;
    }
    
    public function getconcertId() { return $this->concert_id; }
    public function getvenueId() { return $this->venue_id; }
    public function getconcertName() { return $this->concert_name; }
    public function getdateofConcert() { return $this->date_of_concert; }
    public function getStartTime() { return $this->start_time; }
    public function getEndTime() { return $this->end_time; }
}
?>