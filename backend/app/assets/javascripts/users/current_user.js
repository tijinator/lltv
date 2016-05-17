angular.module('lltv')
.factory('currentUser', [
'$rootScope',
'$auth',
'$http',
'$cookieStore',
function($rootScope, $auth, $http, $cookieStore) {
  var userObject = {};

  userObject.getUserObj = function(){
    var userObj = $cookieStore.get('userObj');
    

    if(userObj){
      return userObj;
    }else{
      console.log('you are not logged in!');
      return false;
    }
  }

  var signOut = function() {
    $auth.signOut()
      .then(function(resp) {
        userObject = null;
        console.log('Sign OUT - current_user', resp);
        // localStorage.removeItem("username");
      })
      .catch(function(resp) {
        // alert("signOut error");
        console.log("signOut error");
      });
  }

  userObject.signOut = signOut;
  return userObject;

}]);
