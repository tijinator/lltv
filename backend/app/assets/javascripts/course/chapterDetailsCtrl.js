angular.module('lltv').controller('ChapterDetailsCtrl',
['$scope',
 'course',
 '$state',
  function($scope, course, $state) {
    var chapters = course.data.chapters,
        chapter  = chapters[0];
    // $scope.chapter_video = chapter.video;

    $scope.$on('chapters', function(e, position) {
      chapter = chapters[position-1];
      $scope.chapter_video = chapter.video;
    });

    $scope.getVideoPage = function(obj){
      console.log(obj);

      $state.go('video', {videoName: obj});
    }
  }
]);
