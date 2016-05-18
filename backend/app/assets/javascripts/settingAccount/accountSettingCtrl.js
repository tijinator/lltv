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

  // console.log(userObj);

  $scope.userEmail = userObj.email; //send current email to update form

  //send personal info parameters
  $scope.userFirstName = userObj.first_name;
  $scope.userLastName = userObj.last_name;
  $scope.userJobTitle = userObj.job_title;
  $scope.userCompanyName = userObj.company_name;
  $scope.userWebsite = userObj.website;
  $scope.userLocation = userObj.location;

  //update personal info
  $scope.updatePersonal = function() {
     $auth.updateAccount($scope.updatePersonalForm)
       .then(function(resp) {
         // handle success response
         var successMsg = 'Success! Info updated';
         var elementID = 'updateInfoMsg';
         var name = resp.data.data.first_name;
         document.getElementById('userFirstName').innerHTML = name; //update first name on spot!
         createMsgDiv(successMsg, elementID);
       })
       .catch(function(resp) {
         // handle error response
         console.log('error dude: ', resp);
       });
   };


  // update account email
  $scope.updateAccount = function() {
     $auth.updateAccount($scope.updateAccountForm)
       .then(function(resp) {
         // handle success response
         var successMsg = 'Success! Email updated';
         var elementID = 'updateEmailMsg';
         createMsgDiv(successMsg, elementID);
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

   });

   var createMsgDiv = function(successMsg, elementID){
     var div = document.createElement('div');
     div.setAttribute('class', 'alert alert-success');

     var a = document.createElement('a');
     a.setAttribute('class', 'close');
     a.setAttribute('data-dismiss', 'alert');
     a.setAttribute('aria-label', 'close');

     var exitBtn = document.createTextNode("X")
     a.appendChild(exitBtn);

     var strong = document.createElement('strong');
     var strongText = document.createTextNode(successMsg);
     strong.appendChild(strongText);

     div.appendChild(a);
     div.appendChild(strong);

     var childBool = document.getElementById(elementID).hasChildNodes();

     if(childBool){
       document.getElementById(elementID).innerHTML = '';
     }
     document.getElementById(elementID).appendChild(div);

   };

   //end update account email

   //udpate password
   $scope.updatePassword = function() {
      $auth.updatePassword($scope.changePasswordForm)
        .then(function(resp) {
          // handle success response
          var successMsg = 'Success! Password updated';
          var elementID = 'updateEmailMsg';
          createMsgDiv(successMsg, elementID);
        })
        .catch(function(resp) {
          // handle error response
        });
    };

    $scope.$on('auth:password-change-success', function(ev) {
      // alert("Your password has been successfully updated!");

    });

   //end update password


}]);
