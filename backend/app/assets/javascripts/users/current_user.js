angular.module('lltv')
.factory('currentUser', [
'$auth',
function($auth) {
  // var o = {
  //   id: null,
  //   first_name: null,
  //   last_name: null,
  //   username: null,
  //   email: null
  // }
  var o = {};

  var set = function(userData) {
    console.log("Current User Set: ", userData);
    // angular.extend(o, userData);
    o = userData;
  };

  var signOut = function() {
    $auth.signOut()
      .then(function(resp) {
        o=null;

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