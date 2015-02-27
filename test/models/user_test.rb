require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Test User", email: "testUser@test.com", password: "hello!", password_confirmation: "hello!")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be non-empty" do
    @user.name = " "
    assert_not @user.valid?
  end
  
  test "name should not be longer than 50 characters" do
    @user.name = ("a" * 51)
    assert_not @user.valid?
  end
  
  test "email should be non-empty" do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "email should not be longer than 255 characters" do
    @user.email = ("a"*244)+"@example.com" #256 characters
    assert_not @user.valid?
  end
  
  test "email validation should reject emails with invalid address formats" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email address should not be a duplicate of an existing email" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password should be at least 6 characters long" do
    @user.password = "a"*5
    @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
end