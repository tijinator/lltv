angular.module('lltv')
.service('searchModalService', ['$uibModal', function($uibModal){

  // this.loginType = null;
  this.modalInstance = null;


  this.openModal = function(){
    var templateUrl = "nav/_search.html";

    this.modalInstance = $uibModal.open({
      animation: true,
      templateUrl: templateUrl,
      controller: 'searchModalCtrl',
      windowTopClass: 'auth-template',
      backdrop: 'static',
      backdropClass: 'auth-backdrop'
    });
  }

  this.closeModal = function() {
    this.modalInstance.dismiss('cancel');
  }
}]);
