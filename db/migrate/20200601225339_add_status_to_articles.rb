class AddStatusToArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :image, :featured_image
    add_column :articles, :status, :string
  end
end
