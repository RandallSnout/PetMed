class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :note
      t.references :pets, index: true
      t.references :vets, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :pets
    add_foreign_key :comments, :vets
  end
end
