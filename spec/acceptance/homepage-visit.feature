# encoding: utf-8

Feature: Visiting the homepage
  In order to instantly grasp the utility of Loblaw
  As an Internet-savvy, self-proclaimed intellectual snob
  I want to see a main page conveying rich connections

  Background:
    Given I am a new visitor

  Scenario: Viewing the empty page
    Given there had been 0 conversations
    When I visit the Main page
    Then I should see no conversation listed
    And I should see a friendly "Welcome" message

  Scenario: Viewing an active page with a listing
    Given there had been 20 conversations
    When I visit the Main page
    Then I should see a conversation listed
    And I should see 10 recent conversations

  Scenario: Clicking on a specific conversation
    Given there had been 10 conversations
    And each conversation has had 3 messages
    When I visit the Main page
    And I click on the first conversation link
    Then I should be taken to the conversation page
