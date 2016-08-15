
/**
 * Created by Aniket
 */
app.controller("userPageCtrl", function($scope, $rootScope, $http, $location, $cookieStore){
    $scope.input = {};
    $scope.user_name = $rootScope.session.user_name;
    $scope.name= $scope.user_name.substr(0, $scope.user_name.indexOf('@'));
   var catArray = {};
    $scope.access = $rootScope.session.access;

   console.log("Value of Access is "+ $scope.access);

        retrieveCategories();


    function retrieveCategories(){
        $http.post('serverCode/getCategories.php').success(function (data) {
            $scope.categories = data;
           //findUniqueCategories();
            catArray =   $scope.categories;
        });
    }

   /* function findUniqueCategories(){
         $scope.uniqueNames = [];
        for(i = 0; i<  $scope.categories.length; i++){
            if($scope.uniqueNames.indexOf($scope.categories[i].C_Name) === -1){
                $scope.uniqueNames.push( $scope.categories[i].C_Name);
            }
        }
    } */

    $scope.selectedItemChanged = function(){
        console.log("Value of input" + $scope.input.category );
       for(i=0 ; i <catArray.length ; i++)
        {
           if( catArray[i].C_Name == $scope.input.category)
           {
               $scope.cid = catArray[i].C_Id;

           }
        }

     /*  for( category in catArray)
       {
           if(category.C_Name == $scope.inputs.category)
           {
               $scope.cid = category.C_Id;
           }
       } */

       console.log("Value of cat" + $scope.cid );
        $http.post('serverCode/getSubCategories.php?category='+$scope.cid).success(function (data) {
            $scope.subcategories = data;
            console.log("Value of sub cat" +  data );
        });


    }

});
