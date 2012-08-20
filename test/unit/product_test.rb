require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :products

  test "Product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  end

  test "Product is not valid without a unique title" do
  	product = Product.new(:title	=> products(:hairdress).title,
  						  :brand_id =>2)
  	assert !product.save
  	assert_equal "The product already exists", product.errors[:title].join('; ')
  end
end
