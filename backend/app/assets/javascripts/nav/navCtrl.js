angular.module('lltv')
.controller('NavCtrl', [
'$rootScope',
'$scope',
'$location',
'$auth',
'currentUser',
'$compile',
function($rootScope, $scope, $location, $auth, currentUser, $compile) {

  var currentUserMenu = function(userData){
    return html = `
      <a class="dropdown-toggle" data-toggle="dropdown" style="background: none;"> ${userData.username} <span class="glyphicon glyphicon-menu-down" style="padding-left: 6px;"></span></a>
      <ul class="profile-dropdown dropdown-menu dropdown-menu-right" role="menu" id='profile-navbar'>
        <li><a href="/categories" style="color: #787d7f; height: 15px;">account settings</a></li>
        <li><a href="/courses/1" style="color: #787d7f; height: 15px;">profile</a></li>
        <li><a href="/categories/1" style="color: #787d7f; height: 15px;">help</a></li>
        <li><a href="/categories" style="color: #787d7f; height: 15px;">contact us</a></li>
        <li><a ng-click="signOut()" style="color: #787d7f; height: 15px;">Sign Out</a></li>
      </ul>`
    
    // console.log('HELLO CURRENT MENU ');
  };

  var signedIn = function(userData) {
        // currentUser.set(userData);
      var x = currentUserMenu(userData);
      $('.sign_up_in').hide();
      $('#signedIn').show().html($compile(x)($scope));
  };

  var signOut = function(){
    $('.sign_up_in').show();
    $('#signedIn').hide();
  }

  $scope.isActive = function (route){
    return (route == $location.path()) ? true : false
  };

  $scope.isLoggedIn = function() {
    return ($scope.user.signedIn) ? true : false;
  };

  $scope.signOut = function() {
    currentUser.signOut();
  };

  $scope.$watch('assets', function(value) {
    if (value) {
      $scope.assets = JSON.parse(value);
    }
  });

  $rootScope.$on('auth:registration-email-success', function(ev, userData) {
    // alert("A registration email was sent to " + message.email);
    console.log('Register Success: ',userData);
    $location.path("categories");
    signedIn(userData);
  });

  $rootScope.$on('auth:validation-success', function(ev, userData) {
    // console.log("validation event: ", ev);
    console.log("validation: ", userData);
    signedIn(userData);
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
    // console.log("Login Success event: ", ev);
    console.log("Login Success: ", userData);
    $location.path("categories");
    signedIn(userData);
  });

  $rootScope.$on('auth:logout-success', function(ev) {
    console.log("LogOut Success");
    // console.log('signOut: ', ev);
    $location.path("/");
    signOut();
  });


}]);
