require 'rails_helper'

RSpec.describe "Tones", type: :request do
  describe "GET /tone" do
    it "returns a valid tone" do
      get "/tone"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)

      expect(json).to have_key("tone")
      expect(%w[humorous ironic cynical]).to include(json["tone"])
    end
  end
end

