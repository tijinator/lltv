angular.module('lltv')
.controller('searchModalCtrl', [
'$scope',
'searchModalService',
function($scope, searchModalService){

  $scope.openSearch = function(){
    searchModalService.openModal();
  }

  $scope.closeSearch = function(){
    searchModalService.closeModal();
  }
}
]);
