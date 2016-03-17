angular.module('lltv')
.controller('NavCtrl', [
'$rootScope',
'$scope',
'$location',
'$auth',
'currentUser',
function($rootScope, $scope, $location, $auth, currentUser) {

  $scope.callMe = function() {
    console.log('yeah i work');
      profileMenu();
  }

  var profileMenu = function(){

    // var profileOptions = ["account settings", "profile", "help", "contact us", "sign out"];
    // var li = document.createElement('li');
    // var ul = document.createElement('ul');

    // var domList = document.getElementsByClassName("call-me");
    var html = `
    <a class="dropdown-toggle" data-toggle="dropdown"> Profile</a>
    <ul class="dropdown-menu" role="menu">
      <li><a href="/categories" style="color: #000;">account settings</a></li>
      <li><a href="/courses/1" style="color: #000;">profile</a></li>
      <li><a href="/categories/1" style="color: #000;">help</a></li>
      <li><a href="/categories" style="color: #000;">contact us</a></li>
      <li><a href="/courses/1" style="color: #000;">sign out</a></li>
    </ul>
    `

    $('.call-me').html(html);
    // domList.appendChild(html);

    console.log(html);



    //set attributes to li => class="dropdown-toggle" data-toggle="dropdown"
    // li.setAttribute('class', 'profile-nav-menu dropdown-toggle');
    // li.setAttribute('data-toggle', 'dropdown');
    //
    // //set attributes class, role to ul -> class="dropdown-menu" role="menu"
    // ul.setAttribute('class', 'dropdown-menu');
    // ul.setAttribute('role', 'menu');

    //set li childrent to ul
    // for(var i = 0; i < profileOptions.length; i++){
    //   // var text = document.createTextNode("Water");
    //   var ulChildrenLi = document.createElement('li');
    //   ulChildrenLi.innerHTML = profileOptions[i];
    //   ul.appendChild(ulChildrenLi);
    // }
    // // ul.appendChild(ulChildren);
    // // console.log(ulChildrenLi);
    // li.appendChild(ul);




    // var domList = document.getElementsByClassName("profile-nav-menu");
    // var $list = $(domList); //convert to jquery element
    // var $ul = $('<ul class="dropdown-menu"></ul>');
    // var $res = $list.append($ul);
  }

  $scope.isActive = function (route){
    return (route == $location.path()) ? true : false
  }

  $scope.signedIn = function() {
    // return currentUser.username;
    return "Hi, " + $scope.user.first_name;
  }

  $scope.isLoggedIn = function() {
    return ($scope.user.id) ? true : false;
  }

  $scope.signOut = function() {
    currentUser.signOut();
  };

  $scope.$watch('assets', function(value) {
    if (value) {
      $scope.assets = JSON.parse(value);
    }
  });

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
