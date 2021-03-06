angular.module('lltv')
.controller('searchModalCtrl', [
'$scope',
'searchModalService',
'CategoryService',
'$http',
'$log',
'$location',
'$q',
'filterFilter',
function($scope, searchModalService, CategoryService, $http, $log, $location, $q, filterFilter){

  $scope.openSearch = function(){
    searchModalService.openModal();
  }

  $scope.closeSearch = function(){
    searchModalService.closeModal();
  }


  $scope.selected = '';

  //this is the right answer so far
  $http.get('api/search-all')
  .then(function(response){
      var searchData = response.data;

      $scope.getSearch = function (search) {

        var filtered = filterFilter(angular.copy(searchData), search);

        var results = _.chain(filtered)
          .groupBy('group')
          .map(function (g) {
            g[0].firstInGroup = true;  // the first item in each group
            return g;
          })
          .flatten()
          .value();

        return results;
      }

  });


  $scope.onSelect = function($item, $model, $label){
    $scope.$item = $item;
    $scope.$model = $model;
    $scope.$label = $label;
    // $log.info($scope.$item);
    // $log.info($scope.$model);
    // $log.info($scope.$label);
    if($scope.$item.group == "course"){
      $location.path('/courses/' + $scope.$item.id);
    }else {
      $location.path('/categories/' + $scope.$item.id);
    }
    $scope.closeSearch();
  }



  //previous work below this comment
  
  // $scope.searchCourses = [];

  // $scope.searchCourses = function(val){
  //   return $http.get('api/courses')
  //   .then(function(response){
  //     return response.data;
  //   });
  // }


  // $scope.courseSearchList = $http.get('api/courses', {'cache': false});
  // $scope.categorySearchList = $http.get('api/categories', {'cache': false});


  // $q.all([$scope.categorySearchList, $scope.courseSearchList]).then(function(values) {
  //
  //     var a = values[0].data;
  //     var b = values[1].data;
  //     var c = [];
  //
  //     c.push(a);
  //     c.push(b);
  //
  //     // console.log(c[0], 'categories');
  //     // console.log(c[1], 'courses');
  //     console.log(c, 'combo');
  //
  //     $scope.searchResults = c;
  // });

  // $q.all([$scope.categorySearchList, $scope.courseSearchList]).then(function(values) {
  //
  //     var a = values[0].data;
  //     var b = values[1].data;
  //
  //     // console.log(a, 'cats');
  //     // console.log(b, 'courses');
  //
  //     var c = a.concat(b);
  //     console.log(c, 'combo');
  //     $scope.searchResults = a.concat(b);
  // });


  // console.log($scope.searchCourses);
  // $scope.$watch('selected', function(newValue, oldValue) {
  //     if (newValue){
  //       // $log.info('/100_Ages/' + $scope.selectedPerson.id);
  //       console.log($scope.selected.id);
  //       // $location.path('/courses/' + $scope.selected.id);
  //     }
  //   });


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
