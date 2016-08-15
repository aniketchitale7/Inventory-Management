<?php
require_once '../includes/db.php'; // The mysql database connection script


    $items = $_GET['summary'];
    $username = $_GET['username'];
    $dataObject = json_decode($items);

 // print $dataObject->{'items'};
 // echo $dataObject->items[0]->id;

   foreach($dataObject->items as $values) {


      $query="INSERT INTO returnitems(return_Id,p_name,return_quantity,username)  VALUES ('$values->id', '$values->name' ,'$values->quantity',  '$username')";
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

              foreach($arr as $aval) {

                    foreach($dataObject->items as $buy) {

                    $str2 = substr($buy->id, 0 , 5);

                     if($aval['productId'] == $str2)
                     {
                           $availableQuantity = $aval['productQuantity'] ;
                           $buyQuantity = $buy->quantity ;
                           $nowAvailable = $availableQuantity - $buyQuantity ;

                           if($nowAvailable < 0 )
                           {

                          $query3 =  "select * from product1 p1 where p1.productSubcategory in (SELECT productSubcategory FROM product1 p1 WHERE p1.productId = '$str2') and productQuantity > -($nowAvailable) ";
                            $result = $mysqli->query($query3) or die($mysqli->error.__LINE__);

                             $arr = array();
                                    if($result->num_rows > 0) {
                                        while($row = $result->fetch_assoc()) {
                                            $arr[] = $row;
                                        }
                                    }

                                    # JSON-encode the response
                                      $arr[0]['available'] = ($nowAvailable);

                                     $json_response = json_encode($arr);

                                    echo $json_response;

                           }
                           else
                           {
                                $query2="UPDATE product1 SET productQuantity = '$nowAvailable' WHERE productId = '{$aval['productId']}'";
                                $result = $mysqli->query($query2) or die($mysqli->error.__LINE__);
                                $result = $mysqli->affected_rows;
                                 $arr = array();
                                $arr[0]['available'] = ($nowAvailable);
                                $json_response = json_encode($arr);
                                echo $json_response;

                           }


                     }
                     }

              }




?>