class AddTitleTokenToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :nav_token, :string

    Article.all.each do |article|
      nav_token = article.title.parameterize
      article.update(nav_token: nav_token) if article.nav_token.nil?
    end
  end
end
