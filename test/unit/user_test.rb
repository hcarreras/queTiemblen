require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User attributes must not be empty" do
  	user = User.new
  	assert user.invalid?
  	assert user.errors[:name].any?
  end

  test "No User facebook must have password" do
  	user = User.new
  	assert !user.save
  	user.name = users(:normal).name
  	user.password = users(:normal).password
  	assert user.save

  	user2 = User.new
  	assert !user2.save
  	user2.name = users(:facebook).name
  	user.provider = users(:facebook).provider
  	assert user2.save
  end
end
