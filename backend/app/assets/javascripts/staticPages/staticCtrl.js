angular.module('lltv')
.controller('StaticCtrl', [
'$scope',
function($scope) {
    $scope.goToElement = function(msg){
      msg = '#' + msg; //add # to msg, can't add # when passing the string in function

      // console.log(msg);

      $('body').animate({
          scrollTop: $(msg).offset().top - 95
      }, 600, "easeOutCirc");
  }

}]);
