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
		var chapters = course.data.chapters,
		    chapter  = chapters[0];
		$scope.chapter_video = chapter.video;

		$scope.$on('chapters', function(e, position) {
			chapter = chapters[position-1];
			$scope.chapter_video = chapter.video;
		});
	}
]);

