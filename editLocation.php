<?php
require_once 'classes/Location.php';
require_once 'classes/LocationTableGateway.php';
require_once 'classes/Connection.php';

$venue_id = $_POST['venue_id'];
$venue_name = $_POST['venue_name'];
$capcity = $_POST['capacity'];
$city = $_POST['city'];
$street_name = $_POST['street_name'];

$venues = new Location($venue_id, $venue_name, $capacity, $city, $street_name);

$connection = Connection::getInstance();

$gateway = new LocationTableGateway($connection);

$venue_id = $gateway->update($venues);

header('Location: viewLocations.php');
