class AddCategoriesIdToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :categories_id, :array
  end
end
