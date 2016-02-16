angular.module('lltv')
	.controller('CourseInfoCtrl', [
		'$scope',
		'course',
		function($scope, course) {
		  $scope.course = course.data;
		  console.log(course);
		  // var course_release = course.data.released_on;
		  // course_release = moment(course_release).format('MMMM Do YYYY');
		  // console.log(course_release);

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