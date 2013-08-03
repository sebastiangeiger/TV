describe('my app', function() {
  it('should display "The Wire" and "Firefly" when searching for "ire"', function() {
    browser().navigateTo('/');
    input('search-query').enter('ire');
    expect(repeater('ul#search-results li').count()).toEqual(2);
  });
});
