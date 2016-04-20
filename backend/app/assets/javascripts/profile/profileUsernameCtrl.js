angular.module('lltv')
.controller('profileUsernameCtrl', [
'$rootScope',
'$scope',
function($rootScope, $scope) {

  $scope.current_user_russel_example = $scope.user.first_name;

}]);
