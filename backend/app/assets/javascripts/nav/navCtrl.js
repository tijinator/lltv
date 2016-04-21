angular.module('lltv')
.controller('NavCtrl', [
'$rootScope',
'$scope',
'$location',
'$auth',
'currentUser',
'$compile',
function($rootScope, $scope, $location, $auth, currentUser, $compile) {

$scope.jsRun = function(userData){
  var li = document.createElement('li');
      li.setAttribute('id', 'signedIn');

  var a = document.createElement('a');
          a.setAttribute('class','dropdown-toggle');
          a.setAttribute('data-toggle','dropdown');
          a.setAttribute('style','background: none');
  // var userName = document.createTextNode($scope.user.username);
  var userName = document.createTextNode(userData.first_name);
      a.appendChild(userName);

  var span = document.createElement('span');
          span.setAttribute('class','glyphicon glyphicon-menu-down');
          span.setAttribute('style','padding-left: 6px');
          span.setAttribute('class','glyphicon glyphicon-menu-down');
          a.appendChild(span);
      li.appendChild(a);

  var ul = document.createElement('ul');
          ul.setAttribute('class','profile-dropdown dropdown-menu dropdown-menu-right');
          ul.setAttribute('role','menu');
          ul.setAttribute('id','profile-navbar');

  var innerLiOne = document.createElement('li');
      var innerA = document.createElement('a');
          // console.log(JSON.stringify(userData));
          // innerA.setAttribute('href', '/categories');
          innerA.setAttribute('ui-sref', "profileUsername.show({username:" + JSON.stringify(userData.username) + "})");
          innerA.setAttribute('style', 'color: #787d7f; height: 15px');

          var profile = document.createTextNode('Profile');
          innerA.appendChild(profile);
          innerLiOne.appendChild(innerA);
      ul.appendChild(innerLiOne);

  var innerLiTwo = document.createElement('li');
      var innerO = document.createElement('a');
          innerO.setAttribute('ng-click', 'signOut()');
          innerO.setAttribute('style', 'color: #787d7f; height: 15px');

          var signOut = document.createTextNode('Sign Out');
          innerO.appendChild(signOut);
          innerLiTwo.appendChild(innerO);
      ul.appendChild(innerLiTwo);

      li.appendChild(ul);

  return li;

}

  var currentUserMenu = function(userData){
    // return html = `
    //   <a class="dropdown-toggle" data-toggle="dropdown" style="background: none;"> ${userData.username}
    //     <span class="glyphicon glyphicon-menu-down" style="padding-left: 6px;"></span>
    //   </a>
    //   <ul class="profile-dropdown dropdown-menu dropdown-menu-right" role="menu" id='profile-navbar'>
    //     <li><a href="/categories" style="color: #787d7f; height: 15px;">account settings</a></li>
    //     <li><a href="/courses/1" style="color: #787d7f; height: 15px;">profile</a></li>
    //     <li><a href="/categories/1" style="color: #787d7f; height: 15px;">help</a></li>
    //     <li><a href="/categories" style="color: #787d7f; height: 15px;">contact us</a></li>
    //     <li><a ng-click="signOut()" style="color: #787d7f; height: 15px;">Sign Out</a></li>
    //   </ul>`

    // console.log('HELLO CURRENT MENU ');
  };

  var signedIn = function(userData) {
        // currentUser.set(userData);
      // var x = currentUserMenu(userData);

      var x = $scope.jsRun(userData);
      $('.sign_up_in').hide();
      // $('#signedIn').show().html(x);
      $('#signedIn').show().html($compile(x)($scope));
      // console.log(x);
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
    // console.log('Register Success: ',userData);
    $location.path("categories");
    signedIn(userData);
  });

  $rootScope.$on('auth:validation-success', function(ev, userData) {
    // console.log("validation event: ", ev);
    // console.log("validation: ", userData);
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
    alert("INVALID USER AUTH");
  });

  $rootScope.$on('auth:login-error', function(ev, userData) {
    // console.log("ERRRORRR - auth:login-error");
    console.log("that err: ", userData.errors[0]);
  });

  $rootScope.$on('auth:login-success', function(ev, userData) {
    // console.log("validation-log1: ", ev);
    // console.log("validation-log2: ", userData);
    // console.log("Login Success event: ", ev);
    // console.log("Login Success: ", userData);
    $location.path("categories");
    signedIn(userData);
  });

  $rootScope.$on('auth:logout-success', function(ev) {
    // console.log("LogOut Success");
    // console.log('signOut: ', ev);
    $location.path("/");
    signOut();
  });


}]);
