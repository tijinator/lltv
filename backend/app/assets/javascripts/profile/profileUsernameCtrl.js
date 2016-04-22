angular.module('lltv')
.controller('profileUsernameCtrl', [
'$rootScope',
'$scope',
'currentUser',
function($rootScope, $scope, currentUser) {
  // $scope.current_user = $scope.user.first_name;
  // $scope.current_user = $rootScope.user_name;
  // console.log(currentUser);
  $scope.current_user = localStorage.getItem("username");

  var set = function(userData){
    // angular.extend(userObject, userData)
    // $scope.userdude = userData;
    console.log(userData);
    User.get().$promise.then(function(user){
      $scope.userdude = user;
    });

  }

  $rootScope.$on('auth:login-success', function(ev, userData) {

    set(userData);
  });

  // console.log($scope.userdude);

  // var post_query = function(){
  //       Post.query().then(function(posts){
  //         $scope.posts = posts;
  //       });
  //     }


}]);
