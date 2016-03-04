angular.module('lltv')
.controller('CategoryCoursesCtrl', [
'$scope',
'category',
function($scope, category) {
  $scope.category_details = category.data;
  console.log($scope.category_details.category)
}]);
