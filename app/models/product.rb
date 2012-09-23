class Product < ActiveRecord::Base
  attr_accessible :brand_id, :category_id, :title, :image
  belongs_to :brand
  belongs_to :category

  mount_uploader :image, ImageUploader

  validates :title, :presence => true, :uniqueness => { :scope => :brand_id, :case_sensitive => false, :message => 'The product already exists' }
  validates :brand, :presence => {:message => 'The brand no exists'}
  validates :category, :presence => {:message => 'The category no exists'}
end
