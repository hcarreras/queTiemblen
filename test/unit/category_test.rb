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
end
