class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :group
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
