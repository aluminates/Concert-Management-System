<?php

function validateEvents($input_method, &$formdata, &$errors) {
    $formdata['Concert Name'] = filter_input($input_method, "Concert Name", FILTER_SANITIZE_STRING);
    $formdata['Concert ID'] = filter_input($input_method, "Concert ID", FILTER_SANITIZE_STRING);
    $formdata['Venue ID'] = filter_input($input_method, "Venue ID", FILTER_SANITIZE_STRING);
    $formdata['Date of Concert'] = filter_input($input_method, "Date of Concert", FILTER_SANITIZE_STRING);
    $formdata['Start Time'] = filter_input($input_method, "Start Time", FILTER_SANITIZE_STRING);
    $formdata['End Time'] = filter_input($input_method, "End Time", FILTER_SANITIZE_STRING);

    if ($formdata['Concert Name'] === NULL ||
                    $formdata['Concert Name'] === FALSE ||
                    $formdata['Concert Name'] === "")
    {
        $errors['Concert Name'] = "Concert Name required";
    }
    
    if ($formdata['Concert ID'] === NULL ||
                    $formdata['Concert ID'] === FALSE ||
                    $formdata['Concert ID'] === "")
    {
        $errors['Concert ID'] = "Concert ID required";
    }   
    
    if ($formdata['Venue ID'] === NULL ||
                    $formdata['Venue ID'] === FALSE ||
                    $formdata['Venue ID'] === "")
    {
        $errors['Venue ID'] = "Venue ID required";
    }
    
    if ($formdata['Date of Concert'] === NULL ||
                    $formdata['Date of Concert'] === FALSE ||
                    $formdata['Date of Concert'] === "")
    {
        $errors['Date of Concert'] = "Date of Concert required";
    }
    
    if ($formdata['Start Time'] === ""){
        $capacity = intval($formdata['Start Time']);
        if ($capacity < 0 || $capacity > 999999) {
    }
        $errors['Start Time'] = "Start Time required.";
    }
    
    if ($formdata['End Time'] === ""){
        $locID = intval($formdata['End Time']);
        if ($locID < 0 || $capacity > 999999) {
    }
        $errors['End Time'] = "End Time required.";
    }
    
}
