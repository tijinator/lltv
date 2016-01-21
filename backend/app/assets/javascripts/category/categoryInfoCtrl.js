angular.module('lltv')
	.controller('CategoryInfoCtrl', [
		'$scope',
		'category',
		function($scope, category) {
		  $scope.category = category.data;
}]);