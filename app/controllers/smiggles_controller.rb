class SmigglesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_smiggle, only: :update
  before_action :update_smiggle, only: :update

  def create
    create_smiggle
    current_user.reload
    redirect_to action: 'edit'
  end

  def edit
    if !current_user.smiggle
      create_smiggle
      current_user.reload
    end
    get_smiggle
  end

  def resurrect
    create_life
    reset_smiggle
    redirect_to action: 'edit'
  end

  def update
    if @smiggle.save && @life.save
      BroadcastService.broadcast(@smiggle)
      head :ok
    end
  end

  private

  def get_smiggle
    @smiggle = current_user.smiggle.decorate
    @life = @smiggle.life
  end

  def create_life
    ManageSmiggleService.create_life params[:smiggle_id]
  end

  def create_smiggle
    ManageSmiggleService.create_smiggle current_user
  end

  def reset_smiggle
    ManageSmiggleService.reset_smiggle params[:smiggle_id]
  end

  def update_smiggle
    ManageSmiggleService.update_smiggle(@smiggle, @life, params[:smiggle])
  end
end