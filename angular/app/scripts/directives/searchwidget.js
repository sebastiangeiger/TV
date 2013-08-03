'use strict';

angular.module('tvApp')
  .directive('searchwidget', function () {
    return {
      templateUrl: "views/directives/searchwidget.html",
      restrict: 'E'
    };
  });
