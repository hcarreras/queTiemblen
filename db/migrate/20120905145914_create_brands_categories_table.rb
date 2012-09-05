class CreateBrandsCategoriesTable < ActiveRecord::Migration
  def up
  	create_table :brands_categories, :id => false do |t|
        t.references :brand
        t.references :category
    end
    add_index :brands_categories, [:brand_id, :category_id]
  end

  def down
    drop_table :brands_categories

  end
end
