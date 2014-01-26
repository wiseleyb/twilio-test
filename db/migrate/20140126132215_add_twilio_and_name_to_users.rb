class AddTwilioAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :twilio_account_sid, :string
    add_column :users, :twilio_auth_token, :string
    add_column :users, :twilio_phone_number, :string
  end
end
