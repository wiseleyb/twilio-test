Feature: Signup
  As a user
  I want to be able to signup
  In order to use the site

  Scenario: Signup
    When I go to the users page
    And I click "New User"
    And I fill in "user_email" with "bob@email.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I press "Signup"
    Then I should see "bob@email.com"
    Then I should not see "prohibited"
