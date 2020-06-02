class AddViewsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :views, :integer, default: 0
  end
end
