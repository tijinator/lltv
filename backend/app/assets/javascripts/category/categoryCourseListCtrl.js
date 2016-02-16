angular.module('lltv')
.controller('CategoryCourseListCtrl', [
'$scope',
'courses',
function($scope, courses) {
  $scope.courses = courses.data;
  console.log(courses);
}]);