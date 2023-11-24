<?php

function validateLocation($input_method, &$formdata, &$errors) {
    $formdata['venue_id'] = filter_input($input_method, "Venue ID", FILTER_SANITIZE_STRING);
    $formdata['venue_name'] = filter_input($input_method, "Venue Name", FILTER_SANITIZE_STRING);
    $formdata['capacity'] = filter_input($input_method, "Capacity", FILTER_SANITIZE_STRING);
    $formdata['city'] = filter_input($input_method, "City", FILTER_SANITIZE_STRING);
    $formdata['street_name'] = filter_input($input_method, "Street Name", FILTER_SANITIZE_STRING);


    if ($formdata['venue_id'] === NULL ||
                    $formdata['venue_id'] === FALSE ||
                    $formdata['venue_id'] === "")
    {
        $errors['venue_id'] = "Venue ID required";
    }
    
    if ($formdata['venue_name'] === NULL ||
                    $formdata['venue_name'] === FALSE ||
                    $formdata['venue_name'] === "")
    {
        $errors['venue_name'] = "Venue Name required";
    }   
    
    if ($formdata['capacity'] === NULL ||
                    $formdata['capacity'] === FALSE ||
                    $formdata['capacity'] === "")
    {
        $errors['capacity'] = "Capacity required";
    }
    
    if ($formdata['city'] === NULL ||
                    $formdata['city'] === FALSE ||
                    $formdata['city'] === "")
    {
        $errors['city'] = "City required";
    }
    
    if ($formdata['street_name'] === NULL ||
                    $formdata['street_name'] === FALSE ||
                    $formdata['street_name'] === "")
    {
        $errors['street_name'] = "Street Name required";
    }
}
