'use strict';

angular.module('tvApp')
  .directive('searchwidget', function () {
    return {
      template: "<div ng-controller='SearchCtrl'> <input type='text' id='search-query' autofocus='autofocus' ng-model='searchTerm' ng-change='updateSearchResults(searchTerm)' /> <searchresults results='searchResults'></searchresults> </div> ",
      restrict: 'E'
    };
  });
