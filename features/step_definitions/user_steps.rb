Given /^there is a user "(.*?)" with password "(.*?)"$/  do |email, password|
  step %{I am logged out}
  step %{I go to the signup page}
  step %{I click "Signup"}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I fill in "user_password_confirmation" with "#{password}"}
  step %{I press "Signup"}
end

Given /^I signup as "(.*?)" with password "(.*?)"$/ do |email, password|
  step %{there is a user "#{email}" with password "#{password}"}
end

Given /^I am logged out$/ do
  visit "/logout"
end

Then /^there should be a user "(.*?)"$/ do |email|
  User.where(email: email).count.should == 1
end
