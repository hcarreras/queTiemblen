class Brand < ActiveRecord::Base
  attr_accessible :category_id, :name
  validates :name, :presence => true, :uniqueness => { :message => 'The brand already exists'}
  has_and_belongs_to_many :categories

  has_many :products, :dependent => :destroy
end
