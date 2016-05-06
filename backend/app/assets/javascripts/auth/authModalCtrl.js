angular.module('lltv')
.controller('AuthModalCtrl', [
'$scope',
'AuthService',
function($scope, authService) {
  
  $scope.openModal = function(type) {
    authService.openModal(type);
  };

  // if ($scope.user) {
  //   console.log($scope.user.signedIn);
  // }
  window.openModule = $scope.openModal;
  window.userBoolean = $scope.user.signedIn;


}]);
