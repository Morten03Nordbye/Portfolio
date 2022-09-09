<?php
    $dateOfBirth = "18-08-2003";
    $today = date("Y-m-d");
    $diff = date_diff(date_create($dateOfBirth), date_create($today));
    echo $diff->format('%y');
?>