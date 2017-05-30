class SmigglesController < ApplicationController
  before_action :get_smiggle, only: [:edit, :update]
  # before_action :broadcast_smiggle, only: [:edit]
  def edit
    
  end

  def update
    if @smiggle.happiness == 80
      @smiggle.happiness = 60
    else
      @smiggle.happiness = 80
    end

    @smiggle.food += 10

    if @smiggle.save
      broadcast_smiggle
    end
  end

  private

  def get_smiggle
    @smiggle = Smiggle.first.decorate
  end

  def broadcast_smiggle
    ActionCable.server.broadcast 'smiggles',
      default_face: @smiggle.decorate.default_face,
      food: @smiggle.food
    head :ok
  end
end