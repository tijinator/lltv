angular.module('lltv')
.controller('AuthCtrl', [
'$scope',
'$auth',
'currentUser',
'AuthService',
function($scope, $auth, currentUser, authService) {
  $scope.submitRegistration = function() {
    $auth.submitRegistration($scope.registrationForm)
      .then(function(res) {
        currentUser.set(res.data.data);
        $scope.close();
      })
      .catch(function(res) {
        // handle error response
        console.log("REGISTRATION ERROR - Auth.JS", res.data.errors);
      })
  };

  $scope.submitLogin = function() {
    $auth.submitLogin($scope.loginForm)
      .then(function(resp) {
        currentUser.set(resp);
        $scope.close();
      })
      .catch(function(resp) {
        // alert('login error');
        console.log('authCtrl - login error', resp.errors);
      });
  };

  // $scope.submitSignOut = function() {
    // console.log("HAHA");
    // $auth.signOut()
    //   .then(function(resp) {
    //     currentUser.signOut(resp);
    //     // handle success response
    //   })
    //   .catch(function(resp) {
    //     // handle error response
    //   });
  // };

  $scope.switch = function(type) {
    authService.switchModal(type);
  }

  $scope.close = function() {
    authService.closeModal();
  }
}]);