class ChangePhoneNumberColumnInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :phone_number, :string
  	change_column :vets, :phone_number, :string
  end
end
