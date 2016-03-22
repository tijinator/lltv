angular.module('lltv')
.controller('AuthModalCtrl', [
'$scope',
'AuthService',
function($scope, authService) {

  $scope.openModal = function(type) {
    authService.openModal(type);
  };
  
}]);