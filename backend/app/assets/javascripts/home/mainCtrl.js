angular.module('lltv')
.controller('MainCtrl',
['$scope',
'$location',
'$http',
'$log',
function($scope,$location, $http, $log){
  $scope.isActive = function (route){
    if(route == $location.path()){
		return true;
    }else{
		return false;
    }
	}

  //get home api for popular courses and featured categories
  $http.get('api/home')
  .then(function(response){

    $scope.popularCourses = response.data.populars;

    $scope.homeCategories = response.data.categories;

  });

  $scope.slickConfig2 = {
    // enabled: true,
    method: {},
    // infinite: true,
    slidesToShow: 4,
    slidesToScroll: 4,
    arrows: true,
    centerMode: false,
    // autoplay: true,
    autoplaySpeed: 2000,
    draggable: true,
    // swipe: true,
    touchMove: true,
    variableWidth: true
  };

  $scope.toggleSlick = function() {
      $scope.slickConfig.enabled = !$scope.slickConfig2.enabled;
    }

}]);
