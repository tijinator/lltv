app.controller('AuthCtrl', [
'$scope',
'$auth',
'currentUser',
function($scope, $auth, currentUser) {
  $scope.submitRegistration = function() {
    $auth.submitRegistration($scope.registrationForm)
      .then(function(resp) {
        currentUser.set(resp.data);
      })
      .catch(function(resp) {
        // handle error response
        alert('registration error');
      });
  };

  $scope.submitLogin = function() {
    $auth.submitLogin($scope.loginForm)
      .then(function(resp) {
        currentUser.set(resp);
      })
      .catch(function(resp) {
        alert('login error');
      });
  };
}]);