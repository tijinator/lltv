// angular.module('lltv').config(function($sceDelegateProvider){

//   	$sceDelegateProvider.resourceUrlWhitelist([
// 	    // Allow same origin resource loads.
// 	    'self',
// 	    // Allow loading from our assets domain.  Notice the difference between * and **.
// 	    'https://s3.amazonaws.com/uat.lltv.com/**'


//   	// The blacklist overrides the whitelist so the open redirect here is blocked.
//   	// $sceDelegateProvider.resourceUrlBlacklist([
// 	  //   'http://myapp.example.com/clickThru**'
//   	// ]);

//   	]);
// })

angular.module('lltv').controller('ChapterDetailsCtrl',
['$scope',
 'course',
 	function($scope, course) {

		$scope.chapters = course.data.chapters;
		// $scope.chapter = $scope.chapters[0];
		// console.log("chapter LOADED", $scope.chapters);

		$scope.chapter = $scope.chapters[0];
		$scope.video   = $scope.chapter.video.video_url

		$scope.$on('chapters', function(e, position) {
			$scope.chapter = $scope.chapters[position-1];
			$scope.video   = $scope.chapter.video.video_url;

		});

    var testdummy = $scope.chapter;
    window.getChapterPosition = testdummy;


	}
]).filter('trusted', ['$sce', function ($sce) {
    return function(url) {
        return $sce.trustAsResourceUrl(url);
    };
}]);
