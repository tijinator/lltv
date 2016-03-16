angular.module('lltv')
.controller('AuthCtrl', [
'$scope',
'$auth',
'currentUser',
'AuthService',
function($scope, $auth, currentUser, authService) {
  $scope.errors = '';

  $scope.submitRegistration = function() {
    var obj = {"email": $scope.registrationForm.email, "password": $scope.registrationForm.password};
    $auth.submitRegistration($scope.registrationForm)
      .then(function(res) {
        $scope.submitLogin(obj);
        $scope.close();
        delete obj;
      })
      .catch(function(res) {
        // handle error response
        // console.log("REGISTRATION ERROR - Auth.JS", res.data.errors.full_messages);
        $scope.errors = res.data.errors.full_messages.join(', ');
        delete obj;
      })
  };

  $scope.submitLogin = function(obj) {
    $scope.loginForm = obj || $scope.loginForm;
    $auth.submitLogin($scope.loginForm)
      .then(function(resp) {
        currentUser.set(resp);
        // console.log("login",  resp);
        $scope.close();
      })
      .catch(function(resp) {
        // alert('login error');
        // console.log('authCtrl - login error', resp.errors);
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
