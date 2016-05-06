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
 'AuthService',
 	function($scope, course, currentUser, AuthService) {


    // ROVSHEN
    var chapters = course.data.chapters,
    chapter  = chapters[0];
    $scope.chapter_video = chapter.video;
    

		$scope.chapters = course.data.chapters;
		// $scope.chapter = $scope.chapters[0];
		// console.log("chapter LOADED", $scope.chapters);

    //chapter video scopes default page onload
		$scope.chapter = $scope.chapters[0];
		$scope.video   = $scope.chapter.video.video_url
    $scope.booleanTest = function(){ return true;}
>>>>>>> 7bdf556249f91b68c59cf65c5bfac54c91345932

    //when user click on different chapters
		$scope.$on('chapters', function(e, position) {
<<<<<<< HEAD
			chapter = chapters[position-1];
			$scope.chapter_video = chapter.video;
=======

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

			$scope.chapter = $scope.chapters[position-1];
			$scope.video   = $scope.chapter.video.video_url;
      $scope.current_user = currentUser.getUserObj();


      var userObject = $scope.current_user;
      var chapterPosition = $scope.chapter.position;

      // if(chapterPosition > 1){
      //   $scope.positionBool = true;
      // }

      if(!userObject){
        if(chapterPosition > 1){
          // console.log("can't watch video unless you registered");
          $scope.booleanTest = function(){ return false }
          AuthService.openModal('unlockVideo');
        }else{
          // console.log('you may only watch the intro');
          $scope.booleanTest = function(){ return true }
          document.getElementById('my-video').addEventListener('ended',myHandler,false);
        }
      }else{
        //this is for the registered users
        console.log('test');
      }


      function myHandler(e) { AuthService.openModal('unlockVideo'); }

      // if(!$scope.booleanTest()){ AuthService.openModal('unlockVideo'); }


>>>>>>> 7bdf556249f91b68c59cf65c5bfac54c91345932
		});



	}
<<<<<<< HEAD
]);

=======
]).filter('trusted', ['$sce', function ($sce) {
    return function(url) {
        return $sce.trustAsResourceUrl(url);
    };
}]);
>>>>>>> 7bdf556249f91b68c59cf65c5bfac54c91345932
