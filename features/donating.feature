Feature: Daonating
  In order for donators to donate
  As a donator
  I want to press a button and donate

  Scenario: Visiting homepage
    Given I am at the homepage
    When I click Donate
    Then I should be able to donate
