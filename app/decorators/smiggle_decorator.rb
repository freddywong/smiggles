class SmiggleDecorator < Draper::Decorator
  delegate_all

  def faces
    Dir.glob("app/assets/gifs/faces/*.gif").map{ |face| face.split('/').last.gsub('.gif', '') }
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
