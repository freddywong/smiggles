class SmigglesController < ApplicationController
  before_action :get_smiggle, only: [:edit, :update]
  def edit
    
  end

  def update
    if @smiggle.happiness == 80
      @smiggle.happiness = 60
    else
      @smiggle.happiness = 80
    end
    
    if @smiggle.save
      ActionCable.server.broadcast 'smiggles',
        default_face: @smiggle.decorate.default_face
      head :ok
    end
  end

  private

  def get_smiggle
    @smiggle = Smiggle.first.decorate
  end

end