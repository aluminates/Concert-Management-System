<?php
require_once 'classes/Location.php';
require_once 'classes/LocationTableGateway.php';
require_once 'classes/EventTableGateway.php';
require_once 'classes/Connection.php';


if (!isset($_GET['venue_id'])) {
    die("Illegal request");
}
$id = $_GET['venue_id'];

$connection = Connection::getInstance();
$gateway = new LocationTableGateway($connection);
$eventGateway = new EventTableGateway($connection);

$statement = $gateway->getLocationsById($venue_id);
$events = $eventGateway->getEventsByLocationId($venue_id);

$row = $statement->fetch(PDO::FETCH_ASSOC);
if (!$row) {
    die("Illegal request");
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <?php require 'utils/styles.php'; ?>
        <?php require 'utils/scripts.php'; ?>
    </head>
    <body>
        <?php require 'utils/header.php'; ?>
        <div class = "content">
            <div class = "container">
                <?php
                if (isset($message)) {
                    echo '<p>' . $message . '</p>';
                }
                ?>
                <table class = "table table-hover">
                    <thead>
                        <!--table label-->
                        <!--this will only show the detail of a location with specific ID chosen by the user-->
                        <tr>
                            <th>Venue Name</th>
                            <th>Venue ID</th>
                            <th>Capacity</th>
                            <th>City</th>
                            <th>Street Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--table contents-->
                        <?php
                        echo '<tr>';
                        echo '<td>' . $row['venue_id'] . '</td>';
                        echo '<td>' . $row['venue_name'] . '</td>';
                        echo '<td>' . $row['capacity'] . '</td>';
                        echo '<td>' . $row['city'] . '</td>';
                        echo '<td>' . $row['street_name'] . '</td>';
                        echo '<td>'
                        . '<a href="editLocationForm.php?id=' . $row['venue_id'] . '">Edit</a> '
                        . '<a class="delete" href="deleteLocation.php?id=' . $row['venue_id'] . '">Delete</a> '
                        . '</td>';
                        echo '</tr>';
                        ?>
                    </tbody>
                </table>
                <?php
                if ($events->rowCount() > 0) {
                ?>
                <h2>Concerts at this Venue</h2>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Concert ID</th>
                            <th>Venue ID</th>
                            <th>Concert Name</th>                    
                            <th>Date of Concert</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $row = $concert->fetch(PDO::FETCH_ASSOC);
                        while ($row) {
                            echo '<tr>';
                            echo '<td>' . $row['concert_id'] . '</td>';
                            echo '<td>' . $row['venue_id'] . '</td>';
                            echo '<td>' . $row['concert_name'] . '</td>';                    
                            echo '<td>' . $row['date_of_concert'] . '</td>';
                            echo '<td>' . $row['start_time'] . '</td>';
                            echo '<td>' . $row['end_time'] . '</td>';
                            echo '<td>'
                            . '<a href="viewLocation.php?id='.$row['venue_id'].'">'.$row['venue_name'].'</a> '
                            . '</td>';
                            echo '<td>'
                            . '<a href="viewEvent.php?id='.$row['concert_id'].'">View</a> '
                            . '<a class="delete" href="deleteEvent.php?id='.$row['concert_id'].'">Delete</a> '
                            . '</td>';
                            echo '</tr>';  

                            $row = $events->fetch(PDO::FETCH_ASSOC);
                        }
                        ?>
                    </tbody>
                </table>
                <?php
                } else {
                ?>
                <p>There are no concerts for this venue.</p>
                <?php
                }
                ?>
                <a class="btn btn-default" href="viewLocations.php"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
            </div>
        </div>
    </body>
</html>
