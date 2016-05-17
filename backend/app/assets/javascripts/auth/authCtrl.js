angular.module('lltv')
.controller('AuthCtrl', [
'$scope',
'$auth',
'currentUser',
'AuthService',
'$cookieStore',
function($scope, $auth, currentUser, authService, $cookieStore) {
  $scope.errors = '';

  $scope.submitRegistration = function(obj) {
    $scope.registrationForm = obj || $scope.registrationForm;
    $auth.submitRegistration($scope.registrationForm)
      .then(function(res) {
        $scope.close();
        localStorage.removeItem('course_id');

        $scope.submitLogin({email: $scope.registrationForm.email,
                            password: $scope.registrationForm.password});
        
      })
      .catch(function(res) {
        $("#form-submit-btn").removeProp('disabled');
        if (res.data.errors) {
          $scope.errors = res.data.errors.full_messages.join(', ');
          console.log('if', res.data.errors.full_messages.join(', '));
        }else if(res.data && res.data.includes('declined')){
          $scope.errors = 'Card Declined';
        }else{
          console.log('else: ', res.data);
        }
      })
  };

  $scope.submitLogin = function(obj) {
    $scope.loginForm = obj || $scope.loginForm;
    $auth.submitLogin($scope.loginForm)
      .then(function(resp) {
        $scope.close();
        $cookieStore.put('userObj', resp);
      })
      .catch(function(resp) {
         $scope.errors = "Email or Password invalid...";
      });
  };

  // $scope.switch = function(type) {
  //   authService.switchModal(type);
  // }

  $scope.switch = function(type, obj) {
    authService.switchModal(type, obj);
  }

  $scope.close = function() {
    authService.closeModal();
  }


// PAYMENT METHODS
var planObject = {};

  $scope.submitPaymentRegistration = function(){
    $("#form-submit-btn").prop('disabled', true);
    
    stripeToken(function(err, token){
      if (err){
        arrError = err.toString().split(' ');
        arrError.shift();
        $scope.errors = arrError.join(' ');
        throw err
      };

      // $scope.registerForm.stripe_card_token = token;
      // $scope.registerForm.product = 'monthly_versiom';

      $scope.registerForm.stripe_card_token = token;
      $scope.registerForm.options = [{planObject: planObject}, {orderInfo: $scope.paymentForm}];


      // console.log("register: ", $scope.registerForm);
      console.log("Payment: ", $scope.paymentForm);

      $scope.submitRegistration($scope.registerForm);
    });

  };

  $scope.mothlySubscription = function(){
    planObject = {plan: 'monthly_subs'}
  }

  $scope.oneTimePurchase = function(){
    planObject = {amount: 2000, course_id: localStorage.getItem('course_id')};
  }  


  function stripeToken(callback){
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));

      var card_info = {
        number    : $('#card_number').val(),
        cvc       : $('#card_code').val(),
        exp_month : $('#card_month').val(),
        exp_year  : $('#card_year').val()
      }

      Stripe.createToken(card_info, function(status, response){
          response.error ? error(response) : success(response)

          function success (response){
            var token = response.id;
            callback(null, token);
          }

          function error (response){
            $("#form-submit-btn").removeProp('disabled');
            var error = response.error.message;
            var err   = new Error(error);
            callback(err, null);
          }

      }) // end of Stripe Handler
  } // end of stripeToken


}]);
