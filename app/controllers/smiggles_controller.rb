class SmigglesController < ApplicationController
  before_action :get_smiggle, only: [:edit, :update]
  def edit
    
  end

  def update
    @smiggle.increase_attribute(params[:item])
    @smiggle.calculate_life

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
      happiness: @smiggle.happiness,
      food: @smiggle.food,
      drink: @smiggle.drink,
      life: @smiggle.life
    head :ok
  end
end