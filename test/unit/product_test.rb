require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :products
  fixtures :brands
  fixtures :categories
  fixtures :brands_categories

  test "Product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  end

  test "Product is not valid without a unique title in the same brand" do
  	product = Product.new(:title	=> products(:hairdress).title,
  						  :brand_id => products(:hairdress).brand_id, :category_id => products(:hairdress).category_id)
  	assert !product.save
  	assert_equal "The product already exists", product.errors[:title].join('; ')

    #this brand must exists and be different that the older one
    brand = Brand.new(:name => brands(:adidas).name)
    brand.save

    product.brand_id = brand.id
    assert product.save
  end



  test "Product must have a valid brand" do
    product = Product.new(:title => "unicorn", :category_id => products(:one).category_id)
    assert !product.save
    #assert_equal "The brand no exists", product.errors[:brand_id].join('; ')

    brand = Brand.new(:name => brands(:adidas).name)
    brand.save

    product.brand_id = brand.id
    assert product.save

  end

  test "Product must have a valid category" do
    product = Product.new(:title => "unicorn", :brand_id => products(:one).brand_id)
    assert !product.save

    product.category_id = products(:one).category_id
    assert product.save
  end

  test "The brand allways belongs to a category" do
    category = categories(:bath)
    assert category.save
    brand = brands(:ikea)
    assert brand.save
    product = Product.new(:title => "towell", :brand_id => brand.id, :category_id => category.id )
    assert product.save

    #If the brand don't belongs to that category, then automatically be included
    assert brand.category_ids.include?(category.id)
  end
end
