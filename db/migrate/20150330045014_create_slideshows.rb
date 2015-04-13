class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :title
      t.string :content
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
