class ManageSmiggleService

  def self.create_smiggle current_user
    smiggle = Smiggle.create(food: 60, drink: 60, happiness: 60, waste: 60, user_id: current_user.id)
    create_life smiggle.id
  end

  def self.create_life smiggle_id
    Life.create(amount: 60, smiggle_id: smiggle_id) 
  end

  def self.reset_smiggle smiggle_id
    smiggle = Smiggle.find smiggle_id
    smiggle.update(food: 60, drink: 60, happiness: 60, waste: 60)
  end

  def self.update_smiggle(smiggle, life, smiggle_params)
    service = self.new
    service.send(:update_initialize, smiggle, life, smiggle_params)
    service.send(:update_smiggle)
  end

  private

  def update_initialize(smiggle, life, smiggle_params)
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