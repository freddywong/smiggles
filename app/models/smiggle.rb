class Smiggle < ApplicationRecord
  validates :food, :drink, :boredom, :waste, 
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "must be between 0 and 100" } 

  def adjust_attribute attribute
    case attribute
    when 'food'
      increase_food
    when 'drink'
      increase_drink
    when 'boredom'
      decrease_boredom
    end
  end  

  def calculate_happiness
    happiness = %w( food drink boredom waste ).map do |attribute|
      calculate attribute
    end
    self.happiness = happiness.sum  
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

  def increase_boredom
    self.boredom = increase_quantity('boredom') if within_limit? increase_quantity('boredom')
  end

  def decrease_boredom
    self.boredom = decrease_quantity('boredom') if within_limit? decrease_quantity('boredom')
  end

  private

  def calculate attribute
    case attribute
    when 'food', 'drink'
      quantity = self.send(attribute)
    when 'boredom', 'waste'
      quantity = 100 - self.send(attribute)
    end
    quantity * 0.25
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
