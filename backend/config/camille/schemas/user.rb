using Camille::Syntax

class Camille::Schemas::User < Camille::Schema
  include Camille::Types

  get :get_user do
    # Define response structure for GET /user
    response(
      id: Number,
      name: String,
      biography: String
    )
  end

  post :create_user do
    # Define params and response structure for POST /user
    params(
      name: String,
      biography: String
    )
    response(
      status: String,
      user: {
        id: Number,
        name: String,
        biography: String
      }
    )
  end
end
