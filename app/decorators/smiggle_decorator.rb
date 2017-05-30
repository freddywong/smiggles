class SmiggleDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def default_face
    case 
    when object.happiness >= 80
      'happy-100'
    when object.happiness >= 60
      'happy-80'
    end
  end

  def faces
    Dir.glob("app/assets/gifs/faces/*.gif")
  end
end
