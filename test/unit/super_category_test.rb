require 'test_helper'

class SuperCategoryTest < ActiveSupport::TestCase
  test "Super categories attributes must not be empty" do
  	super_category = SuperCategory.new
  	assert !super_category.save
  	assert super_category.errors[:name].any?
  end
end
