angular.module('lltv')
.controller('NavCtrl', [
'$rootScope',
'$scope',
'$location',
'$auth',
'currentUser',
'$compile',
'$cookieStore',
function($rootScope, $scope, $location, $auth, currentUser, $compile, $cookieStore) {

$scope.jsRun = function(userFirstName){
  var li = document.createElement('li');
      li.setAttribute('id', 'signedIn');

  var a = document.createElement('a');
          a.setAttribute('class','dropdown-toggle');
          a.setAttribute('id','userFirstName');
          a.setAttribute('data-toggle','dropdown');
          a.setAttribute('style','background: none');
  // var userName = document.createTextNode($scope.user.username);
  var firstName = document.createTextNode(userFirstName);
      a.appendChild(firstName);

  var span = document.createElement('span');
          span.setAttribute('class','glyphicon glyphicon-chevron-down');
          span.setAttribute('style','padding-left: 6px');
          span.setAttribute('class','glyphicon glyphicon-chevron-down');
          a.appendChild(span);
      li.appendChild(a);

  var ul = document.createElement('ul');
          ul.setAttribute('class','profile-dropdown dropdown-menu dropdown-menu-right');
          ul.setAttribute('role','menu');
          ul.setAttribute('id','profile-navbar');

  var innerLiAccount = document.createElement('li');
      var innerAcc = document.createElement('a');
          // console.log(JSON.stringify(userData));
          innerAcc.setAttribute('ui-sref', 'accountSetting.show');
          // innerAcc.setAttribute('ui-sref', 'account.show');
          innerAcc.setAttribute('style', 'color: #787d7f; height: 15px');

          var accountSetting = document.createTextNode('account settings');
          innerAcc.appendChild(accountSetting);
          innerLiAccount.appendChild(innerAcc);
      ul.appendChild(innerLiAccount);

  var innerLiOne = document.createElement('li');
      var innerA = document.createElement('a');
          // console.log(JSON.stringify(userData));

          innerA.setAttribute('ui-sref', "profileUsername.show({username:" + JSON.stringify(userFirstName) + "})");
          // innerA.setAttribute('ui-sref', "profileUsername.show({username:" + JSON.stringify(userData.username) + "})");
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

  var signedIn = function() {
      var userFirstName = currentUser.getUserObj().first_name;

      var x = $scope.jsRun(userFirstName);
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
    // console.log(userData);
    
    $cookieStore.remove('userObj'); //remove current userObj cookie
    $cookieStore.put('userObj', userData); //update userObj cookie

    $location.path("categories");
    signedIn();
  });

  $rootScope.$on('auth:validation-success', function(ev, userData) {
    signedIn();
  });

  $rootScope.$on('auth:validation-error', function(ev, userData) {
    alert("Sorry Your Session Expired");
  });

  $rootScope.$on('auth:validateUser', function(ev, userData) {
    // alert("THERE");
  });

  $rootScope.$on('auth:invalid', function(ev, userData) {
    // alert("INVALID USER AUTH");
  });

  $rootScope.$on('auth:login-error', function(ev, userData) {
  });

  $rootScope.$on('auth:login-success', function(ev, userData) {
    $cookieStore.put('userObj', userData);
    
    // $location.path("categories");
    $location.path("/about");
    signedIn();
  });

  $rootScope.$on('auth:logout-success', function(ev) {
    $cookieStore.remove('userObj'); //remove current userObj cookie
    $location.path("/");
    signOut();
  });




}]);
