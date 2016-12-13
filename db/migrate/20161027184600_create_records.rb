class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :fixed
      t.string :allergy
      t.string :behavior
      t.references :pet, index: true

      t.timestamps null: false
    end
    add_foreign_key :records, :pets
  end
end
