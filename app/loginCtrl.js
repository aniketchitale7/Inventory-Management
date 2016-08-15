/**
 * Created by Aniket on 10/17/2014.
 */

app.controller("loginCtrl", function(md5, $http, $scope, $rootScope, uuid2, $location, $cookieStore, $window){
    $scope.login = {};
//    $scope.previously_tested_logins = [];
    $scope.vaild_logins = [];
    $scope.message = "";
    $scope.good_password_style = false;
    //this.good_password_style = false;

    function getUserAuthenticationAndValidate( user ) {
        console.log("Inside user Auth");

        $http.post('serverCode/getUserAuthentication.php?user='+user).success(function (user_authentication) {
            console.log("Inside  Function Auth");
            var success = false;
            //$scope.message = user_authentication;

            if (user_authentication.length > 0){
                // Start Session ...
                startSession(user_authentication[0]);
                console.log("after data retrieved Auth" + md5.createHash($scope.login.password));
                if (user_authentication[0].password == md5.createHash($scope.login.password)) {
                    console.log("Password Matched");
                    console.log($scope.login.dob);
                    success = true;
                    $scope.message = "";
                  if(user_authentication[0].designation == "Admin")
                  {
                      console.log("Admin" + user_authentication[0].designation );
                      $location.path('/adminPage');

                  }
                  else if(user_authentication[0].designation == "Manager")
                  {
                      console.log("Manager" + user_authentication[0].designation );
                      $location.path('/managerPage');
                  }
                  else if(user_authentication[0].designationId == "Authorized" || user_authentication[0].designationId == "Authenticate")
                  {
                      console.log("User Auth" + user_authentication[0].designation );
                      $location.path('/userPage');
                  }
                    else
                  {
                      $scope.message = "Please Authenticate your Email Address";
                  }


                }else{
                    $scope.message = "Incorrect Email/Password combination";
                    console.log("Password not Matched");
                }


            }else{
             $scope.message = "User not found";
            }
        });
    }

    $scope.cancel = function(){

        $location.path('/');
    }

    $scope.redirectToCreateAccountPage = function(){
        $location.path('/create_account');
    };


    function redirectToHome(){
        $location.path("/home");
    }

    function endSession(){
        var old_session = $rootScope.session;
        $http.post('server/endSession.php?session='+old_session).success(function () {
            $rootScope.session = null;
            $cookieStore.remove("session");
        })
    }

    $scope.redirectToCreateAccountPage = function(){
        $location.path('/create_account');
    };

    $scope.createAccount = function(){
        $scope.password_length = false;
        $scope.good_password_style1 = false;
        $scope.password_match1 = false;
        $scope.correctID = false;
        $scope.correctAdminId = 1234;
        $scope.correctManagerId = 4321;
        if($scope.login.designation == "Manager"){
            if($scope.login.designationID == $scope.correctManagerId)
            {
                $scope.correctID = true;
            }
            else{
                window.alert("Incorrect manager or admin ID");
            }
        }
        if($scope.login.designation == "Admin") {
            if ($scope.login.designationID == $scope.correctAdminId) {
                $scope.correctID = true;
            }
            else
            {
                window.alert("Incorrect manager or admin ID");
            }
        }
        if($scope.login.designation == "User")
        {
            $scope.correctID = true;
        }


        if($scope.login.password == $scope.login.confirm_Password ) {
            $scope.password_match1=true;
        }
        else
        {
            window.alert("Passwords do not match");
        }
        if($scope.login.password.length >=6)
        {
            $scope.password_length = true;
            for(var i = 0;i<$scope.login.password.length;i++)
            {
                if($scope.login.password.charAt(i)=='0' || $scope.login.password.charAt(i)=='1' || $scope.login.password.charAt(i)=='2' || $scope.login.password.charAt(i)=='3' || $scope.login.password.charAt(i)=='4' || $scope.login.password.charAt(i)=='5' || $scope.login.password.charAt(i)=='6' || $scope.login.password.charAt(i)=='7' || $scope.login.password.charAt(i)=='8' || $scope.login.password.charAt(i)=='9') {
                    $scope.login.good_password_style1 = true;
                }
            }
        }
       else
        {
            window.alert("Password not long enough");
        }
        if(!$scope.login.good_password_style1)
        {
            window.alert("Password must contain one number");
        }
        if($scope.correctID &&  $scope.password_length && $scope.login.good_password_style1 && $scope.password_match1)
        {

                var password = md5.createHash($scope.login.password);
                var name = $scope.login.First_Name.concat( " " + $scope.login.Last_Name);
                $http.post('serverCode/createUser.php?user_name='+$scope.login.user_name+'&password='+ password + '&name=' + name +'&dob='+ $scope.login.dob + '&gender=' +$scope.login.gender + '&designation=' + $scope.login.designation + '&designationID=' + $scope.login.designationID).success(function(){
                    $location.path("/login");
                })
        }

    };

    $scope.goodPassword = function(){
        //var validPassword = false;
        $scope.good_password_style = false;
        var passwordLength = $scope.login.password.length;
        var letterNumber = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/;
        if($scope.login.password.match(letterNumber)){
            $scope.good_password_style = true;
        }


        //return validPassword;
        //$scope.message = $scope.good_password_style;
        return $scope.good_password_style;
    };

    $scope.matchPassword = function() {
        $scope.password_match = false;
        if($scope.login.password.equals($scope.login.confirm_Password))
        {
            $scope.password_match = true;

        }
        return $scope.password_match;



    };

    function startSession(user){
        var new_session = uuid2.newuuid();
            console.log("Start Sessions");
            $rootScope.session = {
                session_id: new_session,
                user_name: user.email,
                access: user.designationId ,
                designation_Id: user.designation

            };
            $cookieStore.put("session", $rootScope.session );




    }

    $scope.validateLogin = function() {
        getUserAuthenticationAndValidate($scope.login.user_name)
    };
});