class IdsController < ApplicationController
    def get_id
      render json: { id: SecureRandom.uuid }
    end
  end
  