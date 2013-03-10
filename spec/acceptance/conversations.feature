# encoding: utf-8

@conversations
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
    When I visit the Conversations page
    Then I should see 10 results
    And I should see the results ordered by popularity

  Scenario: Listing a different page than one
    Given there had been 11 conversations
    When I visit the Conversations page 2
    Then I should see 1 result
    And I should see the results ordered by popularity

  Scenario: Sorting a listing by activity
    Given there had been 11 conversations
    When I visit the Conversations page
    And I click the link for sorting the list by activity
    Then I should see the conversations sorted by activity

  Scenario: Sorting a listing by recency
    Given there had been 11 conversations
    When I visit the Conversations page
    And I click the link for sorting the list by recency
    Then I should see the conversations sorted by recency
