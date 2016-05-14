angular.module('lltv')
.service('searchCourseService', [
'$http',
function($http){

  this.getCourses = function(){
    return $http.get('api/courses');
  }
}
]);
