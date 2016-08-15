
/**
 * Created by Aniket
 */
app.controller("managerPageCtrl", function($scope, $rootScope, $http, $location, $cookieStore){
    $scope.input = [];
    $scope.user_name = $rootScope.session.user_name;
    $scope.access = $rootScope.session.access;
    $scope.name= $scope.user_name.substr(0, $scope.user_name.indexOf('@'));

    $scope.redirectToOrders = function(){
        if($scope.access == "Authorized") {
            $location.path('/addOrder');
        }
        else
            {
                $scope.message = "Not Authorized to add Products. Please send a email to admin."
            }

        }

    $scope.logout = function(){
        $cookieStore.remove("session");
        $location.path('/');
    }


    $scope.addOrders = function(){

            $http.post('serverCode/addOrders.php?productId='+$scope.input.productIds+'&productName='+ $scope.input.productName + '&productCategory=' + $scope.input.productCategory +'&productSubCategory='+ $scope.input.productSubCategory + '&productVendor=' +$scope.input.productVendor + '&productQuantity=' + $scope.input.productQuantity + '&productPrice=' + $scope.input.productPrice + '&productDescription=' + $scope.input.productDescription).success(function(){
                $location.path("/managerPage");
            })




    };

    $scope.updateInfo = function(){
        $location.path('/userInfo');

    }
});