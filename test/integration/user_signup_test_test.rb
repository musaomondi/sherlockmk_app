require 'test_helper'

class UserSignupTestTest < ActionDispatch::IntegrationTest
  test "sign up with valid params " do
    get new_user_path
    assert_template 'new'
    assert_difference 'User.count', 1 do
      post users_path params: { user: {name: "Oliver Okwaro",
                                       email: "oliver@gmail.com",
                                       password: "amolivkev",
                                       password_confirmation: "amolivkev"}} 
    end
    assert_redirected_to User.last
    follow_redirect!
    assert_select "p", User.last.email
  end

  test "sign up with invalid params" do
    get new_user_path
    assert_template 'new'
    assert_no_difference 'User.count' do
      post users_path params: { user: {name: "",
                                       email: "dave@gmail.com",
                                       password: "adein",
                                       password_confirmation: "ad"}}
      assert_template 'new'


    end
  end
end
