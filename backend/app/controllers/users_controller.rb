class UsersController < ApplicationController
    def get_user
      sleep 0.3 # Simulate 300ms delay
      user = User.last || User.create(name: "Test User", biography: "This is a test bio.")
      render json: user
    end
  
    def create_user
      success = [true, false].sample
      if success
        user = User.create(name: "New User", biography: "Generated bio.")
        render json: { status: 'success', user: user }, status: :created
      else
        render json: { status: 'fail', message: 'Random failure' }, status: :unprocessable_entity
      end
    end
  end
  