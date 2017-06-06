class BroadcastService
  def self.broadcast(smiggle, reaction)
    ActionCable.server.broadcast 'smiggles',
      default_face: smiggle.decorate.default_face,
      reaction: reaction,
      happiness: smiggle.happiness,
      food: smiggle.food,
      drink: smiggle.drink,
      life: smiggle.life
  end
end