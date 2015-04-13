class AddColumnsToNavigations < ActiveRecord::Migration
  def change
    add_column :navigations, :nav_token, :string

    Navigation.all.each do |nav|
      nav_token = nav.name.parameterize
      nav.update(nav_token: nav_token)
    end
  end
end
