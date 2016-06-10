angular.module('lltv').controller('ChapterVideoCtrl',
['$scope',
 'course',
 'currentUser',
 'AuthService',
 	function($scope, course, currentUser, AuthService) {
    $scope.currentCourse = course.data;
		var chapters = course.data.chapters;
		var chapter  = chapters[0];
		// $scope.video = chapter.video.video_url;
		$scope.booleanTest = true;

		$scope.$on('chapters', function(e, position) {
			chapter        = chapters[position-1];
      // $scope.video   = chapter.video.video_url;

      try{
        $scope.video   = chapter.video.video_url;
      }
      catch(err){
        console.log("i, the video, don't exist bruh! :(")
      }

			// Martin Branch
		      $scope.current_user = currentUser.getUserObj();
		      var userObject = $scope.current_user;
		      var chapterPosition = chapter.position;

		      if(chapterPosition > 1){
		        $scope.positionBool = true;
		      }

		      if(!userObject){
		        if(chapterPosition > 1){
		          // console.log("can't watch video unless you registered");
		          $scope.booleanTest = false;
		          myHandler();
		        }else if(chapterPosition == 1){
		          // console.log('you may only watch the intro');
		          $scope.booleanTest = true;
		          // myHandler();
              document.getElementById('my-video').addEventListener('ended', myHandler, false);
		        }
		      }else{
		        //this is for the registered users
		        console.log('test');
		      }

		}); // end of Chapters scope.on

		// document.getElementById('my-video').addEventListener('ended', myHandler, false);
		// function myHandler(e) {
    //
		// 	// using for save course_id to DB for payment
		// 	localStorage.setItem('course_id', course.data.id);
    //
		// 	// openModule('unlockVideo'); Russel's
		// 	AuthService.openModal('unlockVideo');
		// }

} //end of function
]).filter('trusted', ['$sce', function ($sce) {
    return function(url) {
        return $sce.trustAsResourceUrl(url);
    };
}]);
