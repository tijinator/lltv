app.controller('UsersCtrl', [
'$scope',
'users',
function($scope, users) {
  $scope.users = users.users;
}]);