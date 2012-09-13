require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :brands, :brands_categories

  test "Brand attributes must not be empty" do
  	brand = Brand.new
  	assert brand.invalid?
  	assert brand.errors[:name].any?
  end

 
end
