# encoding: utf-8

@conversations
@conversation
Feature: Viewing a specific conversation
  In order to interact with the largest unit of data that I care for
  As a user interested in following or contributing to a focused discussion
  I want to experience an insanely unique and easy-to-use interface

  Background:
    Given I am a registered user
    And there had been a healthy level of activity site-wide

  @visual_benchmark
  Scenario: Viewing a brand new conversation without any activity
    Given a just-created conversation with only its inaugural message
    When I visit the Conversation page
    Then I should still be presented with a welcoming interface
    And I should only be mindful of a desire to contribute to a deserted conversation
    And I should not see blank regions scattered about
