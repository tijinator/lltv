angular.module('lltv')
.controller('CategoryCoursesCtrl', ['$scope', 'category', function($scope, category) {
	$scope.category_details = category.data;
}]);