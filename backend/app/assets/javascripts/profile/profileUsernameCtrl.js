angular.module('lltv')
.controller('profileUsernameCtrl', [
'$rootScope',
'$scope',
'currentUser',
'$cookieStore',
function($rootScope, $scope, currentUser, $cookieStore) {

  var userObj = currentUser.getUserObj();
  // console.log(userObj);

  $scope.current_user = userObj.username;

}]);
