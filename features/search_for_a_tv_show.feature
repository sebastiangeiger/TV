Feature: Searching for a TV show
  In order to add a show to my favorites
  As a user of the site
  I want to be able to search for a tv show

  @javascript
  Scenario: Typing the first two letters in the search box
    Given the TV show "Firefly" exists
    When I go to main page
    And I enter "Fi" into the search form
    Then I should see "Firefly" in the auto-complete list
