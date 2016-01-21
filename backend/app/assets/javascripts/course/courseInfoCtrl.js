angular.module('lltv')
	.controller('CourseInfoCtrl', [
		'$scope',
		'course',
		function($scope, course) {
		  $scope.course = course.data;
}]);