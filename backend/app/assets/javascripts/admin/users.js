app.factory('users', [
'$http', 
function($http) {
  var o = {
    users: []
  };

  o.getAll = function() {
    return $http.get('/api/users.json').success(function(data) {
      angular.copy(data, o.users);
    });
  };

  return o;
}]);