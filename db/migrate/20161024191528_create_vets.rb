class CreateVets < ActiveRecord::Migration
  def change
    create_table :vets do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :office_name
      t.string :password_digest
      t.references :address, index: true

      t.timestamps null: false
    end
    add_foreign_key :vets, :addresses
  end
end
