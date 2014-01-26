Given(/^I logout$/) do
  step %{I go to the logout page}
end

Given(/^I login as "(.*?)" with password "(.*?)"$/) do |email, password|
  step %{I go to the login page}
  step %{I fill in "email" with "#{email}"}
  step %{I fill in "password" with "#{password}"}
  step %{I press "Log in"}
end

Then(/^I should be logged in$/) do
  # TODO - this is pretty lame
  step %{I should see "Logout"}
end
