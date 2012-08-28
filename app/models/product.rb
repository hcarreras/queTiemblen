class Product < ActiveRecord::Base
  attr_accessible :brand_id, :title
  belongs_to :brand

  validates :title, :presence => true, :uniqueness => { :message => 'The product already exists'}
  validates :brand, :presence => {:message => 'The brand no exists'}


end
