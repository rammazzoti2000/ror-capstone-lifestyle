class AddProfileImageToUsres < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_image, :string
  end
end
