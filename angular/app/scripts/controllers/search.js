'use strict';

angular.module('tvApp')
  .controller('SearchCtrl', function ($scope, $http) {
    $scope.searchResults = [];
    $scope.updateSearchResults = function(searchTerm){
      $http.post('/api/search', {query: searchTerm}).success(function(data) {
        $scope.searchResults = data["tv_shows"];
      });
    }
  });
