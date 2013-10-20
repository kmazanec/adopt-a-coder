Feature: Homepage
  In order to see the homepage and its features
  As a visitor either donor or candidate
  I want to see what addopt a coder has to offer

  Scenario: Check out adopt a coder website
    Given I am not logged in
    When I go to the rootpage
    Then I should see the most recent candidate
    And I should see a how this works section
    And i should see frequently asked questions
    And I should see the most recent donations






