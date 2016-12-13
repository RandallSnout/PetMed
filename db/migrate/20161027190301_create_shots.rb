class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.references :pet, index: true
      t.references :record, index: true
      t.string :vaccine
      t.date :start
      t.date :expiration

      t.timestamps null: false
    end
    add_foreign_key :shots, :pet
    add_foreign_key :shots, :records
  end
end
