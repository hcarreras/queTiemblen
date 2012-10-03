class Comment < ActiveRecord::Base
  attr_accessible :body, :brand_id, :product_id, :user_id
  belongs_to :brand
  belongs_to :product
  belongs_to :brand

  validates :brand, :presence => {:unless => :product_id?, :message => "The comment must belongs to a brand or product"}
  validates :product, :presence => {:unless => :brand_id?, :message => "The comment must belongs to a brand or product"}
  validates :body, :presence => true
end
