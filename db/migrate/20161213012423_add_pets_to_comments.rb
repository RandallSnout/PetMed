class AddPetsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pet, :refrences
  end
end
