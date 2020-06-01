class RenameImageToFeaturedImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :image, :featured_image
  end
end
