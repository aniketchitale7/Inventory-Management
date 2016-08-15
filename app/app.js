/**
 * Created by Aniket
 */
var app = angular.module("app", ['angular-md5', 'ngRoute', 'angularUUID2', 'ngCookies' , 'angularUtils.directives.dirPagination' , 'ngCart'])

app.config(['$routeProvider','$sceProvider',
    function ($routeProvider, $sceProvider) {

          $sceProvider.enabled(false);
        $routeProvider.
            when('/login', {
              title: 'Login',
              templateUrl: 'htmlPages/login.html',
              controller: 'loginCtrl'
            })

            .when('/', {
              title: 'Login',
              templateUrl: 'htmlPages/login.html',
              controller: 'loginCtrl'
            })

            .when('/userPage', {
                title: 'userPage',
                templateUrl: 'htmlPages/userPage1.html',
                controller: 'userPageCtrl1'
            })

            .when('/userInfo', {
                title: 'userPage',
                templateUrl: 'htmlPages/userInfo.html',
                controller: 'userPageCtrl1'
            })

            .when('/showUsers', {
                title: 'showUsers',
                templateUrl: 'htmlPages/showUsers.html',
                controller: 'adminPageCtrl'
            })

            .when('/returnPage', {
                title: 'userPage',
                templateUrl: 'htmlPages/returnPage.html',
                controller: 'userPageCtrl1'
            })

            .when('/recommendation', {
                title: 'userPage',
                templateUrl: 'htmlPages/recommendation.html',
                controller: 'userPageCtrl1'
            })

            .when('/orderPage', {
                title: 'orderPage',
                templateUrl: 'htmlPages/userPage.html',
                controller: 'userPageCtrl1'
            })
            .when('/addOrder', {
                title: 'orderPage',
                templateUrl: 'htmlPages/addItems.html',
                controller: 'managerPageCtrl'
            })

            .when('/managerPage', {
                title: 'managerPage',
                templateUrl: 'htmlPages/managerPage.html',
                controller: 'managerPageCtrl'
            })

            .when('/adminPage', {
                title: 'adminPage',
                templateUrl: 'htmlPages/admin.html',
                controller: 'adminPageCtrl'
            })

            .when('/makeAdmin', {
                title: 'adminPage',
                templateUrl: 'htmlPages/makeAdmin.html',
                controller: 'adminPageCtrl'
            })

            .when('/authorizeManager', {
                title: 'adminPage',
                templateUrl: 'htmlPages/AuthorizeManager.html',
                controller: 'adminPageCtrl'
            })

            .when('/create_account', {
                title: 'create_account',
                templateUrl: 'htmlPages/create_account.html',
                controller: 'loginCtrl'
            })
            .when('/cart', {
                title: 'cart',
                templateUrl: 'htmlPages/cart.html',
                controller: 'userPageCtrl'
            })


            .otherwise({
              redirectTo: '/login'
            });
      }])






