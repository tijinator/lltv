angular.module('lltv')
.controller('profileUsernameCtrl', [
'$rootScope',
'$scope',
function($rootScope, $scope) {

  var profileName = function(userData){
    var spanTag = document.getElementById('profileName');
    var textTag = document.createTextNode(userData);
    spanTag.appendChild(textTag);
  }

  $rootScope.$on('auth:validation-success', function(ev, userData) {

    // $scope.profileFirstName = userData.first_name;
    // console.log($scope.profileFirstName);
    profileName(userData.first_name);

  });


}]);
