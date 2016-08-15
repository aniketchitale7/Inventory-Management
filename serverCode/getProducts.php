<?php
    require_once '../includes/db.php'; // The mysql database connection script

        //$query="SELECT C_Name, Sc_Name FROM category c , subcategory d , category_subcategory e where c.C_Id = e.Cat_Id and e.sub_Id = d.sc_Id";
        $query="SELECT * from product1 where productQuantity > 0";
        $result = $mysqli->query($query) or die($mysqli->error.__LINE__);

        $arr = array();
        if($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $arr[] = $row;
            }
        }

        # JSON-encode the response
        echo $json_response = json_encode($arr);

?>