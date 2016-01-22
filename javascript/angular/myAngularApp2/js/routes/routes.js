angular.module('myapp').config(function($routeProvider){
    $routeProvider
        .when('/notes', {
            templateUrl: 'path/to/file.html',
            controller: "XxxController",
            // redirectTo: '/foo',

        })
});