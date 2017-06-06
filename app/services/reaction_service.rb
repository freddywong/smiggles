class ReactionService
  def initialize(item)
    @item = item
  end

  def build_reactions
    {
      face: face
    }
  end

  private

  def face
    case @item
    when 'waste'
      'angry'
    end
  end
end