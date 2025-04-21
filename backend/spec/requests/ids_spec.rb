require 'rails_helper'

RSpec.describe "GET /id", type: :request do
  it "returns a UUID" do
    get "/id"

    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body)
    expect(json["id"]).to match(/\A[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}\z/i)
  end
end
