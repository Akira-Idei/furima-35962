class RenameCategolyIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :categoly_id, :category_id
  end
end
