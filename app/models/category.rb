class Category < ActiveRecord::Base
  attr_accessible :name, :super_category_id
  has_and_belongs_to_many :brands
  has_many :products
  belongs_to :super_category
  
  validates :name, :presence => true
  validates :super_category_id, :presence => true

  default_scope :order => 'lower(name)'
end