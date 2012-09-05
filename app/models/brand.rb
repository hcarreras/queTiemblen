class Brand < ActiveRecord::Base
  attr_accessible :category_ids, :name
  validates :name, :presence => true
  has_and_belongs_to_many :categories

  has_many :products, :dependent => :destroy
end
