app.controller('AdminUsersCtrl', [
'$scope',
'users',
function($scope, users) {
  $scope.users = users.users;
}]);