<?php
require_once '../includes/db.php'; // The mysql database connection script


    $user_name = $_GET['username'];

    $query="UPDATE login SET designation = 'Admin' WHERE email = '$user_name'";
    $result = $mysqli->query($query) or die($mysqli->error.__LINE__);
    $result = $mysqli->affected_rows;




?>