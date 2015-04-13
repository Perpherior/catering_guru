class AddAttachmentAttachmentToArticleImgaes < ActiveRecord::Migration
  def self.up
    change_table :article_images do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :article_images, :attachment
  end
end
