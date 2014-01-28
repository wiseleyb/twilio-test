class ContactGroup < ActiveRecord::Base
  belongs_to :user
  has_many   :contacts, dependent: :destroy
  has_many   :contact_logs, dependent: :destroy

  def import(file)
    # TODO clean this up
    # TODO make column names flexible/user-specified
    # TODO async this
    require 'csv'
    csv = CSV.read(file)
    header = csv[0]
    (1..csv.size).each do |i|
      row = Hash[[header, csv[1]].transpose]

      fields = {
        contact_group_id: self.id,
        name: row["Name"],
        phone: row["Phone"]
      }

      contact = Contact.where(fields).first

      if contact.nil?
        Contact.create!(fields)
      end
    end
  end

  def send_text_messages(message)
    # TODO this needs to be async
    require 'twilio-ruby'

    client = self.user.twilio_client

    self.contacts.find_each do |c|
      client.account.sms.messages.create(
          body: message,
          to:   c.phone,
          from: self.user.twilio_phone_number)
      ContactLog.create!(user_id: self.user_id,
                         contact_group_id: self.id,
                         contact_id: c.id)
    end
  end
end
