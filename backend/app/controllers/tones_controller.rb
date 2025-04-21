class TonesController < ApplicationController
    def show
      tones = ["humorous", "ironic", "cynical"]
      render json: { tone: tones.sample }
    end
  end
  