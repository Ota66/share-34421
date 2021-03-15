class AddAvatarAndHeaderImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :string
    add_column :users, :header_image, :string
  end
end
