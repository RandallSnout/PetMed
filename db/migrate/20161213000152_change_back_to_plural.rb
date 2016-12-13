class ChangeBackToPlural < ActiveRecord::Migration
  def change

  	rename_column :comments, :pet_id, :pets_id

  end
end
