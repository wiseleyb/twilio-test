class ContactGroup < ActiveRecord::Base
  belongs_to :user
  has_many   :contacts, dependent: :destroy

  def import(file)
    # TODO clean this up
    # TODO make column names flexible/user-specified
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

end
