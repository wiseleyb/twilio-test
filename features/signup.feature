Feature: Signup
  As a user
  I want to be able to signup
  In order to use the site

  Scenario: Signup
    Given I signup as "bob@email.com" with password "password"
    Then there should be a user "bob@email.com"
    Then I should see "User was successfully created"

  Scenario: Existing user
    Given I signup as "bob@email.com" with password "password"
    Then there should be a user "bob@email.com"
    Given I signup as "bob@email.com" with password "password"
    Then I should see "Email has already been taken"
