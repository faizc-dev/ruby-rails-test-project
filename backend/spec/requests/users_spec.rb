require 'rails_helper'

RSpec.describe "Users API", type: :request do
  describe "GET /user" do
    it "returns a successful response with a user" do
      get "/user"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("name")
    end
  end

  describe "POST /user" do
    it "creates a user successfully (when not simulating failure)" do
      post "/user", params: { user: { name: "John Doe", biography: "Test biography" } }
      expect(response).to have_http_status(:created)
      expect(response.body).to include("status")
      expect(response.body).to include("user")
    end

    it "simulates failure (50% chance)" do
      post "/user", params: { user: { name: "Jane Doe", biography: "Another bio" } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include("status")
      expect(response.body).to include("fail")
    end
  end
end
