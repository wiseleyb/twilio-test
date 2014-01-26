Given /^there is a user "(.*?)" with password "(.*?)"$/  do |email, password|
  step %{I am logged out}
  step %{I go to the signup page}
  step %{I click "Signup"}
  step %{I fill in "user_name" with "#{email.split('@').first}"}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I fill in "user_password_confirmation" with "#{password}"}
  step %{I press "Signup"}
  @user = User.find_by_email(email)
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

When(/^I enter my twilio information$/) do
  # TODO - evenutally need to figure out how to test twilio
  step %{I fill in "user_twilio_account_sid" with "abcd"}
  step %{I fill in "user_twilio_auth_token" with "xyz"}
  step %{I fill in "user_twilio_phone_number" with "+14155551212"}
end

Then(/^it should save my twilio information$/) do
  # TODO - evenutally need to figure out how to test twilio
  @user.reload.twilio_account_sid.should == 'abcd'
  @user.twilio_auth_token.should == 'xyz'
  @user.twilio_phone_number.should == '+14155551212'
end
