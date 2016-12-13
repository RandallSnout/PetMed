class AddPetsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pet, :references
  end
end
