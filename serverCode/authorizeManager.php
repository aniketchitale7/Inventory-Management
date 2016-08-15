<?php
require_once '../includes/db.php'; // The mysql database connection script


    $user_name = $_GET['username'];
    $authorized = $_GET['authorized'];
    if($authorized == "true")
    {
     $query="UPDATE login SET designationId = 'Authenticate' WHERE email = '$user_name'";
    }
    else
    {
     $query="UPDATE login SET designationId = 'Authorized' WHERE email = '$user_name'";
    }
   // $query="UPDATE login SET designationId = 'Authorized' WHERE email = '$user_name'";
    $result = $mysqli->query($query) or die($mysqli->error.__LINE__);
    $result = $mysqli->affected_rows;
    echo("Your Email is Authorized ,Please login back in Application");



?>