angular.module('lltv').controller('CourseInfoCtrl', ['$scope', 'course', function($scope, course) {
		  $scope.course = course.data;

		  $scope.expAll = function(){
		  	alert("Expanding All");
		  }

		  $scope.collAll = function(){
		  	alert("Collapsing All");
		  }

		  $scope.chapter_title_1 = false;
		}
	]
).filter('capitalize', function() {
  return function(input, scope) {
    if (input!=null)
    input = input.toLowerCase();
    return input.substring(0,1).toUpperCase()+input.substring(1);
  }
});;