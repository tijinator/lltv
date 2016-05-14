angular.module('lltv')
.controller('searchModalCtrl', [
'$scope',
'searchModalService',
'CategoryService',
'searchCourseService',
function($scope, searchModalService, CategoryService, searchCourseService){

  $scope.openSearch = function(){
    searchModalService.openModal();
  }

  $scope.closeSearch = function(){
    searchModalService.closeModal();
  }


  // CategoryService.getCategories().then(function(obj){
  //
  //   var categoryArr = [];
  //   var categoryArrObj = obj.data;
  //
  //   for(var i = 0; i < categoryArrObj.length; i++){
  //     // console.log(categoryArrObj[i].title);
  //
  //     categoryArr.push(categoryArrObj[i].title);
  //   }
  //
  //   $scope.complete=function(){
  //     console.log(categoryArr);
  //     $( "#tags" ).autocomplete({
  //       source: categoryArr,
  //       minLength: 2
  //     });
  //   }
  // });

  searchCourseService.getCourses().then(function(obj){
    // $scope.searchCategories = obj.data;

    var coursesArr = [];
    var courseArrObj = obj.data;

    for(var i = 0; i < courseArrObj.length; i++){

      coursesArr.push(courseArrObj[i].title);
    }

    $scope.complete=function(){
      console.log(coursesArr);
      $( "#tags" ).autocomplete({
        source: coursesArr,
        minLength: 2
      });
    }
  });

  // console.log($scope.searchCategories);

}
]);