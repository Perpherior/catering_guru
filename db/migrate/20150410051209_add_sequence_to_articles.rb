class AddSequenceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :sequence, :integer
  end
end
