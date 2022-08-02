# frozen_string_literal: true

require "test_helper"

module Users
  class RegistrationsControllerTest < ActionDispatch::IntegrationTest
    test "should register new user" do
      user = {
        name: "name",
        surname: "surname",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }

      post "/user", params: {
        user: user
      }

      user_list = User.find_by!(name: user[:name], surname: user[:surname], email: user[:email])
      assert user_list
    end
  end
end
