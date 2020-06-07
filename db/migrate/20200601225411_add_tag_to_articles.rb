class AddTagToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :tag, :string
  end
end
