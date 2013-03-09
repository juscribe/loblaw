# encoding: utf-8

Feature: Browsing conversations
  In order to view conversations scoped to specific personal interests
  As a user enthusiastic about reading the best discussions thereof
  I want to see a navigation scheme that is both familiar and full-fledged

  Background:
    Given I am a new visitor

  Scenario: Listing 0 available conversations
    Given there had been 0 conversations
    When I visit the Conversations page
    Then I should see no results

  Scenario: Listing a bunch of conversations
    Given there had been 5 conversations
    When I visit the Conversations page
    Then I should see many results
    And I should see the results ordered by popularity

  Scenario: Listing a bunch of conversations exceeding the page limit
    Given there had been 11 conversations
    And the page limit has been set to 8
    When I visit the Conversations page
    Then I should see 8 results
    And I should see the results ordered by popularity
    And I should see the pagination controls
    And I should be on page 1

  @wip
  Scenario: Listing a different page than one
    Given there had been 11 conversations
    And the page limit has been set to 5
    When I visit the Conversations page 2
    Then I should see 5 results
    And I should see the results ordered by popularity
    And I should see the pagination controls
    And I should be on page 2
