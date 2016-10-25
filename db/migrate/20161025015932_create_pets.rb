class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :sex
      t.string :species
      t.float :age
      t.string :color
      t.references :user, index: true
      t.string :pin

      t.timestamps null: false
    end
    add_foreign_key :pets, :users
  end
end
