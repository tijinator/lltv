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

  //set activeSetting to 1 to display account setting view on page load
  $scope.activeSetting = 1;

  //get current email on page load
  var userObj = currentUser.getUserObj(); //get currentUser object
  console.log(userObj);
  $scope.userEmail = userObj.email; //send current email to update form

  // update account email
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
      // $window.location.reload(); //refresh page
      // console.log('your email has been changed!');
      createMsgDiv();
   });

   var createMsgDiv = function(){
     var div = document.createElement('div');
     div.setAttribute('class', 'alert alert-success');

     var a = document.createElement('a');
     a.setAttribute('class', 'close');
     a.setAttribute('data-dismiss', 'alert');
     a.setAttribute('aria-label', 'close');

     var exitBtn = document.createTextNode('&times;')
     a.appendChild(exitBtn);

     var strong = document.createElement('strong');
     var strongText = document.createTextNode('Success! Email updated');
     strong.appendChild(strongText);

     div.appendChild(a);
     div.appendChild(strong);

     document.getElementById("updateMsg").appendChild(div);
   };

   //end update account email

   //udpate password
   $scope.updatePassword = function() {
      $auth.updatePassword($scope.changePasswordForm)
        .then(function(resp) {
          // handle success response
        })
        .catch(function(resp) {
          // handle error response
        });
    };

    $scope.$on('auth:password-change-success', function(ev) {
      alert("Your password has been successfully updated!");
    });

   //end update password

}]);
