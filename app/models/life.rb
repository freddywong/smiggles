class Life < ApplicationRecord
  belongs_to :smiggle
  before_save :death

  def calculate_life
    new_life = %w( food drink happiness waste ).map do |attribute|
      smiggle.calculate attribute
    end
    
    self.amount = new_life.sum  
  end

  private

  def death
    self.died = Time.zone.now if amount == 0
  end
end
