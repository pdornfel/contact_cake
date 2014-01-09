class AddContactPhotoToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_photo, :string
  end
end
