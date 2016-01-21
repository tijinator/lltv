angular.module('lltv')
.controller('MainCtrl', [
'$scope',
'$location',
function($scope,$location) {	
	 $scope.isActive = function (route){
    if(route == $location.path()){
		return true;
    }else{
		return false;
    }
  }	
}]);