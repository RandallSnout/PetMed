class AddAttachmentAvatarToVets < ActiveRecord::Migration
  def self.up
    change_table :vets do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :vets, :avatar
  end
end
