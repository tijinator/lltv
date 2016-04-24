angular.module('lltv')
.controller('accountSettingCtrl', [
'$rootScope',
'$scope',
'currentUser',
'$auth',
'$cookieStore',
'$location',
// '$route',
function($rootScope, $scope, currentUser, $auth, $cookieStore, $location){
  var userObj = currentUser.getUserObj();
  //
  $scope.userEmail = userObj.email; //send current email to update form

  $scope.updateAccount = function() {
     $auth.updateAccount($scope.updateAccountForm)
       .then(function(resp) {
         // handle success response

       })
       .catch(function(resp) {
         // handle error response
       });
   };

   $rootScope.$on('auth:account-update-success', function(ev, userData) {

      $cookieStore.remove('userObj'); //remove current userObj cookie
      $cookieStore.put('userObj', userData.data); //update userObj cookie

      // $location.path("/account");
      // $route.reload();

   });
}]);
