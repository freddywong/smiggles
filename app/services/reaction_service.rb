class ReactionService
  def initialize(smiggle, smiggle_params)
    @smiggle = smiggle
    @item = smiggle_params[:item]
    @dropzone = smiggle_params[:dropzone]
  end

  def update_smiggle
    case @item
    when 'waste'
      @smiggle.reaction = {
        face: face
      }      
    else
      @smiggle.increase_attribute @item
      @smiggle.calculate_life
    end
    @smiggle
  end

  private

  def face
    case @dropzone
    when 'face'
      'angry'
    when 'trash_can'
      @smiggle.decrease_attribute @item
      @smiggle.calculate_life
      'appreciation'
    end
  end
end