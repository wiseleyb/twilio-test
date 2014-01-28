class ContactGroup < ActiveRecord::Base
  belongs_to :user
  has_many   :contacts, dependent: :destroy
  has_many   :contact_logs, dependent: :destroy

  attr_accessor :file

  validates :group_name, presence: true
  validates :file, csv: true, allow_blank: true, allow_nil: true

  after_save :import_file

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

  def upload_file(file)
    csv_file = File.open(file)
    return ActionDispatch::Http::UploadedFile.new(
      tempfile: csv_file,
      filename: File.basename(csv_file))
  end

  def import_file
    if file
      import(file.path)
    end
  end
end
