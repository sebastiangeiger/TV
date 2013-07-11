'use strict';

angular.module('tvApp')
  .directive('searchresults', function () {
    return {
      template: "<ul><li ng-repeat='searchResult in results'><i>{{searchResult.name}}</i></li></ul>",
      restrict: 'E',
      scope: {
        results: '='
      }
    };
  });
