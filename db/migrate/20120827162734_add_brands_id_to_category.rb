class AddBrandsIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :brands_id, :array
  end
end
