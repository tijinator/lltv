angular.module('lltv', [
'ui.router',
'ui.bootstrap',
'templates',
'ipCookie',
'ng-token-auth',
'lltvFilters',
'countrySelect',
'ngAnimate'])
// .constant('baseUrl', 'http://beta.learninglibrary.tv')
.constant('baseUrl', 'http://localhost:3000')
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
      // console.log(resp);
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
      abstract: true,
      templateUrl: 'category/categoryLayout.html'
    })
    .state('category.show', {
      url: '/categories/:id',
      resolve: {
        category: ['$stateParams', 'CategoryService',
          function($stateParams, categoriesService) {
            return categoriesService.getCategory($stateParams.id);
          }
        ]
      },
      views: {
        categoryInfo: {
          templateUrl: 'category/categoryInfo.html',
          controller: 'CategoryInfoCtrl'
        },
        categoryCourses: {
          templateUrl: 'category/categoryCourses.html',
          controller: "CategoryCoursesCtrl",
        },
        'trendingCourses@category.show': {
          templateUrl: 'category/categoryCourseList.html',
          controller: "CategoryCourseListCtrl",
          resolve: {
            courses: ['$stateParams', 'CategoryService',
              function($stateParams, categoriesService) {
                return categoriesService.getCategoryCourses($stateParams.id);
              }
            ]
          }
        },
        'recommendedCourses@category.show': {
          templateUrl: 'category/categoryCourseList.html',
          controller: "CategoryCourseListCtrl",
          resolve: {
            courses: ['$stateParams', 'CategoryService',
              function($stateParams, categoriesService) {
                return categoriesService.getCategoryCourses($stateParams.id);
              }
            ]
          },
        }
      },
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    })
    .state('courses', {
      abstract: true,
      templateUrl: 'course/courseLayout.html'
    })
    .state('courses.show', {
      url: '/courses/:id',
      resolve: {
        course: ['$stateParams', 'CourseService',
          function($stateParams, coursesService) {
            return coursesService.getCourse($stateParams.id);
          }
        ]
      },
      views: {
        courseInfo: {
          templateUrl: 'course/courseInfo.html',
          controller: 'CourseInfoCtrl'
        },
        'chapterDetails@courses.show': {
          templateUrl: 'course/chapterDetails.html',
          controller: 'ChapterDetailsCtrl'
        },
        'chapterVideo@courses.show': {
          templateUrl: 'course/chapterVideo.html',
          controller: 'ChapterDetailsCtrl'
        }
      },
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    });

    $urlRouterProvider.otherwise('/home');
}]);
