
/**
 * Created by Aniket
 */
app.controller("adminPageCtrl", function($scope, $rootScope, $http, $location, $cookieStore){

    $scope.input = [];
    $scope.user_name = $rootScope.session.user_name;
    $scope.access = $rootScope.session.access;


    $scope.redirectTomakeAdmin = function(){
        $location.path('/makeAdmin');
    }

    $scope.redirectToAuthorizeManager= function(){
        $location.path('/authorizeManager');
    }

    $scope.makeAdmin = function(){
      console.log("Admin Made");
        $http.post('serverCode/makeAdmin.php?username='+$scope.input.managerId).success(function(){
            console.log("Admin Added");
            $location.path('/adminPage');
        });

    }

    $scope.authorizeManager = function(){
        console.log("Admin Made");
        $http.post('serverCode/AuthorizeManager.php?username='+$scope.input.managerId).success(function(){
            console.log("Manager Authorized");
            $location.path('/adminPage');
        });

    }

    $scope.logout = function(){
        $cookieStore.remove("session");
        $location.path('/');
    }


    $scope.updateInfo = function(){
        $location.path('/userInfo');

    }

    $http.get('serverCode/getUsers.php?').success(function(response){
        $scope.users2 = response;  //ajax request to fetch data into $scope.data
    })

    $http.get('serverCode/getMans.php?').success(function(response){
        $scope.mans2 = response;  //ajax request to fetch data into $scope.data
    })

    $scope.showUsers = function(){

        $location.path('/showUsers');
    }

});