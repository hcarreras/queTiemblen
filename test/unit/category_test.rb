require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Categories name should not be empty" do
  	category = Category.new
  	assert !category.save
  	assert category.errors[:name].any?
  end

  test "Category must have a valid super_category" do
  	category = Category.new(:name => "clocks")
  	assert !category.save

  	category.super_category_id = categories(:one).super_category_id
  	assert category.save
  end
end
