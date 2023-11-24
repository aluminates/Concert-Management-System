<?php
require_once 'classes/Event.php';
require_once 'classes/EventTableGateway.php';
require_once 'classes/Connection.php';
require_once 'validateEvents.php';

$formdata = array();
$errors = array();

validateEvents(INPUT_POST, $formdata, $errors);

if (empty($errors)) {
    $concert_name = $formdata['Concert Name'];
    $concert_id = $formdata['Concert ID'];    
    $venue_id = $formdata['Venue ID'];
    $date_of_concert = $formdata['Date of Concert'];
    $start_time = $formdata['Start Time'];
    $end_time = $formdata['End Time'];

    $concert = new Event(-1, $concert_name, $concert_id, $venue_id, $date_of_concert, $start_time, $end_time);

    $connection = Connection::getInstance();

    $gateway = new EventTableGateway($connection);

    $concert_id = $gateway->insert($concert);

    header('Location: viewEvents.php');
}
else {
    require 'createEventForm.php';
}