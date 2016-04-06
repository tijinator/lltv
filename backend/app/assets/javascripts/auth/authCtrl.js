angular.module('lltv')
.controller('AuthCtrl', [
'$scope',
'$auth',
'currentUser',
'AuthService',
function($scope, $auth, currentUser, authService) {
  $scope.errors = '';

  $scope.submitRegistration = function() {
    $auth.submitRegistration($scope.registrationForm)
      .then(function(res) {
        $scope.close();
      })
      .catch(function(res) {
        // $scope.errors = res.data.errors.full_messages.join(', ');
        console.log('error in sign up');
      })
  };

  $scope.submitLogin = function(obj) {
    $auth.submitLogin($scope.loginForm)
      .then(function(resp) {
        $scope.close();
      })
      .catch(function(resp) {
         $scope.errors = "Email or Password invalid...";
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
