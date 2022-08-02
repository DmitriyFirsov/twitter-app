require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  it "should register new user" do
    user_payload = {
      name: "name",
      surname: "surname",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post "/user", params: {
      user: user_payload
    }

    new_user = User.find_by(email: user_payload[:email])

    expect(new_user).not_to eq(nil)
    expect(new_user.name).to eq(user_payload[:name])
    expect(new_user.surname).to eq(user_payload[:surname])
  end
end
