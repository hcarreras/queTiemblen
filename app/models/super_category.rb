class SuperCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :categories

  validates :name, :presence => true, :uniqueness => {:message => 'The name already exists'}
end
