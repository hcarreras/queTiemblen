class Brand < ActiveRecord::Base
  attr_accessible :category_ids, :name
  has_and_belongs_to_many :categories
  has_many :products, :dependent => :destroy
  validates :name, :presence => true



end
