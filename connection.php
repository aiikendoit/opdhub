<?php

    $database= new mysqli("localhost","root","","opdhub_project");
    if ($database->connect_error){
        die("Connection failed:  ".$database->connect_error);
    }

?>