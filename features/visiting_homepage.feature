Feature: Visiting Homepage
  In order for users spread the word about donations
  As a donator
  I want to spread the word on facebook

  Scenario: Visiting facebook from the hoempage
    Given I am at the homepage
    When I follow the link to facebook
    Then I should be able to spread the word on facebook.

  Scenario: Visiting twitter from the hoempage
    Given I am at the homepage
    When I follow the link to Tweet
    Then I should be able to spread the word on twitter.

  Scenario: Emailing from the hoempage
    Given I am at the homepage
    When I follow the link to Email
    Then I should be able to spread the word on via email.
