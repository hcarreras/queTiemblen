class Product < ActiveRecord::Base
  attr_accessible :brand_id, :title
  belongs_to :brand

  validates :title, :presence => true, :uniqueness => { :scope => :brand_id, :case_sensitive => false }
  validates :brand, :presence => {:message => 'The brand no exists'}
end
