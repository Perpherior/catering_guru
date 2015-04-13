class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :content
      t.references :navigation, index: true

      t.timestamps null: false
    end
  end
end
