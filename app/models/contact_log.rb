class ContactLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact_group
  belongs_to :contact
end
