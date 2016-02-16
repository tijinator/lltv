angular.module('lltv')
.controller('FeaturedCourseCtrl', [
'$scope',
'featuredCourse',
function($scope, featuredCourse) {
  $scope.featuredCourse = featuredCourse.data;
  console.log(featuredCourse);
}]);