class AddBigImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :big_image, :string
  end
end
