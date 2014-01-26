class ChangeContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :user_id
    remove_column :contacts, :group
    add_column :contacts, :contact_group_id, :integer
  end
end
