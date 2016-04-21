angular.module('lltv')
.controller('profileUsernameCtrl', [
'$rootScope',
'$scope',
function($rootScope, $scope) {
  // $scope.current_user = $scope.user.first_name;
  // $scope.current_user = $rootScope.user_name;
  $scope.current_user = localStorage.getItem("username");


}]);
