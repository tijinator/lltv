angular.module('lltv')
.service('CategoryService', [
'$http',
function($http) {
  this.getFeaturedCourse = function() {
    return $http.get('/api/categories/featured_course');
  };

  this.getCategories = function() {
    return $http.get('/api/categories');
  };
  
  this.getCategory = function(id) {
    return $http.get('/api/categories' + id);
  };

  this.getCategoryCourses = function(id) {
    return $http.get('/api/categories/' + id + '/courses');
  };
}]);