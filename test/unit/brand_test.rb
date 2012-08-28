require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :brands

  test "Brand attributes must not be empty" do
  	brand = Brand.new
  	assert brand.invalid?
  	assert brand.errors[:name].any?
  end

  test "Brand is not valid without a unique title" do
  	brand = Brand.new(:name	=> brands(:apple).name,
  						  :category_id =>2)
  	assert !brand.save
  	assert_equal "The brand already exists", brand.errors[:name].join('; ')
  end    
end
