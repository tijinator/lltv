angular.module('lltv')
.controller('profileUsernameCtrl', [
'$rootScope',
'$scope',
'currentUser',
function($rootScope, $scope, currentUser) {
  // $scope.current_user = $scope.user.first_name;
  // $scope.current_user = $rootScope.user_name;
  // console.log(currentUser);
  $scope.current_user = localStorage.getItem("username");


  var set = function(userData){
    // angular.extend(userObject, userData)
    $scope.userdude = userData;
    console.log($scope.userdude);

  }

  $rootScope.$on('auth:login-success', function(ev, userData) {

    set(userData);
  });

}]);
