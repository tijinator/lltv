angular.module('lltv')
.controller('searchModalCtrl', [
'$scope',
'searchModalService',
'CategoryService',
'searchCourseService',
'$http',
'$log',
'$location',
'$q',
function($scope, searchModalService, CategoryService, searchCourseService, $http, $log, $location, $q){

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

  //this is the right answer so far
  // $http.get('api/courses')
  // .then(function(response){
  //     $scope.searchCourses = response.data;
  // });


  $scope.courseSearchList = $http.get('api/courses', {cache: false});
  $scope.categorySearchList = $http.get('api/categories', {'cache': false});

  $q.all([$scope.categorySearchList, $scope.courseSearchList]).then(function(values) {

      $scope.searchCourseTest = values[0].data;
      $scope.searchCatTest = values[1].data;

      var a = values[0].data;
      var b = values[1].data;
      var c = a.concat(b); //c is now an an array with: ['a','b','c','d','e','f']
      $scope.searchResults = a.concat(b);
  });


  // console.log($scope.searchCourses);
  // $scope.$watch('selected', function(newValue, oldValue) {
  //     if (newValue){
  //       // $log.info('/100_Ages/' + $scope.selectedPerson.id);
  //       console.log($scope.selected.id);
  //       // $location.path('/courses/' + $scope.selected.id);
  //     }
  //   });


  $scope.onSelect = function($item, $model, $label){
    $scope.$item = $item;
    $scope.$model = $model;
    $scope.$label = $label;
    // $log.info($scope.$item);
    // $log.info($scope.$model);
    // $log.info($scope.$label);
    $location.path('/courses/' + $scope.$item.id);
    $scope.closeSearch();
  }


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
