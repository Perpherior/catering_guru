class RenameTitleToNameInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :title, :name
  end
end
