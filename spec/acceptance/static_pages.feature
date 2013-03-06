# encoding: utf-8

Feature: Static Pages
  In order to gain insight into some fundamental overviews of this engine
  As a curious visitor
  I want to have quick access to succinct yet informative static pages

  Background:
    Given I am a new visitor

  # Scenario: Visiting the main page for the first time

  Scenario: Visiting the About page
    When I visit the about page
    Then I should see the "About" heading
    And I should see several fun photos
    And I should see a text wall exceeding no length warranting a "verbose" label

  Scenario: Visiting the Contact page
    When I visit the contact page
    Then I should see the "Contact" heading
    And I should see several email addresses
