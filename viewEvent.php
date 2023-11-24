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

$statement = $gateway->getEventsById($id);

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
                    echo '<p>'.$message.'</p>';
                }
                ?>
                <table class = "table table-hover">
                    <thead><!--table labels-->
                        <tr>
                            <th>Concert ID</th>
                            <th>Venue ID</th>
                            <th>Concert Name</th>                    
                            <th>Date of Concert</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                        </tr>
                    </thead>
                    <tbody><!--table contents, pulled from database-->
                        <?php
                            echo '<tr>';
                            echo '<td>' . $row['concert_id'] . '</td>';
                            echo '<td>' . $row['venue_id'] . '</td>';
                            echo '<td>' . $row['concert_name'] . '</td>';                    
                            echo '<td>' . $row['date_of_concert'] . '</td>';
                            echo '<td>' . $row['start_time'] . '</td>';
                            echo '<td>' . $row['end_time'] . '</td>';
                            echo '<td>'
                        . '<a class="delete" href="deleteEvent.php?id='.$row['concert_id'].'">Delete</a> '
                        . '</td>';
                        echo '</tr>';  
                        ?>
                    </tbody>
                </table>
                <a class="btn btn-default" href="viewEvents.php"><span class="glyphicon glyphicon-circle-arrow-left"></span> Back</a>
            </div>
        </div>
    </body>
</html>
