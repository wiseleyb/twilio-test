class Contact < ActiveRecord::Base
  belongs_to :contact_group
  has_many   :contact_logs
end
