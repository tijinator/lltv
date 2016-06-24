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
      var backdropClass = 'auth-backdrop';
    }else if(type == 'signupBeforePayment'){
      var templateUrl = 'auth/_register_payment.html';
      var backdropClass = 'auth-backdrop';
    }else if(type == 'signupPayment'){
      var templateUrl = 'auth/_payment_option.html';
      var backdropClass = 'auth-backdrop';
    }else if(type == 'unlockVideo'){
      var templateUrl = 'auth/_unlock_video.html';
      // var backdropClass = 'unlock-backdrop';
      // var backdropClass = 'auth-backdrop';
    }else if(type == 'resetPassword'){
      // var templateUrl = 'auth/_reset_password.html';
      var templateUrl = 'auth/_payment_option.html';
      var backdropClass = 'auth-backdrop';
    }else{
      var templateUrl = 'auth/_sign_in.html';
      var backdropClass = 'auth-backdrop';
    }
    this.modalInstance = $uibModal.open({
      animation: true,
      templateUrl: templateUrl,
      controller: 'AuthCtrl',
      windowTopClass: 'auth-template',
      backdrop: 'static',
      backdropClass: backdropClass
    });
  };

  this.closeModal = function() {
    this.modalInstance.dismiss('cancel');
  }


  this.switchModal = function(type, obj) {
    localStorage.setItem('data', obj);

    this.closeModal();
    this.openModal(type);
  }

}]);
