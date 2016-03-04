angular.module('lltv')
.controller('NavCtrl', [
'$rootScope',
'$scope',
'$location',
'$auth',
'currentUser',
function($rootScope, $scope, $location, $auth, currentUser) {
  $scope.user = currentUser;

  $scope.isActive = function (route){
    if(route == $location.path()){
      return true;
    }else{
      return false;
    }
  }

  $scope.signedIn = function() {
    return $scope.user.id;
  }

  $scope.$watch('assets', function(value) {
    if (value) {
      $scope.assets = JSON.parse(value);
    }
  });

  $scope.signOut = function() {
    currentUser.signOut();
  };

  $rootScope.$on('auth:validation-success', function(ev, userData) {
    alert("HERE");
    // currentUser.set(userData);
  });

  $rootScope.$on('auth:validation-error', function(ev, userData) {
    alert("THERE");
  });

  $rootScope.$on('auth:invalid', function(ev, userData) {
    alert("SDFDFSDHERE");
  });

  $rootScope.$on('auth:login-success', function(ev, userData) {
    currentUser.set(userData);
  });

  $rootScope.$on('auth:logout-success', function(ev) {
    alert("OOOOT");
    // currentUser.signOut();
  });

}]);