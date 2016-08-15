<?php
require_once '../includes/db.php'; // The mysql database connection script
echo"Hello World";
print("Hello World");
if(isset($_GET['user_name']))
{
    $user_name = $_GET['user_name'];
    $name = $_GET['name'];
    $dob = $_GET['dob'];

    $query = "UPDATE login SET name='$name', dateofbirth='$dob' WHERE email='$user_name'";
    $result = $mysqli->query($query) or die($mysqli->error.__LINE__);
    $result = $mysqli->affected_rows;


}
?>