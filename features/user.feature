Feature: User
  As a user
  I want to be able to manage my account
  In order to use the site

  Background:
    Given I signup as "bob@email.com" with password "password"

  Scenario: Edit
    When I go to the edit_user page
    And I enter my twilio information
    And I press "Update"
    Then it should save my twilio information
