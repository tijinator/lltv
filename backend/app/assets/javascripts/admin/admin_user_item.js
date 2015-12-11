app.directive('adminUserItem', [
'$http',
function($http) {
  return {
    scope: {
      user: '='
    },
    restrict: 'E',
    templateUrl: '_admin_user_item.html'
  }
}]);