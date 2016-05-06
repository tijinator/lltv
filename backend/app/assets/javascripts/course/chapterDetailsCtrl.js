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
 'currentUser',
 	function($scope, course, currentUser) {

		$scope.chapters = course.data.chapters;
		// $scope.chapter = $scope.chapters[0];
		// console.log("chapter LOADED", $scope.chapters);

    //chapter video scopes default page onload
		$scope.chapter = $scope.chapters[0];
		$scope.video   = $scope.chapter.video.video_url
    $scope.booleanTest = function(){ return true;}
    $scope.current_user = currentUser.getUserObj();

    //when user click on different chapters
		$scope.$on('chapters', function(e, position) {
			$scope.chapter = $scope.chapters[position-1];
			$scope.video   = $scope.chapter.video.video_url;


      // $scope.booleanTest = function(){
      //   if(!$scope.current_user){
      //     if($scope.chapter.position > 1){
      //       console.log("can't watch video unless you registered");
      //       return false;
      //     }else{
      //       console.log('you may only watch the intro');
      //       return true;
      //     }
      //   }else{
      //     //this is for the registered users
      //     console.log('test');
      //   }
      //
      // }

		});

	}
]).filter('trusted', ['$sce', function ($sce) {
    return function(url) {
        return $sce.trustAsResourceUrl(url);
    };
}]);
