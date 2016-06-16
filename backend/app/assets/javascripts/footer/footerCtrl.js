angular.module('lltv')
.controller('FooterCtrl', ['$scope','$http',
function($scope, $http) {


	$scope.emailSubscription = function(data) {
		console.log(data.email);
        $http.post("/api/subscribe", data).success(function(data, status) {
            console.log("data: ", data);
            console.log("status: ", status);
        }).error(function(data, status) {
			console.log("data: ", data);
            console.log("status: ", status);
		})
	};

}
]);
