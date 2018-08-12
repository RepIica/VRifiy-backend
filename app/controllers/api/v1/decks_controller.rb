class Api::V1::DecksController < ApplicationController

  def index
    @cards = Deck.all
    render json: @cards#, status: status

  end

  def show
    @card = Deck.find(params[:id])
    render json: @card
  end

end
