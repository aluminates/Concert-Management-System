<?php
require_once 'classes/Event.php';
require_once 'classes/EventTableGateway.php';
require_once 'classes/Connection.php';


if (!isset($_GET['concert_id'])) {
    die("Illegal request");
}
$id = $_GET['concert_id'];

$connection = Connection::getInstance();

$gateway = new EventTableGateway($connection);

$gateway->delete($concert_id);

header('Location: viewEvents.php');