angular.module('lltv').controller('ChapterVideoCtrl', 
['$scope',
 'course',
 	function($scope, course) {
		var chapters = course.data.chapters;
		var chapter  = chapters[0];
		$scope.video = chapter.video.video_url;

		$scope.$on('chapters', function(e, position) {
			chapter        = chapters[position-1];
			$scope.video   = chapter.video.video_url;
		});

		document.getElementById('my-video').addEventListener('ended', myHandler, false);
		function myHandler(e) {

			// using for save course_id to DB for payment
			localStorage.setItem('course_id', course.data.id);
			openModule('unlockVideo');
		}

	}
]).filter('trusted', ['$sce', function ($sce) {
    return function(url) {
        return $sce.trustAsResourceUrl(url);
    };
}]);