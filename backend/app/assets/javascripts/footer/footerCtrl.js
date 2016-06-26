angular.module('lltv')
.controller('FooterCtrl', ['$scope','$http','currentUser', '$location', 'AuthService',
function($scope, $http, currentUser, $location, AuthService) {
	var userStatus = currentUser.getUserObj();
	var userFirstName = userStatus.first_name;

	//check if user is logged in
	$scope.isLoggedIn = function(){
		if(userStatus){
			$location.path("/users/" + userFirstName);
		}else{
			AuthService.openModal('signin');
		}
	}

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
