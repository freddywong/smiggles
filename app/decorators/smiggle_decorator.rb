class SmiggleDecorator < Draper::Decorator
  delegate_all

  def default_face
    case 
    when object.life == 100
      'life-100'
    when object.life >= 80
      'life-80'
    when object.life >= 60
      'life-60'
    when object.life >= 40
      'life-40'  
    when object.life >= 20
      'life-20'
    when object.life == 0
      'life-0'
    end
  end

  def faces
    Dir.glob("app/assets/gifs/faces/*.gif").map{ |face| face.split('/').last.gsub('.gif', '') }
  end

  def waste_count
    waste / 20
  end

  def waste_image_path
    ActionController::Base.helpers.image_path("waste.png")
  end
end
