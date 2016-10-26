class AddPhoneToUserAdnVet < ActiveRecord::Migration
  def change
  	add_column :vets, :phone_number, :integer
  	add_column :users, :phone_number, :integer
  end
end
