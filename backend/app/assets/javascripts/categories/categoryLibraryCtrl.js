angular.module('lltv')
.controller('CategoryLibraryCtrl', [
'$scope',
'categories',
function($scope, categories) {
  $scope.categories = categories.data;
}]);