class BroadcastService
  def self.broadcast(smiggle)
    ActionCable.server.broadcast 'smiggles',
      default_face: smiggle.default_face,
      reaction: smiggle.reaction,
      waste: smiggle.waste_count,
      happiness: smiggle.happiness,
      food: smiggle.food,
      drink: smiggle.drink,
      life: smiggle.life_amount
  end
end