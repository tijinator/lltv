angular.module('lltv')
.controller('searchModalCtrl', [
'$scope',
'searchModalService',
'CategoryService',
'searchCourseService',
'$http',
function($scope, searchModalService, CategoryService, searchCourseService, $http){

  $scope.openSearch = function(){
    searchModalService.openModal();
  }

  $scope.closeSearch = function(){
    searchModalService.closeModal();
  }

  // $scope.searchCourses = function(val){
  //   return $http.get('api/courses')
  //   .then(function(response){
  //     return response.data;
  //   });
  // }
  $scope.selected = undefined;

  $scope.searchCourses = [];

  $http.get('api/courses')
    .then(function(response){
      $scope.searchCourses = response.data;

      // $scope.startsWith = function(state, viewValue) {
      //   return state.substr(0, viewValue.length).toLowerCase() == viewValue.toLowerCase();
      // }

    });



  // console.log($scope.searchCourses);


// another way to do this but w/ two services
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

  // searchCourseService.getCourses().then(function(obj){
  //
  //   var coursesArr = [];
  //   var courseArrObj = obj.data;
  //
  //   for(var i = 0; i < courseArrObj.length; i++){
  //
  //     coursesArr.push(courseArrObj[i].title);
  //   }
  //
  //   $scope.complete=function(){
  //     console.log(coursesArr);
  //     $( "#tags" ).autocomplete({
  //       source: coursesArr,
  //       minLength: 2
  //     });
  //   }
  // });

}
]);
