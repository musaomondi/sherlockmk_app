require 'test_helper'

class UserTest < ActiveSupport::TestCase
def setup
  @user = User.new(name:"amoke musa",
                   email: "amokem@yahoo.com",
                   password: "amolivkev",
                   password_confirmation:"amolivkev")
end
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  test "email should be present" do
   @user.email = ""
    assert_not @user.valid?
  end
  test "password length should not long" do
    @user.password=@user.password_confirmation="a"*5
    assert_not @user.valid?
    
  end
end
