class AddAttachmentImageToBalls < ActiveRecord::Migration
  def self.up
    change_table :balls do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :balls, :image
  end
end
