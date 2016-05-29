angular.module('lltv')
.controller('homepageCtrl',
['$scope',
'$location',
'$http',
'$log',
function($scope,$location, $http, $log) {

  $http.get('api/home')
  .then(function(response){
    console.log(response.data.categories);
  });

}]);
