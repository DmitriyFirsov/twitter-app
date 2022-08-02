# frozen_string_literal: true

require "test_helper"

module Users
  class RegistrationsControllerTest < ActionDispatch::IntegrationTest
    test "should register new user" do
      user_payload = {
        name: "name",
        surname: "surname",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      }

      assert_difference -> { User.count }, 1 do
        post "/user", params: {
          user: user_payload
        }
      end

      new_user = User.find_by(email: user_payload[:email])

      assert_equal "name", new_user.name, "Name not same as in payload"
      assert_equal "surname", new_user.surname, "Surname not same as in payload"
    end
  end
end
