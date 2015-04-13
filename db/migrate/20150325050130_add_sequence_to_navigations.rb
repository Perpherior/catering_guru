class AddSequenceToNavigations < ActiveRecord::Migration
  def change
    add_column :navigations, :sequence, :integer, default: 0
  end
end
