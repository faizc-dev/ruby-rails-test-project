using Camille::Syntax

class Camille::Schemas::Id < Camille::Schema
  include Camille::Types

  get :get_id do
    response(
      id: String
    )
  end
end
