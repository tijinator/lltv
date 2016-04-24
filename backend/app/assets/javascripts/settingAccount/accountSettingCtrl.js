angular.module('lltv')
.controller('accountSettingCtrl', [
'$rootScope',
'$scope',
'currentUser',
'$auth',
'$cookieStore',
'$location',
'$window',
function($rootScope, $scope, currentUser, $auth, $cookieStore, $location, $window){
  var userObj = currentUser.getUserObj(); //get currentUser object

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
      $window.location.reload(); //refresh page
   });
}]);
