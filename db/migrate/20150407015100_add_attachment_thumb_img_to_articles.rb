class AddAttachmentThumbImgToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :thumb_img
    end
  end

  def self.down
    remove_attachment :articles, :thumb_img
  end
end
