class AddVetColumnToUsers < ActiveRecord::Migration
  def change
  	add_reference :users, :vet, index:true
  end
end
