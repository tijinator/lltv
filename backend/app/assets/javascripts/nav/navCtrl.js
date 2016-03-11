angular.module('lltv')
.controller('NavCtrl', [
'$rootScope',
'$scope',
'$location',
'$auth',
'currentUser',
function($rootScope, $scope, $location, $auth, currentUser) {
  // console.log("Current: ", currentUser);

  $scope.isActive = function (route){
    if(route == $location.path()){
      return true;
    }else{
      return false;
    }
  }
  
  $scope.signedIn = function() {
    // return $scope.user.id;
    return $scope.user.username;
  }

  $scope.isLoggedIn = function() {
    return ($scope.user.id) ? true : false;
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
    console.log("validation: ");
    // currentUser.set(userData);
  });

  $rootScope.$on('auth:validation-error', function(ev, userData) {
    console.log('Err auth-valid: ', userData);
    // alert("THERE");
  });

  $rootScope.$on('auth:validateUser', function(ev, userData) {
    alert("THERE");
  });

  $rootScope.$on('auth:invalid', function(ev, userData) {
    alert("SDFDFSDHERE");
  });

  $rootScope.$on('auth:login-error', function(ev, userData) {
    // console.log("ERRRORRR - auth:login-error");
    console.log("that err: ", userData.errors[0]);
  });

  $rootScope.$on('auth:login-success', function(ev, userData) {
    // console.log("validation-log1: ", ev);
    // console.log("validation-log2: ", userData);
    console.log("Login Success");
  });

  $rootScope.$on('auth:logout-success', function(ev) {
    console.log("LogOut Success");
    // console.log('signOut: ', ev);
  });

}]);