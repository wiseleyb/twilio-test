class CreateContactLogs < ActiveRecord::Migration
  def change
    create_table :contact_logs do |t|
      t.integer :user_id
      t.integer :contact_group_id
      t.integer :contact_id
      t.timestamps
    end
  end
end
