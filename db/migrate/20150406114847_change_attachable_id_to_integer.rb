class ChangeAttachableIdToInteger < ActiveRecord::Migration
  def change
  	change_column :attachments, :attachable_id, 'integer USING CAST(attachable_id AS integer)'
  end
end
