class RemoveNavigation < ActiveRecord::Migration
  def change
    drop_table :navigations
  end
end
