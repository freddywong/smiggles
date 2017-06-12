class UpdateSmiggleService
  def initialize smiggle_id
    @smiggle = Smiggle.find smiggle_id
    @life = @smiggle.life
  end

  def self.update_attributes smiggle_id
    self.new(smiggle_id).send(:update_attributes)
  end

  private

  def update_attributes 
    decrease_attributes
    increase_attributes
    @life.calculate_life
    @smiggle.save && @life.save
  end

  def decrease_attributes 
    %w(food drink happiness).each do |attribute|
      @smiggle.decrease_attribute attribute
    end
  end

  def increase_attributes
    @smiggle.increase_attribute 'waste'
  end
end