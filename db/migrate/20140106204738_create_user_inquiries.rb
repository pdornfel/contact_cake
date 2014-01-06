class CreateUserInquiries < ActiveRecord::Migration
  def change
    create_table :user_inquiries do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :subject, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
