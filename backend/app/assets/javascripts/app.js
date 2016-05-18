angular.module('lltv', [
'ui.router',
'ui.bootstrap',
'templates',
'ipCookie',
'ng-token-auth',
'ngCookies',
'lltvFilters',
'countrySelect',
'ngAnimate'])
.constant('baseUrl', 'http://beta.learninglibrary.tv')
.config([
'baseUrl',
'$stateProvider',
'$locationProvider',
'$urlRouterProvider',
'$authProvider',
'Rails',
function(baseUrl, $stateProvider, $locationProvider, $urlRouterProvider, $authProvider, Rails) {
  baseUrl = (Rails.env == 'production') ? 'http://beta.learninglibrary.tv' : 'http://lvh.me:3000'
  $locationProvider.html5Mode(true);

  $authProvider.configure({
      apiUrl: baseUrl + '/api',
      // tokenValidationPath:     '/auth/validate_token',
      // signOutUrl:              '/auth/sign_out',
      // emailRegistrationPath:   '/auth',
      // accountUpdatePath:       '/auth',
      // accountDeletePath:       '/auth',
      // confirmationSuccessUrl:  window.location.href,
      // passwordResetPath:       '/auth/password',
      // passwordUpdatePath:      '/auth/password',
      // passwordResetSuccessUrl: window.location.href,
      // emailSignInPath:         '/auth/sign_in',
      // storage:                 'cookies',
      // forceValidateToken:      false,
      // validateOnPageLoad:      true,
      // proxyIf:                 function() { return false; },
      // proxyUrl:                '/proxy',
      // omniauthWindowType:      'sameWindow',
      // tokenFormat: {
      //   "access-token": "{{ token }}",
      //   "token-type":   "Bearer",
      //   "client":       "{{ clientId }}",
      //   "expiry":       "{{ expiry }}",
      //   "uid":          "{{ uid }}"
      // },
      // cookieOps: {
      //   path: "/",
      //   expires: 9999,
      //   expirationUnit: 'days',
      //   secure: false,
      //   domain: 'lvh.me'
      // },
      // createPopup: function(url) {
      //   return window.open(url, '_blank', 'closebuttoncaption=Cancel');
      // },
      // parseExpiry: function(headers) {
      //   // convert from UTC ruby (seconds) to UTC js (milliseconds)
      //   return (parseInt(headers['expiry']) * 1000) || null;
      // },
      handleLoginResponse: function(response) {
        
        return response.data;
      },
      handleAccountUpdateResponse: function(response) {
        return response.data;
      },
      handleTokenValidationResponse: function(response) {
        return response.data;
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
    .state('aboutPage',{
      url: '/about',
      templateUrl: 'about/aboutPage.html'
    })
    .state('faqPage',{
      url: '/faq',
      templateUrl: 'about/faqPage.html'
    })
    .state('profileUsername', {
      templateUrl: 'profile/profileLayout.html',
    })
    .state('profileUsername.show',{
      url: '/users/:username',
      views: {
        profileSideBar: {
          templateUrl: 'profile/profileSideBar.html',
          controller: 'profileUsernameCtrl'
        },
        // profileVideoHistory: {
        //   templateUrl: 'profile/profileVideoHistory.html',
        // }
      },
      resolve: {
        auth: function($auth) {
          return $auth.validateUser();
        }
      },
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    })
    .state('accountSetting', {
      templateUrl: 'settingAccount/accountSettingLayout.html',
    })
    .state('accountSetting.show', {
      url: '/account',
      views: {
        accountSettingView: {
          templateUrl: 'settingAccount/accountSettingView.html',
          controller: 'accountSettingCtrl'
        }
      },
      resolve: {
        auth: function($auth) {
          return $auth.validateUser();
        }
      },
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    })
    .state('categories', {
      templateUrl: 'categories/categoriesLayout.html',
    })
    .state('categories.show', {
      url: '/categories',
      views: {
        
        // featuredCourse: {
        //   templateUrl: 'categories/featuredCourse.html',
        //   controller: 'FeaturedCourseCtrl',
        //   resolve: {
        //     featuredCourse: ['CategoryService',
        //       function(categoriesService) {
        //         return categoriesService.getFeaturedCourse(null);
        //       }
        //     ]
        //   }
        // },
        
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
        }
        // 'recommendedCourses@category.show': {
        //   templateUrl: 'category/categoryCourseList.html',
        //   controller: "CategoryCourseListCtrl",
        //   resolve: {
        //     courses: ['$stateParams', 'CategoryService',
        //       function($stateParams, categoriesService) {
        //         return categoriesService.getCategoryCourses($stateParams.id);
        //       }
        //     ]
        //   },
        // }
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
          controller: 'ChapterVideoCtrl'
        }
      },
      onEnter: function() {
        $('#landing-homepage').hide();
        $('#lltv-app-content').show();
      }
    });

    $urlRouterProvider.otherwise('/home');
}]);
