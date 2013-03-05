Feature: Viewing the listings
  Background:
    Given there has been no activity

  Scenario: viewing the empty page
    When I visit the main page
    Then I should see no graph listed
    And I should see a friendly "Welcome" message
