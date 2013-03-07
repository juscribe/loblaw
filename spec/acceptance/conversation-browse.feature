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

  # Scenario: Listing a bunch of conversations
  #   Given there had been 20 conversations
  #   When I visit the conversations page
  #   Then I should see many results
  #   And I should see the results ordered by popularity


