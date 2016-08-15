<?php
require_once '../includes/db.php'; // The mysql database connection script


    $items = $_GET['summary'];
    $username = $_GET['username'];
    $dataObject = json_decode($items);

 // print $dataObject->{'items'};
 // echo $dataObject->items[0]->id;

   foreach($dataObject->items as $values) {


      $query="INSERT INTO transactions(username,P_Id,P_Name,P_Price,P_Quantity,P_Total)  VALUES ('$username', '$values->id', '$values->name' ,'$values->price', '$values->quantity' , '$values->total')";
               $result = $mysqli->query($query) or die($mysqli->error.__LINE__);
              $result = $mysqli->affected_rows;
         }

          $query1="SELECT * from product1";
                           $result = $mysqli->query($query1) or die($mysqli->error.__LINE__);

                           $arr = array();
                           if($result->num_rows > 0) {
                               while($row = $result->fetch_assoc()) {
                                   $arr[] = $row;
                               }
                           }
/*   $result =  $json_response = json_encode($arr);
                     //     foreach($result.productId as $buy) {
                           echo($json_response[0]['productId']); */

                      //     echo($arr[0]['productId']);

   //}



     foreach($arr as $aval) {

           foreach($dataObject->items as $buy) {


            if($aval['productId'] == $buy->id)
            {
                  $availableQuantity = $aval['productQuantity'] ;
                  $buyQuantity = $buy->quantity ;
                  $nowAvailable = $availableQuantity - $buyQuantity ;
                  //echo($nowAvailable);
                   $query2="UPDATE product1 SET productQuantity = '$nowAvailable' WHERE productId = '{$aval['productId']}'";
                   $result = $mysqli->query($query2) or die($mysqli->error.__LINE__);
                   $result = $mysqli->affected_rows;

            }




            }

     }

?>