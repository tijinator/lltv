angular.module('lltv')
.factory('currentUser', [
'$auth',
function($auth) {
  var o = {};

  var set = function(userData) {
    // o = userData;
    // console.log("Current User Set: ", userData);
    // angular.extend(o, userData);
  };

  var signOut = function() {
    $auth.signOut()
      .then(function(resp) {
        o=null;
        console.log('Sign OUT - current_user', resp);
        // o = {
        //   set: set,
        //   signOut: signOut
        // };
      })
      .catch(function(resp) {
        // alert("signOut error");
        console.log("signOut error");
      });
  }
  o.set = set;
  o.signOut = signOut;

  return o;
}]);