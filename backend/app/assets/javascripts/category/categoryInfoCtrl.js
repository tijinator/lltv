angular.module('lltv')
.controller('CategoryInfoCtrl', [
'$scope',
'category',
function($scope, category) {
  $scope.category = category.data.category;


	// $scope.$on('1', function(e, id) {
	// 	console.log('from 1: ', id);
	// 	$scope.$broadcast( '1', [1,2,3,4]);
	// 	$scope.$emit( '1',[1,2,3,4]);
	// });
	
}]);