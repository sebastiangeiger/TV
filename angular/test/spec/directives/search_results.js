'use strict';

describe('Directive: searchResults', function () {
  beforeEach(module('tvApp'));

  var element;

  it('should make hidden element visible', inject(function ($rootScope, $compile) {
    element = angular.element('<search-results></search-results>');
    element = $compile(element)($rootScope);
    expect(element.text()).toBe('this is the searchResults directive');
  }));
});
