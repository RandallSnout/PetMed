class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.references :pets, index: true
      t.references :records, index: true
      t.string :vaccine
      t.date :start
      t.date :expiration

      t.timestamps null: false
    end
    add_foreign_key :shots, :pets
    add_foreign_key :shots, :records
  end
end
