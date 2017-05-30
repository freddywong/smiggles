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
      h.image_path("happy-100.gif")  
    when object.happiness >= 60
      h.image_path("happy-80.gif")
    end
  end
end
