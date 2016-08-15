<?php
require_once '../includes/db.php'; // The mysql database connection script


    $user_name = $_GET['productId'];
    $password = $_GET['productName'];
    $name = $_GET['productCategory'];
    $dob = $_GET['productSubCategory'];
    $gender = $_GET['productVendor'];
    $designation = $_GET['productQuantity'];
    $designationID = $_GET['productPrice'];
     $description = $_GET['productDescription'];

    $query="INSERT INTO product1(productId,productName,productCategory,productSubcategory,productVendor,productQuantity,productPrice,productDescription)  VALUES ('$user_name', '$password', '$name' ,'$dob', '$gender' , '$designation','$designationID','$description')";
    $result = $mysqli->query($query) or die($mysqli->error.__LINE__);
    $result = $mysqli->affected_rows;




?>