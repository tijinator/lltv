angular.module('lltv')
.service('searchCategoryCourseService', [
'$http',
function($http){

  this.getCategoryCourse = function(){
    return $http.get('api/search-all');
  }
}
]);
