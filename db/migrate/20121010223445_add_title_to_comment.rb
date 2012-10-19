class AddTitleToComment < ActiveRecord::Migration
  def change
    add_column :comments, :title, :string
  end
end
