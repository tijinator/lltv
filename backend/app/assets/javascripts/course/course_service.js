angular.module('lltv')
.service('CourseService', [
'$http',
function($http) {
  this.getFeaturedCourse = function(id) {
    var url;
    if (id) {
      url = '/api/categories/featured_course' + '?Course_id=' + id;
    } else {
      url = '/api/categories/featured_course'
    }

    return $http.get(url);
  };

  this.getCourses = function() {
    return $http.get('/api/courses');
  };
  
  this.getCourse = function(id) {
    return $http.get('/api/courses/' + id);
  };

  /*this.getCourseCourses = function(id) {
    return $http.get('/api/categories/' + id + '/courses');
  };*/
}]);