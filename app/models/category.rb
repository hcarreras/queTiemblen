class Category < ActiveRecord::Base
  attr_accessible :name, :super_category_id
  has_and_belongs_to_many :brands
  has_many :products
  
  validates :name, :presence => true
end
