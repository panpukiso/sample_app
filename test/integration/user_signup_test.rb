require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "User signup info invalid" do
    get new_user_path
    assert_no_difference 'User.count', 0 do
      post users_path, params: { user: { name: "",
                                      email: "example@org",
                                   password: "foo",
                                   password_confirmation: "foo"}}
    end
    assert_template "users/new"
  end
  
  test "User signup info valid" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path,params: { user: {name: "example-user",
                               email: "User@example.org",
                            password: "password",
                            password_confirmation: "password"}}
    end
    follow_redirect!
    assert_template "users/show"
  end
end
