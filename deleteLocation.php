<?php
require_once 'classes/Location.php';
require_once 'classes/LocationTableGateway.php';
require_once 'classes/Connection.php';


if (!isset($_GET['venue_id'])) {
    die("Illegal request");
}
$venue_id = $_GET['venue_id'];

$connection = Connection::getInstance();

$gateway = new LocationTableGateway($connection);

$gateway->delete($venue_id);

header('Location: viewLocations.php');