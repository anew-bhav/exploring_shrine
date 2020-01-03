class AddProfileImageDataToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_image_data, :jsonb
  end
end
