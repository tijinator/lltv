angular.module('lltv', [
'ui.router',
'templates',
'ipCookie',
'ng-token-auth'])
.constant('baseUrl', 'http://lltv.com:3000')
.config([
'baseUrl',
'$stateProvider',
'$locationProvider',
'$urlRouterProvider',
'$authProvider',
function(baseUrl, $stateProvider, $locationProvider, $urlRouterProvider, $authProvider) {
  $locationProvider.html5Mode(true);

  $authProvider.configure({
    apiUrl: baseUrl + '/api/v1',
    handleLoginResponse: function(resp) {
      // currentUserProvider.set(resp);
      return resp.data;
    },
    handleTokenValidationResponse: function(resp) {
      return resp.data;
    }
  });

  $stateProvider
    .state('home', {
      url: '/',
      // templateUrl: 'home/_home.html',
      controller: 'MainCtrl',
      onEnter: function() {
        $('#lltv-app-content').hide();
        $('#landing-homepage').show();
      }
    })
    .state('signin', {
      url: '/sign_in',
      templateUrl: 'auth/_sign_in.html',
      controller: 'AuthCtrl',
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    })
    .state('register', {
      url: '/register',
      templateUrl: 'auth/_register.html',
      controller: 'AuthCtrl',
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    },
    .state('categories', {
      url: '/categories',
      templateUrl: 'categories/categories.html',
      controller: 'CategoriesCtrl',
      resolve: {
        featuredCourse: ['CategoriesService',
          function(categoriesService) {
            return categoriesService.getFeaturedCourse();
          }],
        categories: ['CategoriesService',
          function(categoriesService) {
            return categoriesService.getCategories();
          }]
      },
      controllerAs: 'categories'
    }
    .state('category', {
      url: '/categories/:id',
      templateUrl: 'categories/category.html',
      controller: 'CategoryCtrl',
      resolve: {
        category: ['$stateParams', 'CategoriesService',
          function($stateParams, categoriesService) {
            return categoriesService.getCategory($stateParams.id);
          }],
        videos: ['$stateParams', 'CategoriesService',
          function($stateParams, categoriesService) {
            return categoriesService.getCategoryVideos($stateParams.id);
          }]
        },
        controllerAs: 'category'
      }
    })));

    $urlRouterProvider.otherwise('/home');
}]);