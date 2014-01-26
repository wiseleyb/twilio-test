Feature: Login
  As a user
  I want to be able to signup
  In order to use the site

  Background:
    Given I signup as "bob@email.com" with password "password"
    And I logout

  Scenario: I can login
    Given I login as "bob@email.com" with password "password"
    Then I should be logged in
