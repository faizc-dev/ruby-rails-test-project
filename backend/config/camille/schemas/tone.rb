using Camille::Syntax

class Camille::Schemas::Tone < Camille::Schema
  include Camille::Types

  get :get_tone do
    response(
      tone: String
    )
  end
end
