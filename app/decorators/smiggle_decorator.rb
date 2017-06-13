class SmiggleDecorator < Draper::Decorator
  delegate_all
  
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
    when life.amount >= 20
      'life-20'
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

  def time_alive
    return 'RIP' if !life
    time_alive = (Time.zone.now - life.created_at) / 3600
    case 
    when time_alive < 1
      "#{(time_alive * 100).round} minutes"
    when time_alive >= 1 && time_alive < 24
      "#{time_alive.round} hours"
    when time_alive >= 24
      "#{(time_alive / 24).round} days"
    end
  end
end
