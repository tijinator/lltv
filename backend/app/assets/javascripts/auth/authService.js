angular.module('lltv')
.service('AuthService', [
'$uibModal',
function($uibModal) {
  this.modalInstance = null;
  this.type = null;

  this.openModal = function(type) {
    this.type = type;
    var templateUrl = (type == 'register' ? 'auth/_register.html' : 'auth/_sign_in.html');
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

  this.switchModal = function(type) {
    this.modalInstance.dismiss('cancel');
    this.openModal(type);
  }
}]);