angular.module('lltv')
.factory('currentUser', [
'$auth',
function($auth) {
  var o = {
    first_name: null,
    last_name: null,
    username: null,
    email: null
  }

  var set = function(userData) {
    angular.extend(o, userData);
  };

  var signOut = function() {
    $auth.signOut()
      .then(function(resp) {
        o = {
          set: set,
          signOut: signOut
        };
      })
      .catch(function(resp) {
        alert("signOut error");
      });
  }

  o.set = set;
  o.signOut = signOut;

  return o;
}]);