class Life < ApplicationRecord
  belongs_to :smiggle

  def calculate_life
    new_life = %w( food drink happiness waste ).map do |attribute|
      smiggle.calculate attribute
    end
    
    self.amount = new_life.sum  
  end
end
