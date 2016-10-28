class ChangeAllAssociationsToSingular < ActiveRecord::Migration
  def change

  	 rename_column :shots, :pets_id, :pet_id
  	 rename_column :records, :pets_id, :pet_id
  	 rename_column :comments, :vets_id, :vet_id
  	 rename_column :comments, :pets_id, :pet_id

  end
end
