class Smiggle < ApplicationRecord
  validates :food, :drink, :happiness, :waste, 
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "must be between 0 and 100" }  

  has_many :lives
  belongs_to :user
  validates :user_id, uniqueness: true

  attr_accessor :reaction

  def increase_attribute attribute
    case attribute
    when 'food'
      increase_food
    when 'drink'
      increase_drink
    when 'happiness'
      increase_happiness
    when 'waste'
      increase_waste
    end
  end  

  def decrease_attribute attribute
    case attribute
    when 'food'
      decrease_food
    when 'drink'
      decrease_drink
    when 'happiness'
      decrease_happiness      
    when 'waste'
      decrease_waste
    end
  end

  def life
    lives.where(died: nil).first
  end

  def life_amount
    life ? life.amount : '0'
  end

  def calculate attribute
    case attribute
    when 'food', 'drink', 'happiness'
      quantity = self.send(attribute)
    when 'waste'
      quantity = 100 - self.send(attribute)
    end
    quantity * 0.25
  end

  def default_face
    return 'life-0' if !life
    case 
    when life.amount == 100
      'life-100'
    when life.amount >= 80
      'life-80'
    when life.amount >= 60
      'life-60'
    when life.amount >= 40
      'life-40'  
    when life.amount > 0 || life.amount >= 20
      'life-20'
    end
  end

  def waste_count
    waste / 20
  end

  private

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

  def increase_waste
    self.waste = increase_quantity('waste') if within_limit? increase_quantity('waste')
  end

  def decrease_waste
    self.waste = decrease_quantity('waste') if within_limit? decrease_quantity('waste')
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
