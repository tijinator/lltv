angular.module('lltv')
.service('AuthService', [
'$uibModal',
function($uibModal) {
  this.modalInstance = null;
  this.type = null;

  // this.openModal = function(type) {
  //   this.type = type;
  //   var templateUrl = (type == 'register' ? 'auth/_register.html' : 'auth/_sign_in.html');
  //   this.modalInstance = $uibModal.open({
  //     animation: true,
  //     templateUrl: templateUrl,
  //     controller: 'AuthCtrl',
  //     windowTopClass: 'auth-template',
  //     backdrop: 'static',
  //     backdropClass: 'auth-backdrop'
  //   });
  // };

  this.openModal = function(type) {
    this.type = type;
    if(type == 'register'){
      var templateUrl = 'auth/_register.html';
    }else if(type == 'signupBeforePayment'){
      var templateUrl = 'auth/_register_payment.html';
    }else if(type == 'signupPayment'){
      var templateUrl = 'auth/_payment_option.html';
    }else if(type == 'unlockVideo'){
      var templateUrl = 'auth/_unlock_video.html';
    }else{
      var templateUrl = 'auth/_sign_in.html';
    }
    this.modalInstance = $uibModal.open({
      animation: true,
      templateUrl: templateUrl,
      controller: 'AuthCtrl',
      windowTopClass: 'auth-template',
      backdrop: 'static',
      backdropClass: 'auth-backdrop'
    });
  };

  this.closeModal = function() {
    this.modalInstance.dismiss('cancel');
  }

  // this.switchModal = function(type) {
  //   var someval = registrationForm;
  //   console.log(someval);
  //   // localStorage.setItem("email", 'hi');
  //   this.closeModal();
  //   this.openModal(type);
  // }

  this.switchModal = function(type, obj) {
    // if obj is exists
    if(obj){
      //save registratioform values in localStorage

      //set obj values
      var email = obj.email;
      var username = obj.username;
      var first_name = obj.first_name;
      var last_name = obj.last_name;
      var password = obj.password;
      var password_confirmation = obj.password_confirmation;

      //save values in localStorage
      localStorage.setItem("email", email);
      localStorage.setItem("username", username);
      localStorage.setItem("first_name", first_name);
      localStorage.setItem("last_name", last_name);
      localStorage.setItem("password", password);
      localStorage.setItem("password_confirmation", password_confirmation);

    }

    this.closeModal();
    this.openModal(type);
  }

  this.switchModalPayment = function(type, obj) {
    //save registratioform values in localStorage

    //set obj values
    var email = obj.email;
    var username = obj.username;
    var first_name = obj.first_name;
    var last_name = obj.last_name;
    var password = obj.password;
    var password_confirmation = obj.password_confirmation;

    //save values in localStorage
    localStorage.setItem("email", email);
    localStorage.setItem("username", username);
    localStorage.setItem("first_name", first_name);
    localStorage.setItem("last_name", last_name);
    localStorage.setItem("password", password);
    localStorage.setItem("password_confirmation", password_confirmation);


    this.closeModal();
    this.openModal(type);
  }

}]);
