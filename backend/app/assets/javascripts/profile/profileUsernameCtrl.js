angular.module('lltv')
.controller('profileUsernameCtrl', [
'$rootScope',
'$scope',
function($rootScope, $scope) {

  $scope.profileFirstName = $scope.user.username


}]);
