angular.module('lltv')
.factory('currentUser', [
'$rootScope',
'$auth',
'$http',
function($rootScope, $auth, $http) {
  var userObject = {};
  // var set = function(userData) {
  //   // userObject = userData;
  //   // // console.log("Current User Set: ", userData);
  //   angular.extend(userObject, userData);
  // };

  var set = function(userData){
    // angular.extend(userObject, userData)
    userObject = userData;
    console.log("current user: ", userObject);

  }

  $rootScope.$on('auth:login-success', function(ev, userData) {

    set(userData);
  });

  console.log($rootScope.userObject);


  // $rootScope.$on('auth:login-success', function(ev, userData) {
  //   console.log(userData);
  //   angular.extend(userObject, userData);
  //   console.log(userObject);
  // });


  $rootScope.$watch( 'user.username', function (username) {
    if (angular.isDefined(username)){
      // use the ID, as it seems to be defined now
      localStorage.setItem("username", username);

      // remove the watch, because there's no more use for it
      // unwatch();
    }
  });


  var signOut = function() {
    $auth.signOut()
      .then(function(resp) {
        userObject = null;
        // console.log('Sign OUT - current_user', resp);
        localStorage.removeItem("username");
      })
      .catch(function(resp) {
        // alert("signOut error");
        console.log("signOut error");
      });
  }

  userObject.set  = set;
  userObject.signOut = signOut;
  return userObject;

}]);
