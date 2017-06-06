class SmigglesController < ApplicationController
  before_action :get_smiggle, only: [:edit, :update]
  before_action :smiggle_response, only: :update
  def edit
    
  end

  def update
    if @smiggle.save
      BroadcastService.broadcast(@smiggle, @reaction)
      head :ok
    end
  end

  private

  def get_smiggle
    @smiggle = Smiggle.first.decorate
  end

  def smiggle_response
    case params[:smiggle][:item]
    when "waste"
      @reaction = ReactionService.new(params[:smiggle][:item]).build_reactions
    else
      @smiggle.increase_attribute params[:smiggle][:item]
      @smiggle.calculate_life
    end
  end
end