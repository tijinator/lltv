angular.module('lltv').controller('CourseInfoCtrl', 
['$scope', 
 'course',
 function($scope, course) {
	  $scope.course = course.data;

	  $scope.expAll = function(){
	  	alert("Expanding All");
	  }

	  $scope.collAll = function(){
	  	alert("Collapsing All");
	  }

	  $scope.chapters = function(position) {
		$scope.$broadcast( 'chapters', position);
			setTimeout(function() {
				document.getElementById("my-video").load();
			}, 500);
	  }

 }
]);