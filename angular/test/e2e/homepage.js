describe('my app', function() {
  it('should display the home page', function() {
    browser().navigateTo('/');
    expect(element('.hero-unit').text()).toContain('Enjoy coding! - Yeoman');
  });
});
