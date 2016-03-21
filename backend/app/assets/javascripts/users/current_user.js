angular.module('lltv')
.factory('currentUser', [
'$auth',
function($auth) {
  var obj = {};

  var set = function(userData) {
    // obj = userData;
    // console.log("Current User Set: ", userData);
    angular.extend(obj, userData);
  };

  var signOut = function() {
    $auth.signOut()
      .then(function(resp) {
        obj = null;
        console.log('Sign OUT - current_user', resp);
      })
      .catch(function(resp) {
        // alert("signOut error");
        console.log("signOut error");
      });
  }

  obj.set = set;
  obj.signOut = signOut;

  return obj;

}]);