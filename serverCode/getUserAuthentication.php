<?php
    require_once '../includes/db.php'; // The mysql database connection script
    $status = '%';
    if(isset($_GET['user'])){
        $user = $_GET['user'];

        $query="SELECT * FROM login WHERE email='$user'";
        $result = $mysqli->query($query) or die($mysqli->error.__LINE__);

        $arr = array();
        if($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $arr[] = $row;
            }
        }

        # JSON-encode the response
        echo $json_response = json_encode($arr);
    }
?>

