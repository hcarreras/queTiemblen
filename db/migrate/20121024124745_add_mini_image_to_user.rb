class AddMiniImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :mini_image, :string
  end
end
