class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :super_category_id


      t.timestamps
    end
  end
end
