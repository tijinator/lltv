angular.module('lltv')
.controller('searchModalCtrl', [
'$scope',
'searchModalService',
'CategoryService',
function($scope, searchModalService, CategoryService){

  $scope.openSearch = function(){
    searchModalService.openModal();
  }

  $scope.closeSearch = function(){
    searchModalService.closeModal();
  }


  CategoryService.getCategories().then(function(obj){
    // $scope.searchCategories = obj.data;

    var categoryArr = [];
    var categoryArrObj = obj.data;

    for(var i = 0; i < categoryArrObj.length; i++){
      // console.log(categoryArrObj[i].title);

      categoryArr.push(categoryArrObj[i].title);
    }
    // console.log(categoryArr);

    // console.log(categoryTitleArr);

    $scope.complete=function(){
      console.log(categoryArr);
      $( "#tags" ).autocomplete({
        source: categoryArr,
        minLength: 2
      });
    }
  });

  // console.log($scope.searchCategories);

}
]);
