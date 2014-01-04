class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :fact
      t.integer :contact_id

      t.timestamps
    end
  end
end
