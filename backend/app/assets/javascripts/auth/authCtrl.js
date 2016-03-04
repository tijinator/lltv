angular.module('lltv')
.controller('AuthCtrl', [
'$scope',
'$auth',
'currentUser',
'AuthService',
function($scope, $auth, currentUser, authService) {
  $scope.submitRegistration = function() {
      console.log($scope.registrationForm);

      $auth.submitRegistration($scope.registrationForm)
      .then(function(res) {
        console.log(res);
        // currentUser.set(res.data);
      })
      .catch(function(res) {
        // handle error response
        // alert('registration error');
        console.log("REGISTRATION ERROR - Auth.JS", res);
      })
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

  $scope.submitSignOut = function() {
    $auth.signOut()
      .then(function(resp) {
        // handle success response
      })
      .catch(function(resp) {
        // handle error response
      });
  };

  $scope.switch = function(type) {
    authService.switchModal(type);
  }

  $scope.close = function() {
    authService.closeModal();
  }
}]);