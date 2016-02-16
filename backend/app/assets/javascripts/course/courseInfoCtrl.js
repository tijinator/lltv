angular.module('lltv')
	.controller('CourseInfoCtrl', [
		'$scope',
		'course',
		function($scope, course) {
		  $scope.course = course.data;
		  console.log(course);

		  $scope.expAll = function(){
		  	alert("Expanding All");
		  }

		  $scope.collAll = function(){
		  	alert("Collapsing All");
		  }

		  $scope.chapter_title_1 = false;
		}
	]
);