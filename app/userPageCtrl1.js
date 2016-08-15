
/**
 * Created by Aniket
 */
app.controller("userPageCtrl1", function($scope, $rootScope, $http, $location, $cookieStore , ngCart , $routeParams){

    $scope.users = []; //declare an empty array
    $scope.input = [];
     $scope.param1= $routeParams.param;
    $scope.user_name = $rootScope.session.user_name;
    $scope.name= $scope.user_name.substr(0, $scope.user_name.indexOf('@'));
    ngCart.empty();
    var catArray = {};
    $http.get('serverCode/getUserAuthentication.php?user='+ $scope.user_name).success(function(response){
        $scope.userDetails = response;  //ajax request to fetch data into $scope.data
    });

    $scope.updateAccount = function(){
        var fname = document.getElementById("FirstName").valueOf().value;
        var lname = document.getElementById("Last_Name").valueOf().value;
        var dob = document.getElementById("dob").valueOf().value;
        var name = fname + " " + lname;
        console.log(fname);
        console.log(lname);
        console.log(dob);
        $http.post('serverCode/updateUser.php?user_name='+$scope.user_name+ '&name=' + name +'&dob='+ dob).success(function(){
            $scope.updated = "Updated Information";
        })
    }

    $scope.access = $rootScope.session.access;
    $http.get("serverCode/getProducts.php?").success(function(response){
        $scope.users = response;  //ajax request to fetch data into $scope.data
    });

    $http.get('serverCode/getTransactions.php?username='+ $scope.user_name).success(function(response){
        $scope.return_items = response;  //ajax request to fetch data into $scope.data
    });
    ngCart.setTaxRate(7.5);
    ngCart.setShipping(2.99);
    console.log ("Value of Ng Cart is " + ngCart);

    $scope.myVariable = "My Variable value";

    $scope.updateInfo = function(){
        $location.path('/userInfo');

    }

    $scope.checkout = function() {
        $scope.summary = ngCart.toObject();
        console.log("Value of total " + $scope.summary.totalCost)
        if($scope.summary.totalCost == $scope.input.confirmPrice)
        {
            $scope.orderPlace = "OrderPlaced"
           var data = JSON.stringify($scope.summary);

            // Code to save summary in database.
            $http.post('serverCode/addTransactions.php?summary='+data + '&username='+ $scope.user_name).success(function(){
                console.log("Order Placed" + $scope.summary.items);
                alert("Thank you Order Placed");

                $location.path('/userPage');
                });

        }
        else {
            $scope.orderPlace = "Incorrect Value Entered"

        }
       // Post your cart to your resource
        //$http.post('cart/', ngCart.toObject());
    }

    $scope.returnItems = function() {
        $scope.return_summary = ngCart.toObject();

            $scope.orderPlace = "OrderPlaced"
            var data = JSON.stringify($scope.return_summary);

            // Code to save summary in database.
           $http.post('serverCode/addReturnItems.php?summary='+data + '&username='+ $scope.user_name).success(function(response){
          $scope.recommendation_items = response ;
             console.log("The Response is " + $scope.recommendation_items[0].available);
               if($scope.recommendation_items[0].available > 0)
               {
                   alert("Items placed for return. It would take 4-5 days for Delivery");
                   $location.path('/userPage');
               }
                else
               {

                   alert("This Item is not Available, Please select a recommendation");
                   $location.path('/recommendation').search({param: $scope.recommendation_items});

               }

            });

    }

    $scope.recommendationItem = function() {
        //$scope.returnRecommenndations = ngCart.toObject();
        alert("Item return request Placed");
        $location.path('/userPage');

       // $scope.orderPlace = "OrderPlaced"
        //var data = JSON.stringify($scope.return_summary);
    ///Save value to database
        // Code to save summary in database.
       // $http.post('serverCode/addReturnItems.php?summary='+data + '&username='+ $scope.user_name).success(function(response){

       // });

    }

    $scope.redirectToCart = function(){
        $location.path('/orderPage');
    }

    $scope.logout = function(){
        $cookieStore.remove("session");
        $location.path('/');
    }



    $scope.redirectToReturn = function(){
        $location.path('/returnPage');
    }


    $scope.sort = function(keyname){
        $scope.sortKey = keyname;   //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    }







});
