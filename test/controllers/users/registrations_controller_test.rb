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

      assert_changes -> { User.find_by(email: user_payload[:email]) }, "User not added" do
        post "/user", params: {
          user: user_payload
        }
      end

      new_user = User.find_by(email: user_payload[:email])

      assert new_user.name == user_payload[:name], "Name not same as in payload"
      assert new_user.surname == user_payload[:surname], "Surname not same as in payload"
    end
  end
end
