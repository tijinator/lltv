angular.module('lltvFilters', []).filter('secondsToHHMM', function() {
  return function(input) {
  	d = new Date(0,0,0);
    return new Date(1970, 0, 1).setSeconds(input);
  };
});