class RenameColumnInArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :user_id, :author_id
  end
end
