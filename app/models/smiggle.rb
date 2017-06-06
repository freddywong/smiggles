class Smiggle < ApplicationRecord
  validates :food, :drink, :happiness, :waste, 
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "must be between 0 and 100" }  

  def increase_attribute attribute
    case attribute
    when 'food'
      increase_food
    when 'drink'
      increase_drink
    when 'happiness'
      increase_happiness
    end
  end  

  def calculate_life
    life = %w( food drink happiness waste ).map do |attribute|
      calculate attribute
    end
    self.life = life.sum  
  end

  private

  def calculate attribute
    case attribute
    when 'food', 'drink', 'happiness'
      quantity = self.send(attribute)
    when 'waste'
      quantity = 100 - self.send(attribute)
    end
    quantity * 0.25
  end

  def increase_food 
    self.food = increase_quantity('food') if within_limit? increase_quantity('food')
  end

  def decrease_food 
    self.food = decrease_quantity('food') if within_limit? decrease_quantity('food')
  end

  def increase_drink 
    self.drink = increase_quantity('drink') if within_limit? increase_quantity('drink')
  end

  def decrease_drink 
    self.drink = decrease_quantity('drink') if within_limit? decrease_quantity('drink')
  end

  def increase_happiness
    self.happiness = increase_quantity('happiness') if within_limit? increase_quantity('happiness')
  end

  def decrease_happiness
    self.happiness = decrease_quantity('happiness') if within_limit? decrease_quantity('happiness')
  end  

  def increase_quantity attribute 
    self.send(attribute.to_sym) + 20
  end

  def decrease_quantity attribute 
    self.send(attribute.to_sym) - 20
  end

  def within_limit? quantity
    quantity.between?(0, 100)
  end
end
