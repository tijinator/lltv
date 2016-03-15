angular.module('lltv').controller('ChapterDetailsCtrl', 
['$scope',
 'course',
 	function($scope, course) {
		$scope.chapters = course.data.chapters;
		// $scope.chapter = $scope.chapters[0];
		// console.log("chapter LOADED", $scope.chapters);

		$scope.chapter = $scope.chapters[0];
		$scope.video   = $scope.chapter.videos[0].video_url

		$scope.$on('chapters', function(e, position) {
			$scope.chapter = $scope.chapters[position-1];
			$scope.video   = $scope.chapter.videos[0].video_url
		});
	}
]);

