angular.module('lltv')
.controller('CategoryCoursesCtrl', [
'$scope',
'category',
'CategoryService',
function($scope, category, CategoryService) {
	$scope.category_details = category.data;

	$scope.getSubs = function(id){
    category.data.subcategory.forEach(function(sub) {
    	if (sub.id === id){ $scope.subcategory = sub.title }
    });

    CategoryService.getCategoryCourses(id).then(function(courses) {
    	$scope.$broadcast( 'subcategory', courses);
    });

    scrollToCourses();
  }

  $scope.all_courses = function(id){
    // category.data.subcategory.forEach(function(sub) {
    // 	if (sub.id === id){ $scope.subcategory = sub.title }
    // });
    $scope.subcategory = 'All';

    CategoryService.getCategoryCourses(id).then(function(courses) {
    	$scope.$broadcast( 'subcategory', courses);
    });

    scrollToCourses();

  }

  function scrollToCourses(){
    if ($(window).width() < 767) {

      $('html, body').animate({
          scrollTop: $(".category-trending-courses").offset().top - 95
      }, 600, "easeOutCirc", function(){});

    }
  }

}]);
