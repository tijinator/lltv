angular.module('lltv')
.controller('MainCtrl',
['$scope',
'$location',
'$http',
'$log',
'$timeout',
'$rootScope',
function($scope,$location, $http, $log, $timeout, $rootScope){
  $scope.isActive = function (route){
    if(route == $location.path()){
		return true;
    }else{
		return false;
    }
	}

  //get home api for popular courses and featured categories
  // $http.get('api/courses')
  $http.get('api/home')
  .then(function(response){

    $scope.popularCourses = response.data.populars;
    // console.log($scope.popularCourses);
    $scope.homeCategories = response.data.categories;

    $scope.dataLoaded = true;

  });

  $scope.dataLoaded = true;


  $scope.slickConfig2 = {
    // enabled: true,
    method: {},
    // infinite: true,
    // slidesToShow: 4,
    // slidesToScroll: 4,
    // arrows: true,
    // centerMode: false,
    // autoplay: true,
    // autoplaySpeed: 2000,
    // draggable: true,
    // swipe: true,
    // touchMove: true,
    variableWidth: true
  };


}]);
