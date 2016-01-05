angular.module('lltv')
.service('CategoryService', [
'$http',
function($http) {
  this.getFeaturedCourse = function(id) {
    var url;
    if (id) {
      url = '/api/categories/featured_course' + '?category_id=' + id;
    } else {
      url = '/api/categories/featured_course'
    }

    return $http.get(url);
  };

  this.getCategories = function() {
    return $http.get('/api/categories').data;
  };
  
  this.getCategory = function(id) {
    return $http.get('/api/categories' + id).data;
  };

  this.getCategoryCourses = function(id) {
    return $http.get('/api/categories/' + id + '/courses').data;
  };
}]);