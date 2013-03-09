# encoding: utf-8

Feature: Static Pages
  In order to gain insight into some fundamental overviews of this engine
  As a curious visitor
  I want to have quick access to succinct yet informative static pages

  Background:
    Given I am a new visitor

  # Scenario: Visiting the main page for the first time

  Scenario: Visiting the About page
    When I visit the About page
    Then I should see the "About" heading
    And I should see several fun photos
    And I should see a text wall exceeding no length warranting a "verbose" label

  Scenario: Visiting the Contact page
    When I visit the Contact page
    Then I should see the "Contact" heading
    And I should see several email addresses

  Scenario: Visiting the FAQ page
    When I visit the FAQ page
    Then I should see the "Frequently Asked Questions" heading
    And I should see at least 5 questions with answers

  Scenario: Visiting the Help page
    When I visit the Help page
    Then I should see the "Help" heading
    And I should see at least 4 sections

  Scenario: Visiting the Terms page
    When I visit the Terms page
    Then I should see the "Terms of Service" heading
    And I should see a bunch of legal jargon
