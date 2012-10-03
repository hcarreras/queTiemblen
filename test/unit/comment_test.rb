require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  fixtures :comments
  fixtures :products
  fixtures :brands

  test "Comments attributes must not be empty" do
  	comment = Comment.new
  	assert comment.invalid?
  	assert comment.errors[:body].any?
  end

  test "Comments must have a valid product or valid brand" do
    comment = Comment.new(:body => "Just a test")
    assert !comment.save

    comment.product_id = comments(:product_comment).product_id
    assert comment.save

    comment2 = Comment.new(:body => "Another thest")
    assert !comment2.save

    comment2.brand_id = comments(:brand_comment).brand_id
    assert comment2.save
  end

end
