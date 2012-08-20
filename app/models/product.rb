class Product < ActiveRecord::Base
  attr_accessible :brand_id, :title
  validates :title, :presence => true, :uniqueness => { :message => 'The product already exists'}

  belongs_to :brand
end
