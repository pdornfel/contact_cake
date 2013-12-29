class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|

      t.string :fact, null:false
      t.integer :contact_id, null:false

      t.timestamps

    end
  end
end
