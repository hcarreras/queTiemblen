require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :products
  fixtures :brands

  test "Product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  end

  test "Product is not valid without a unique title in the same brand" do
  	product = Product.new(:title	=> products(:hairdress).title,
  						  :brand_id => products(:hairdress).brand_id)
  	assert !product.save
  	assert_equal "The product already exists", product.errors[:title].join('; ')

    #this brand must exists and be different that the older one
    brand = Brand.new(:name => brands(:adidas).name)
    brand.save

    product.brand_id = brand.id
    assert product.save
  end



  test "Product must have a valid brand" do
    product = Product.new(:title => "unicorn")
    assert !product.save
    #assert_equal "The brand no exists", product.errors[:brand_id].join('; ')

    brand = Brand.new(:name => brands(:adidas).name)
    brand.save

    product.brand_id = brand.id
    assert product.save

  end

end
