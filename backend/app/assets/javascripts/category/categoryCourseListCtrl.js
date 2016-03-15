angular.module('lltv')
.controller('CategoryCourseListCtrl', [
'$scope',
'courses',
function($scope, courses) {
    $scope.courses = courses.data;

    $scope.$on('subcategory', function(e, courses) {
		$scope.courses = courses.data;
	});

}]);
