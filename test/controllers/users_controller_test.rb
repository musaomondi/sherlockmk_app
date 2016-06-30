require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
    
  end

  test "should redirect to home" do
    post users_url, params: {
      user: {
        name:"Amoke musa" ,
        email:"amokem@yahoo.com",
        password: "password",
        password_confirmation: "password"
      }
    }

   assert_redirected_to User.last
   assert_equal "You successfully signed up",flash[:success]
  end

  test "renders new with invalid params" do
    post users_url, params: {
      user: {
         name: "",
         email: "kevinsantos",
         password: "pass",
         password_confirmation: "word"
      }
    }
    assert_template 'new'
  end

  # test "should get edit" do
  #   get 
  #   assert_response :success
  # end

  # test "should get show" do
  #   get 
  #   assert_response :success
  # end

end
