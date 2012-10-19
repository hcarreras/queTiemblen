require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
    @product_comment = comments(:product_comment)
    @brand_comment = comments(:brand_comment)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brand comment" do
    assert_difference('Comment.count') do
      post :create, comment: { title: @brand_comment.title, body: @brand_comment.body, brand_id: @brand_comment.brand_id, user_id: @brand_comment.user_id }
    end

    assert_redirected_to brand_path(@brand_comment.brand_id)
  end

  test "should create product comment" do
    assert_difference('Comment.count') do
      post :create, comment: { title: @product_comment.title, body: @product_comment.body, product_id: @product_comment.product_id, user_id: @product_comment.user_id }
    end

    assert_redirected_to product_path(@product_comment.product_id)
  end


  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    put :update, id: @comment, comment: { body: @comment.body, brand_id: @comment.brand_id, product_id: @comment.product_id, user_id: @comment.user_id }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to comments_path
  end
end
