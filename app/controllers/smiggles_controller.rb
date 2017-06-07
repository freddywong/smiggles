class SmigglesController < ApplicationController
  before_action :get_smiggle, only: [:edit, :update]
  before_action :update_smiggle, only: :update

  def update
    if @smiggle.save
      BroadcastService.broadcast(@smiggle)
      head :ok
    end
  end

  private

  def get_smiggle
    @smiggle = Smiggle.first.decorate
  end

  def update_smiggle
    @smiggle = ReactionService.new(@smiggle, params[:smiggle]).update_smiggle
  end
end