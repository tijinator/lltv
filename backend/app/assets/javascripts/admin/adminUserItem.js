app.directive('adminUserItem',
function() {
  return {
    scope: {
      user: '='
    },
    restrict: 'AE',
    // replace: true,
    templateUrl: 'admin/_admin_user_item.html'
  }
});