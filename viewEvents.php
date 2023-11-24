<?php
require_once 'utils/functions.php';
require_once 'classes/User.php';
require_once 'classes/Event.php';
require_once 'classes/EventTableGateway.php';
require_once 'classes/Location.php';
require_once 'classes/LocationTableGateway.php';
require_once 'classes/Connection.php';


$connection = Connection::getInstance();
$gateway = new EventTableGateway($connection);

$statement = $gateway->getConcerts();

start_session();

if (!is_logged_in()) {
    header("Location: login_form.php");
}

$user = $_SESSION['user'];
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
                        $row = $statement->fetch(PDO::FETCH_ASSOC);
                        while ($row) {
                            echo '<tr>';
                            echo '<td>' . $row['concert_id'] . '</td>';
                            echo '<td>' . $row['venue_id'] . '</td>';
                            echo '<td>' . $row['concert_name'] . '</td>';                    
                            echo '<td>' . $row['date_of_concert'] . '</td>';
                            echo '<td>' . $row['start_time'] . '</td>';
                            echo '<td>' . $row['end_time'] . '</td>';
                            echo '<td>'
                            . '<a href="viewLocation.php?id='.$row['venue_id'].'">'.'</a> '
                            . '</td>';
                            echo '<td>'
                            . '<a href="viewEvent.php?id='.$row['concert_id'].'">View</a> '
                            . '<a class="delete" href="deleteEvent.php?id='.$row['concert_id'].'">Delete</a> '
                            . '</td>';
                            echo '</tr>';  

                            $row = $statement->fetch(PDO::FETCH_ASSOC);
                        }
                        ?>
                    </tbody>
                </table>
                
                <a class="btn btn-default" href = "createEventForm.php">Create Event</a><!--register button-->
            </div>
        </div>
    </body>
</html>
