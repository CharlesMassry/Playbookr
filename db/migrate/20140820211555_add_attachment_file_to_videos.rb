class AddAttachmentFileToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :videos, :file
  end
end
