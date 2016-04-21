angular.module('lltv')
.factory('currentUser', [
'$rootScope',
'$auth',
'$http',
function($rootScope, $auth, $http) {
  var obj = {};
  // var set = function(userData) {
  //   // obj = userData;
  //   // // console.log("Current User Set: ", userData);
  //   angular.extend(obj, userData);
  // };

  var set = function(){

  }

  console.log($auth);
  console.log($rootScope);

  $rootScope.$watch( 'user.username', function (username) {
    if (angular.isDefined(username)){
      // use the ID, as it seems to be defined now
      localStorage.setItem("username", username);

      // remove the watch, because there's no more use for it
      // unwatch();
    }
  });

  // $rootScope.user_name = localStorage.getItem("username");
  // console.log($rootScope.user_name);


  // var unwatch = $rootScope.$watch( 'user.username', function (username) {
  //   if (angular.isDefined(username)){
  //     // use the ID, as it seems to be defined now
  //     console.log( username );
  //     angular.extend(obj, username);
  //     console.log(obj);
  //
  //     // remove the watch, because there's no more use for it
  //     unwatch();
  //   }
  // });


  var signOut = function() {
    $auth.signOut()
      .then(function(resp) {
        obj = null;
        console.log('Sign OUT - current_user', resp);
        localStorage.removeItem("username");
      })
      .catch(function(resp) {
        // alert("signOut error");
        console.log("signOut error");
      });
  }


//   function GetByUsername(username) {
//             return $http.get('/users/' + username).then(handleSuccess, handleError('Error getting user by username'));
//         }
//
//   function handleSuccess(res) {
//             return res.data;
//         }
//
//   function handleError(error) {
//       return function () {
//           return { success: false, message: error };
//       };
//   }
//
//   obj.GetByUsername = GetByUsername;

  obj.set  = set;
  obj.signOut = signOut;
  return obj;

}]);
