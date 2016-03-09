angular.module('lltv')
.controller('AuthCtrl', [
'$scope',
'$auth',
'currentUser',
'AuthService',
function($scope, $auth, currentUser, authService) {
  $scope.errors = '';

  $scope.submitRegistration = function() {
    localStorage.setItem("email", $scope.registrationForm.email);
    localStorage.setItem("password", $scope.registrationForm.password);
    console.log(localStorage.email, localStorage.password);
    $auth.submitRegistration($scope.registrationForm)
      .then(function(res) {
        $auth.submitLogin({'email': localStorage.email, 'password': $scope.registrationForm.password});
        currentUser.set(res.data.data);
        localStorage.clear();
        $scope.close();
      })
      .catch(function(res) {
        // handle error response
        // console.log("REGISTRATION ERROR - Auth.JS", res.data.errors.full_messages);
        $scope.errors = res.data.errors.full_messages.join(', ');
      })
  };

  $scope.submitLogin = function() {
    console.log($scope.loginForm);
    $auth.submitLogin($scope.loginForm)
      .then(function(resp) {
        currentUser.set(resp);
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