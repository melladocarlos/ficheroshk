class AddAttachmentPhotoToFichas < ActiveRecord::Migration
  def self.up
    change_table :fichas do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :fichas, :photo
  end
end
