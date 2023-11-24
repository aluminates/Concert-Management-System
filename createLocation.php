<?php
require_once 'classes/Location.php';
require_once 'classes/LocationTableGateway.php';
require_once 'classes/Connection.php';
require_once 'validateLocation.php';

$formdata = array();
$errors = array();

validateLocation(INPUT_POST, $formdata, $errors);

if (empty($errors)) {
    $venue_id = $formdata['Venue ID'];
    $venue_name = $formdata['Venue Name'];    
    $capacity = $formdata['Capacity'];
    $city = $formdata['City'];
    $street_name = $formdata['Street Name'];

    $venues = new Location(-1, $venue_id, $venue_name, $capacity, $city, $street_name);

    $connection = Connection::getInstance();

    $gateway = new LocationTableGateway($connection);

    $venue_id = $gateway->insert($location);

    header('Location: homeIn.php');
}
else {
    require 'createLocationForm.php';
}