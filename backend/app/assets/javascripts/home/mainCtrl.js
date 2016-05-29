angular.module('lltv')
.controller('MainCtrl',
['$scope',
'$location',
'$http',
'$log',
function($scope,$location, $http, $log){
  $scope.isActive = function (route){
    if(route == $location.path()){
		return true;
    }else{
		return false;
    }
	}

  //get home api for popular courses and featured categories
  $http.get('api/home')
  .then(function(response){

    $scope.popularCourses = response.data.populars;

    $scope.homeCategories = response.data.categories;

  });

}]);
