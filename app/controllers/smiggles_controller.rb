class SmigglesController < ApplicationController
  before_action :get_smiggle, only: [:edit, :update]
  before_action :update_smiggle, only: :update

  def update
    if @smiggle.save && @life.save
      BroadcastService.broadcast(@smiggle)
      head :ok
    end
  end

  private

  def get_smiggle
    @smiggle = Smiggle.first.decorate
    @life = @smiggle.life
  end

  def update_smiggle
    @smiggle = ReactionService.new(@smiggle, @life, params[:smiggle]).update_smiggle
  end
end