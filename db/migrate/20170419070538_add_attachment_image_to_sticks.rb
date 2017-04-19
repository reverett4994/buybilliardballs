class AddAttachmentImageToSticks < ActiveRecord::Migration
  def self.up
    change_table :sticks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sticks, :image
  end
end
