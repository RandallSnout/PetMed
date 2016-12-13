class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :note
      t.references :pet, index: true
      t.references :vet, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :pets
    add_foreign_key :comments, :vets
  end
end
