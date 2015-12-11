var app;

app = angular.module('lltv', [
'ui.router',
'templates',
'ipCookie',
'ng-token-auth']);

app.constant('baseUrl', 'http://lltv.com:3000');

app.config([
'baseUrl',
'$stateProvider',
'$urlRouterProvider',
'$authProvider',
function(baseUrl, $stateProvider, $urlRouterProvider, $authProvider) {
  $authProvider.configure({
    apiUrl: baseUrl,
    handleLoginResponse: function(resp) {
      // currentUserProvider.set(resp);
      return resp.data;
    },
    handleTokenValidationResponse: function(resp) {
      return resp.data;
    }
  });

  $stateProvider
  //   .state('Admin', {
  //     url: '/admin',
  //     templateUrl: 'admin/_admin.html',
  //     controller: 'AdminCtrl'
  // //   })
    .state('users', {
      url: '/admin/users',
      templateUrl: 'admin/_users.html',
      controller: 'AdminUsersCtrl',
      resolve: {
        usersPromise: ['users', function(users) {
          return users.getAll();
        }]
      }
    })
  //   .state('home', {
  //     url: '/home',
  //     templateUrl: 'home/_home.html',
  //     controller: 'MainCtrl'
  //   })
    .state('login', {
      url: '/login',
      templateUrl: 'auth/_login.html',
      controller: 'AuthCtrl'
    })
    .state('register', {
      url: '/register',
      templateUrl: 'auth/_register.html',
      controller: 'AuthCtrl',
    });

    $urlRouterProvider.otherwise('/admin/users');
}]);