angular.module('lltv', [
'ui.router',
'ui.bootstrap',
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
    // .state('signin', {
    //   url: '/sign_in',
    //   templateUrl: 'auth/_sign_in.html',
    //   controller: 'AuthCtrl',
    //   onEnter: function() {
    //     $('#landing-homepage').hide();
    //     $('#lltv-app-content').show();
    //   }
    // })
    // .state('register', {
    //   url: '/register',
    //   templateUrl: 'auth/_register.html',
    //   controller: 'AuthCtrl',
    //   onEnter: function() {
    //     $('#landing-homepage').hide();
    //     $('#lltv-app-content').show();
    //   }
    // })
    .state('categories', {
      templateUrl: 'categories/categoriesLayout.html',
    })
    .state('categories.show', {
      url: '/categories',
      views: {
        featuredCourse: {
          templateUrl: 'categories/featuredCourse.html',
          controller: 'FeaturedCourseCtrl',
          resolve: {
            featuredCourse: ['CategoryService',
              function(categoriesService) {
                return categoriesService.getFeaturedCourse(null);
              }
            ]
          }
        },
        categoryLibrary: {
          templateUrl: 'categories/categoryLibrary.html',
          controller: 'CategoryLibraryCtrl',
          resolve: {
            categories: ['CategoryService',
              function(categoriesService) {
                return categoriesService.getCategories();
              }
            ]
          }
        }
      },
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    })
    .state('category', {
      templateUrl: 'category/categoryLayout.html'
    })
    .state('category.show', {
      url: '/categories/:id',
      views: {
        categoryInfo: {
          templateUrl: 'category/categoryInfo.html',
          controller: 'CategoryInfoCtrl',
          resolve: {
            category: ['$stateParams', 'CategoryService',
              function($stateParams, categoriesService) {
                return categoriesService.getCategory($stateParams.id);
              }
            ]
          }
        },
        categoryCourses: {
          templateUrl: 'category/categoryCourses.html'
        },
        'trendingCourses@category.show': {
          templateUrl: 'category/trendingCourses.html',
          controller: "TrendingCoursesCtrl"
        },
        'recommendedCourses@category.show': {
          templateUrl: 'category/recommendedCourses.html',
          controller: "TrendingCoursesCtrl"
        }
      },
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    });

    $urlRouterProvider.otherwise('/home');
}]);