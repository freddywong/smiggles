class ReactionService
  def initialize(smiggle, life, smiggle_params)
    @smiggle = smiggle
    @life = life
    @item = smiggle_params[:item]
    @dropzone = smiggle_params[:dropzone]
  end

  def update_smiggle
    case @item
    when 'waste'
      @smiggle.reaction = { face: waste_to_receiver }      
    else
      @smiggle.reaction = { face: resource_to_receiver }
    end
    @smiggle
  end

  private

  def waste_to_receiver
    case @dropzone
    when 'face'
      'angry'
    when 'trash_can'
      @smiggle.decrease_attribute @item
      @life.calculate_life
      'appreciation'
    end
  end

  def resource_to_receiver
    case @dropzone
    when 'trash_can'
      'surprise'
    else
      @smiggle.increase_attribute @item
      @life.calculate_life
      return
    end
  end
end