class HomeController < ApplicationController
  def index
    if params[:phone_number]
      require 'twilio-ruby'

      # Get your Account Sid and Auth Token from twilio.com/user/account
      app_config = YAML.load_file("#{Rails.root}/config/twilio.yml")[Rails.env]
      account_sid = app_config['account_sid']
      auth_token =  app_config['auth_token']
      @client = Twilio::REST::Client.new account_sid, auth_token

      message = @client.account.sms.messages.create(body: params[:message],
          :to => params[:phone_number],
          :from => app_config['phone_number'])
      render text: message.to_yaml
    end
  end
end
