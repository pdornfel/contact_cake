class EditContacts < ActiveRecord::Migration
  def up
    remove_column :contacts, :user_id
    add_column :contacts, :user_id, :integer
  end

  def down
    add_column :contacts, :user_id, :integer
  end
end
