angular.module('lltv').service('CourseService', ['$http', function($http) {
  
  this.getCourses = function() {
    return $http.get('/api/courses');
  };
  
  this.getCourse = function(id) {
    return $http.get('/api/courses/' + id);
  };

}]);