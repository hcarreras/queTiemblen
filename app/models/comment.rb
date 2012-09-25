class Comment < ActiveRecord::Base
  attr_accessible :body, :brand_id, :product_id, :user_id
  belongs_to :brand
  belongs_to :product
  belongs_to :brand
end
