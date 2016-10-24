class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.references :address, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :addresses
  end
end
