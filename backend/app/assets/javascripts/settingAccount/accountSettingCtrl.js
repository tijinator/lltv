angular.module('lltv')
.controller('accountSettingCtrl', [
'$scope',
'currentUser',
'$auth',
function($scope, currentUser, $auth){
  var userObj = currentUser.getUserObj();

  $scope.userEmail = userObj.email;
  console.log($scope.userEmail);
}]);
