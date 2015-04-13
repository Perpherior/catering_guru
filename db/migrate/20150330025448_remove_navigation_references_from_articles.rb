class RemoveNavigationReferencesFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :navigation_id
  end
end
